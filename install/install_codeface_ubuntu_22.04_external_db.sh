#!/bin/bash

# Parameters: [external_db_1.conf] [external_db_2.conf] ...
# where the conf paths are relative to the codeface folder, *not* the install folder
cd ..
./install/install_repositories.sh
./install/install_common_external_db.sh
./install/install_codeface_R.sh
./install/install_codeface_node.sh
./install/install_codeface_python.sh
./install/install_cppstats.sh
./install/setup_database_external.sh "$@"