#!/bin/bash

# install needed tools
sudo apt update
sudo apt install -y cppcheck  cloc pip libpcre3 libpcre3-dev cmake
pip install lizard cpplint

# print out versions
cppcheck --version
cpplint --version
cloc --version
lizard --version

# cd /tmp
# git clone https://github.com/danmar/cppcheck.git
# git checkout 2.10.3
# mkdir build && cd build 
# cmake -DHAVE_RULES=ON ..
# cmake --build .
# ./bin/cppcheck --addon=misra /tmp/misra_example/*