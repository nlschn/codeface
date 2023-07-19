#!/bin/bash

cd ..
./install/install_repositories.sh
./install/install_common_local_db.sh
./install/install_codeface_R.sh
./install/install_codeface_node.sh
./install/install_codeface_python.sh
./install/install_cppstats.sh
./install/setup_database_local.sh