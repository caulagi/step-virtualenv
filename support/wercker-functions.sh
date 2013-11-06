#!/bin/bash -e

# Returns true if python version is at version 2.x or 3.x
is_python_version() {
  if [ -f $WERCKER_VIRTUALENV_PYTHON_PATH ] ; then
      case "$($WERCKER_VIRTUALENV_PYTHON_PATH --version 2>&1)" in
          *" 3."*)
              return 1
              ;;
          *" 2."*)
              return 1
              ;;
          *)
              return 0
              ;;
      esac
  fi

  return 0
}

# Returns true if virtual env path is not a directory
is_valid_venv_path() {
  if [ -d "$WERCKER_VIRTUALENV_VIRTUALENV_PATH" ] ; then
    return 0
  fi

  return 1
}

is_virtualenv_installed() {
  if hash $VIRTUAL_ENV_COMMAND 2>/dev/null; then
    return 1
  fi

  return 0
}