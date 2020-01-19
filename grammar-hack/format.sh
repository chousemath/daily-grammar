#!/bin/bash -
#===============================================================================
#
#          FILE: format.sh
#
#         USAGE: ./format.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 01/19/2020 12:19:18
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

autopep8 --in-place --aggressive --aggressive --recursive .
mypy .

