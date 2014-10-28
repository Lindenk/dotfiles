#!/bin/env python

from datetime import datetime

def update():
  return datetime.now().strftime("%b %d, %I:%M:%S %p")


