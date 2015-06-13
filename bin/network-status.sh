#! /bin/sh

if ping -c 1 -W 2 $1 > /dev/null; then
  echo ""
else
  echo ""
fi
