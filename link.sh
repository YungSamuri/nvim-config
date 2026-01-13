#!/bin/bash

# When the DRYRUN environment variable is non-empty or the -d option (d for dryrun) is set, 
# do not actually make any changes, but only show what would be done

set -e

usage() {
  echo "
Usage:
  link.sh [options]

Link nvim config to home directory.

Options:
  -h, --help    display this help
  -d, --dryrun  print the commands that will be run, but don't actually run them
  -r, --remove  clean up old files or symlinks
"
}

echodo() {
  echo $@
  [[ 0"$DRYRUN" == "0" ]] && $@
}

link() {
  if [[ $# -lt 2 ]]; then
    echo Error: missing SOURCE_NAME or DEST_NAME for link function &>2
  fi
}

# Process paramters
PARAMS="$(getopt -o hdr -l help,dryrun,remove --name "$0" -- "$@")"

if [[ $? -ne 0 ]]; then
  usage
fi

eval set -- "$PARAMS"
unset PARAMS

while [[ "$1" != "" ]]; do
  case "$1" in
    -h|--help)
      usage
      exit
      ;;
    -d|--dryrun)
      DRYRUN=true
      shift
      ;;
    -r|--remove)
      REMOVE=true
      shift
      ;;
  esac
done
