#!/bin/bash

source $WSYS/zsh/files/.zshenv

export OS=${OS:-ubuntu}

export COMPONENT_NAME=$1
export COMPONENT_ACTION=$2
export COMPONENT_DIR="$WSYS/$1"

if [ ! -d $COMPONENT_DIR  ]
then
  echo "$COMPONENT_NAME is not a valid component" >&2
  exit 1
fi

ACTION_FILE_PATH_WITHOUT_OS="$COMPONENT_DIR/${COMPONENT_ACTION}.sh"
ACTION_FILE_PATH_WITH_OS="$COMPONENT_DIR/${COMPONENT_ACTION}_$OS.sh"
ACTION_FILE_PATH=""

if [ -f $ACTION_FILE_PATH_WITH_OS ]
then
    ACTION_FILE_PATH=$ACTION_FILE_PATH_WITH_OS
fi
if [ -f $ACTION_FILE_PATH_WITHOUT_OS ]
then
    ACTION_FILE_PATH=$ACTION_FILE_PATH_WITHOUT_OS
fi

if [ -z ${ACTION_FILE_PATH} ]
then
    echo "Action $COMPONENT_ACTION does not exist for $COMPONENT_NAME" >&2
    echo "Looked for script ${ACTION_FILE_PATH_WITH_OS}" >&2
    echo "Looked for script ${ACTION_FILE_PATH_WITHOUT_OS}" >&2
    exit
fi



echo "Running $ACTION_FILE_PATH"
. $ACTION_FILE_PATH

