#!/bin/bash
set -e

source ./zsh/files/.zshenv

mkdir -p $NVIMCONFIG

export OS=${OS:-ubuntu}

export COMPONENT_NAME=$1
export COMPONENT_ACTION=$2
export COMPONENT_DIR="$DOTFILES/$1"


ls
echo $COMPONENT_DIR
if [ ! -d $COMPONENT_DIR  ]
then
  echo "$COMPONENT_NAME is not a valid component" >&2
  exit 1
fi

ACTION_FILE_PATH="$COMPONENT_DIR/${COMPONENT_ACTION}_$OS.sh"
if [ ! -f $ACTION_FILE_PATH ]
then
    echo "Action $COMPONENT_ACTION does not exist for $COMPONENT_NAME" >&2
    echo "Looked for script ${ACTION_FILE_PATH}" >&2
    exit
fi

echo "Running $ACTION_FILE_PATH"
exec $ACTION_FILE_PATH

