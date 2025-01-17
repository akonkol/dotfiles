#!/bin/bash

# Set configuration
LOCAL_LAUNCHD_PATH=${HOME}/Library/LaunchAgents/
LAUNCHD_JOB_FILENAME=com.uhlll.ddpm.plist
cp launchd/${LAUNCHD_JOB_FILENAME} ${LOCAL_LAUNCHD_PATH}


# Load Job
launchctl load ${LOCAL_LAUNCHD_PATH}/${LAUNCHD_JOB_FILENAME}


# Ignore error you get from launchctl
