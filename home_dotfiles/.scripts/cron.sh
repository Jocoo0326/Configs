#!/bin/sh

env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "$(date)"
