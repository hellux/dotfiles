#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from os import listdir
import json

def get_governor():
    """ Get the current governor for cpu0, assuming all CPUs use the same. """
    gov = ''
    with open('/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor') as fp:
        gov = fp.readlines()[0].strip().title()
    color = '#AA0000' if gov == 'Performance' else '#BBBBBB'
    return gov, color

def get_temperature():
    """ Get the current temperature for one of the CPU cores. """
    temp = 0
    hw = listdir('/sys/devices/platform/coretemp.0/hwmon')[0]
    with open('/sys/devices/platform/coretemp.0/hwmon/%s/temp4_input' % hw) as fp:
        temp = int(int(fp.readlines()[0].strip()) / 1000 + .5)
    color = '#AA0000' if temp > 56 else '#BBBBBB'
    temp = str(temp) + " °C"
    return temp, color

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

def insert(pos, name, text, color):
    j.insert(pos, {'full_text' : text, 'name' : name, 'color' : color })


if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert to json
        insert(4, 'governor', *get_governor())
        insert(5, 'temperature', *get_temperature())
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
