#!/bin/bash

# Update the index of available packages
apk update

# Install tput
apk add ncurses

# Install figlet
apk add figlet

# Install lolcat
apk add ruby
gem install lolcat
