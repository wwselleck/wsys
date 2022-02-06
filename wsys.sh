#!/bin/bash

source "$WSYS"/zsh/files/.zshenv
source "$WSYS"/util.sh

export OS=${OS:-ubuntu}

export COMPONENT_NAME_OR_ACTION=$1

if [[ "$COMPONENT_NAME_OR_ACTION" = "edit" ]]; then
    COMPONENT_NAME=$2
    if COMPONENT_DIR=$(wsys path "$COMPONENT_NAME"); then
        "$VISUAL" "$COMPONENT_DIR"
    else
        echo $?
        exit 0
    fi
fi

if [[ "$COMPONENT_NAME_OR_ACTION" = "path" ]]; then
    COMPONENT_NAME=$2
    COMPONENT_DIR="$WSYS/$COMPONENT_NAME"
    if [ ! -d "$COMPONENT_DIR"  ]
    then
      echo "$COMPONENT_NAME is not a valid component" >&2
      exit 1
    fi
    echo $COMPONENT_DIR
    exit 0
fi

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


# Utility commands for subshells to use

# Get file local to component
file_path() {
    echo "$COMPONENT_DIR/files/$1"
}

echo "Running $ACTION_FILE_PATH"
. "$ACTION_FILE_PATH"

