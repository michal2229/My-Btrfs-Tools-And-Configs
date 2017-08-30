#!/bin/bash

## Script to make batch of snapshots from given subvolumes.
# It expects You to provide MNTDIR - a dir which contain mounted subvolumes,
# whose names begin with '@' (i.e. @mountpoint), and SNAPDIR - a dir to put snapshots there.
# Snapshots are made read-only.
# Parameters of the script are the snapshot comment, for example:
# >> btrfs_make_snapshots.sh This is a comment of a snapshots
# Snapshots are placed in subfolders, which name has '_' instead of '@' (i.e. _mountpoint).
# Snapshots are named as follows: name;date;comment, for example: @mountpoint;2017-05-04_12-34;This_is_comment

MNTPOINT="/btrfs-root"
MNTDIR="$MNTPOINT/mountpoints"
SNAPDIR="$MNTPOINT/snapshots"

DATE=$(date "+%y-%m-%d_%H-%M")
COMMENT="$(echo $@ | sed 's/ /_/g')"

mount_btrfs_root.sh || true

for i in $(ls $MNTDIR); do
    j=$(echo $i | sed "s/@/_/g")
    snapdir1="$SNAPDIR/$j"
    sudo mkdir $snapdir1 || true
    sudo btrfs sub snap $MNTDIR/$i "$snapdir1/$i;$DATE;$COMMENT" -r
done
