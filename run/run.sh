#!/bin/bash

# Source the run configuration
source run/run.conf

# Start the id service
cd "id_service"
nodejs id_service.js "${CFCONF}" "info" &
IDSERVICE=$!
cd ..

# Run codeface with the given parameters
if [ $0 == "run" ]; then
    echo "Running codeface with standard analysis"
    codeface -j 1 -l "devinfo" run --recreate -c "${CFCONF}" -p "${CSCONF}" "${RESULTS}" "${REPOS}" > "${LOGS}/codeface_run.log" 2>&1
elif [ $0 == "ml" ]; then
  echo "Running codeface with mailing list analysis"
    codeface -j 1 -l "devinfo" ml -c "${CFCONF}" -p "${CSCONF}" "${RESULTS}" "${MAILINGLISTS}" > "${LOGS}/codeface_ml.log" 2>&1
elif [ $0 == "conway" ]; then
    echo "Running codeface with conway analysis"
    codeface -l "devinfo" conway -c "${CFCONF}" -p "${CSCONF}" "${RESULTS}" "${REPOS}" "${TITAN}" > "${LOGS}/codeface_conway.log" 2>&1
fi

# Kill the id-service
kill $IDSERVICE

