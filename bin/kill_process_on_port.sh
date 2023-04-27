#!/bin/sh

# Get port from command-line argument.
  port="$1"

# Get id belonging to process running on port.
  pid="$(sudo lsof -t -i:$port)"

# If no process is running there: Exit.
  if [ "$pid" =  "" ]; then
      echo " -> No process running on port $port."
      exit
  fi

# Kill process.
  sudo kill "$pid"
  echo " -> Killed process $pid running on port $port."
