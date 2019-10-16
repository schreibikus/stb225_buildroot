#!/bin/sh

echo Need delete some files in ${TARGET_DIR}

rm -vf ${TARGET_DIR}/usr/bin/{ldd,getconf}
rm -vf ${TARGET_DIR}/sbin/ldconfig
rm -vf ${TARGET_DIR}/usr/bin/transmission-{create,edit,remote,show}
rm -vf ${TARGET_DIR}/{lib32,usr/lib32}
rm -vf ${TARGET_DIR}/usr/bin/{scp,sftp}
rm -vf ${TARGET_DIR}/usr/bin/ssh{-add,-agent,-copy-id,-keyscan}
