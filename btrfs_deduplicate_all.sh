#!/bin/bash
set -e

## Script to deduplicate redundant data using duperemove tool.

MNTPOINT="/btrfs-root"

mount_btrfs_root.sh || true

sudo duperemove -Ahdr $MNTPOINT


