#!/bin/bash

### This script prints system info ###

echo "Welcome to bash script."
echo

echo 
echo

# Memory Utilizatio
free -m
echo

# Disk Utilization
echo "#####################################"
echo "Disk Utilization"
df -h
