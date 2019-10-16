#!/bin/sh

echo Need delete some files in ${TARGET_DIR}

rm -vf ${TARGET_DIR}/usr/bin/transmission-{create,edit,remote,show}
rm -vf ${TARGET_DIR}/{lib32,usr/lib32}
