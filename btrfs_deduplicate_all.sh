#!/bin/bash
set -e

## Script to deduplicate redundant data using duperemove tool.

source _settings.sh
mount_btrfs_root.sh || true

sudo duperemove -Ahdr $MNTPOINT


