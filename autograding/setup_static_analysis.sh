#!/bin/bash

# install needed tools
sudo apt update
sudo apt install -y cppcheck  cloc pip
pip install lizard cpplint

# print out versions
cppcheck --version
cpplint --version
cloc --version
lizard --version