#!/bin/python

# This script will load modules and run a start script
# to create a awesome text for bar creation tool

import os, imp, heapq, select, types
from datetime import datetime

loaded_modules = {}
module_list = [] #to keep module order by name
builtins = []

#heap to hold next intervaled updates
schedule = []

def Builtin(f):
  builtins.append(f)
  return f

@Builtin
def load_module(name, path, interval=None, only_execute=False):
  #file i/o
  try:
    file = open(path)
    code = file.read()
    file.close()
  except:
    print("Was unable to open %s at: %s" % (name, path))
    return

  #add in builtins
  module = imp.new_module(name)
  for f in builtins:
    setattr(module, f.__name__, f)

  #load the module
  try:
    exec(code, module.__dict__)
  except:
    import traceback
    traceback.print_exc()
    return

  if not only_execute:
    m = types.SimpleNamespace()
    m.module = module
    m.interval = interval
    m.last_message = ""

    loaded_modules[name] = m
    module_list.append(name)

@Builtin
def refresh():
  '''
  Does a full text refresh and outputs it to stdout
  '''
  outstr = ""
  for name in module_list:
    outstr += loaded_modules[name].last_message
  print('%s' % outstr)

if __name__ == '__main__':

  FIFO_PATH = '/home/lindenk/.config/taigler/fifo'
  START_SCRIPT_PATH = '/home/lindenk/.config/taigler/start.py'

  #Load start script
  load_module('dummy', START_SCRIPT_PATH, only_execute=True)

  #Run all modules' update methods
  for m in loaded_modules.values():
    msg = m.module.update()
    if msg:
      m.last_message = msg

    #schedule it to updated after interval seconds
    if m.interval:
      heapq.heappush(schedule, (datetime.now().timestamp() + m.interval,
        m.module.__name__))

  refresh()

  #Open a fifo for incoming messages
  fifo = os.open(FIFO_PATH, os.O_RDONLY|os.O_NONBLOCK)

  #Wait for a refresh message and wake up for interval updates
  try:
    while True:
      if schedule:
        next_interval = schedule[0][0] - datetime.now().timestamp()

        if next_interval <= 0:
          #do it now. (RIGHT right, I cant make this a function cause of
          #            python scoping >.>)
          #interval timed out
          module = heapq.heappop(schedule)

          #put it back for later
          heapq.heappush(schedule,
            (module[0] + loaded_modules[module[1]].interval, module[1]))
          module = loaded_modules[module[1]].module

          #execute update method for the module
          module.update()

          continue
      else:
        next_interval = None

      r, _, _ = select.select([fifo],[],[], next_interval)

      msg = None
      if r:
        #we got a message
        message = os.read(fifo, 8192)[:-1].decode()

        #find and update the corrisonding module
        try:
          module = loaded_modules[message]
          msg = module.module.update()
        except Exception as e:
          #raise
          continue
        finally:
          #refresh fifo so select will block again >.>
          os.close(fifo)
          fifo = os.open(FIFO_PATH, os.O_RDONLY|os.O_NONBLOCK)
      else:
        #interval timed out
        module = heapq.heappop(schedule)

        #put it back for later
        heapq.heappush(schedule,
          (module[0] + loaded_modules[module[1]].interval, module[1]))
        module = loaded_modules[module[1]]

        #execute update method for the module
        msg = module.module.update()

      if msg:
        module.last_message = msg

      refresh()

  except KeyboardInterrupt:
    pass
  finally:
    os.close(fifo)
