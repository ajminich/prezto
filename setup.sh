#!/bin/zsh

# Exit on fail
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# First, link this repository to ~/.zprezto
ln -s "${DIR}" ${ZDOTDIR:-$HOME}/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${DIR}"/runcoms/^README.md(.N); do
  destination="${ZDOTDIR:-$HOME}/.${rcfile:t}"
  if [ -f $destination ];
  then
    echo "Setup file ${destination} already exists."
  else
    ln -s "$rcfile" "${destination}"
    echo "Successfully set up ${destination}."
  fi
done

echo "Setup complete."
