#!/bin/bash

# Parameters: [external_db_1.conf] [external_db_2.conf] ...

./install_repositories.sh
./install_common_external_db.sh
./install_codeface_R.sh
./install_codeface_node.sh
./install_codeface_python.sh
./install_cppstats.sh
./setup_database_external.sh