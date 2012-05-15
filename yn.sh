#!/usr/bin/env bash

## find the directory that this script resides in
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

## set up the YN_DIR
export YN_DIR=$DIR

## set up environment
IO=`which io`
YN="$YN_DIR\yn_runner.io"

## run Yellow Notes
$IO $YN "$@"
