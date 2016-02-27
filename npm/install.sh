#!/bin/bash

for PACKAGE in $(cat packages.txt)
do
    npm install -g "$PACKAGE"
done
