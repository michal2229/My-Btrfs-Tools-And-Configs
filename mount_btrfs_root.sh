#!/bin/bash

MNTDEVICE="/dev/mapper/ubu-root"
MNTPOINT="/btrfs-root"

sudo mount $MNTDEVICE $MNTPOINT -o subvolid=0
