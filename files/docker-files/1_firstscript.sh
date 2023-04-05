#!/bin/bash

### This script prints system info ###

echo "Welcome to bash script."
echo

#checking systemt uptime
echo 
echo

# Memory Utilization
echo "#####################################"
echo "Memory Utilization"
free -m
echo

# Disk Utilization
echo "#####################################"
echo "Disk Utilization"
df -h
