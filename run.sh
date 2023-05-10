#!/bin/bash
pushd `dirname $0` > /dev/null
CODEFACE=`pwd`
popd > /dev/null

cd ${CODEFACE}
PYTHONPATH="$PYTHONPATH:$CODEFACE"
PYTHONPATH="$PYTHONPATH:$CODEFACE/codeface"
echo ${PYTHONPATH}
./codeface/runCli.py "$@"