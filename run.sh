#!/bin/bash
pushd `dirname $0` > /dev/null
CODEFACE=`pwd`
popd > /dev/null

cd ${CODEFACE}
PYTHONPATH="$PYTHONPATH:$CODEFACE"
echo ${PYTHONPATH}
python codeface/runCli.py "$@"