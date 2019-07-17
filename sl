#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: sl [SEARCH TERM]"
  exit
else
  FOUND=0
  IFS=$'\n'
  for proc in `ps -u $USER | grep -e " $1" | grep -v -E "(grep|\/sl)"`
  do
    echo "$USER's process:"
    FOUND=1
    echo $proc
  done
  if [ $FOUND -ne 1 ]
  then
    for proc in `ps -u root | grep -e " $1" | grep -v -E "(grep|\/sl)"`
    do
      echo "root process:"
      FOUND=1
      echo $proc
    done
    if [ $FOUND -ne 1 ]
    then
      RET="Process not found."
    fi
  fi
fi

unset IFS
