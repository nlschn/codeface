#!/bin/bash
# Copyright Roger Meier <roger@bufferoverflow.ch>
# Copyright Claus Hunsen <hunsen@fim.uni-passau.de>
# SPDX-License-Identifier:	Apache-2.0 BSD-2-Clause GPL-2.0+ MIT WTFPL

echo "Providing codeface database"

DATAMODEL="datamodel/codeface_schema.sql"
mysql -ucodeface -pcodeface < ${DATAMODEL}

# Read each given config file
for var in "$@"
do
    echo "Configurig database $var"
    # https://stackoverflow.com/questions/17001849/awk-partly-string-match-if-column-word-partly-matches
    # This does fancy parsing stuff
    # -F": " is used to split each line into two coloumns, separated by the colon and the space
    #
    #                          !($1 ~ /#/)                                       &&     $0 ~ /:/
    # Select only lines that   do not contain a "#" symbol in the first column   and    do contain a colon ":" overall
    #
    # {print $1 "=" $2;} formats the line like name="value" such that all lines together can be used with one export
    # statement
    echo $(awk -F": " '!($1 ~ /#/) && $0 ~ /:/ {print $1 "=" $2;}' "$var")
    export $(awk -F": " '!($1 ~ /#/) && $0 ~ /:/ {print $1 "=" $2;}' "$var")
    # use the exported variables to initialise the db from the config
    cat ${DATAMODEL} | sed -e "s/codeface/${dbname}/g" | mysql -h${dbhost} -u${dbuser} -p${dbpwd}
done





