#!/usr/bin/env python3

from rofi import Rofi
import todoist, json, yaml, os, sys, uuid

CONFIG_LOCATION = os.path.join(os.environ["HOME"], '.todoist.config.json')
DATA_LOCATION = os.path.join(os.environ["HOME"], '.local/share/rofi_todoist/data.yaml')

def main():
  rofi = Rofi()
  #if not os.path.exists(DATA_LOCATION):
  #  try:
  #    os.makedirs(os.path.dirname(DATA_LOCATION))
  #  except OSError:
  #    pass
#
  #  with open(DATA_LOCATION, "w+") as f:
  #    yaml.dump({}, stream=f)
#
  #with open(DATA_LOCATION) as f:
  #  data = yaml.load(f)
#
  ##validate data and whatnot
  #if "current_project" not in data:
  #  data["current_project"] = "Inbox"

  # Ask user what to add
  task_text = rofi.text_entry("Create new task")
  if task_text == None:
    return

  # Login to todoist
  with open(os.path.join(os.environ["HOME"],'.todoist.config.json')) as f:
    todoist_creds = json.load(f)
  #user = todoist.login_with_api_token(todoist_creds["token"])

  #project = user.get_project(data["current_project"])
  #if project == None:
  #  project = user.add_project(data["current_project"])

  api = todoist.TodoistAPI(todoist_creds["token"])
  api.quick.add(task_text)

  #project.add_task(task_text)


if __name__ == '__main__':
  main()