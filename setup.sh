#!/bin/zsh

# Exit on fail
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# First, link this repository to ~/.zprezto
ln -s "${DIR}" ${ZDOTDIR:-$HOME}/.zprezto

setopt EXTENDED_GLOB

linkfolder ()
{
    foldername=${1}
    for rcfile in "${DIR}"/${foldername}/^README.md(.N); do
        destination="${ZDOTDIR:-$HOME}/.${rcfile:t}"
        if [ -f $destination ];
        then
            echo "Setup file ${destination} already exists."
        else
            ln -s "$rcfile" "${destination}"
            echo "Successfully set up ${destination}."
        fi
    done
}

linkfolder runcoms
linkfolder config

# Link to the vim setup folder
ln -s ${DIR}/config/vim ${ZDOTDIR:-$HOME}/.vim

echo "Setup complete."
