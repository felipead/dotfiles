#!/bin/bash

for PACKAGE in $(< 'packages.txt')
do
    npm install -g "$PACKAGE"
done
