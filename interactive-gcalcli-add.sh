#!/usr/bin/python3

import sys
import os

# insert your email address
comm = "gcalcli add --calendar user@host"

eTitle = input("Title: ")
if len(eTitle) < 1:
    print("Title must be set.")
    sys.exit(1)

comm += " --title \"" + eTitle + "\""

eTime = input("When: ")
if len(eTime) < 1:
    print("Time must be set.")
    sys.exit(2)

comm += " --when \"" + eTime + "\""

eDur = input("Duration (mins): ")
try:
    if len(eDur) < 0 or int(eDur) < 0:
        eDur = 60
except ValueError:
    eDur = 60

comm += " --duration " + str(eDur)

eLoc = input("Where: ")
if len(eLoc) > 0:
    comm += " --where \"" + eLoc + "\""

eDesc = input("Description: ")
if len(eDesc) > 0:
    comm += " --description \"" + eDesc + "\""

colors = ['none', 'blue', 'green', 'purple', 'red', 'yellow', 'orange', 'turquoise', 'grey', 'bold blue', 'bold green', 'bold red']

eColor = input("Color ("+str(colors)+"): ")
try:
    if len(eColor) > 0:
        if eColor in colors:
            comm += " --eColor \"" + str(colors.index(eColor)) + "\""
        elif (int(eColor) < len(colors) and int(eColor) >= 0):
            comm += " --eColor \"" + eColor + "\""
except ValueError:
    pass

os.system(comm)
