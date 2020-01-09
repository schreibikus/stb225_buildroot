#!/bin/sh

echo Need delete some files in ${TARGET_DIR}

rm -vf ${TARGET_DIR}/usr/bin/{ldd,getconf}
rm -vf ${TARGET_DIR}/sbin/ldconfig
rm -vf ${TARGET_DIR}/usr/bin/transmission-{create,edit,remote,show}
rm -vf ${TARGET_DIR}/{lib32,usr/lib32}
rm -vf ${TARGET_DIR}/usr/bin/sftp
rm -vf ${TARGET_DIR}/usr/bin/ssh{-add,-agent,-copy-id,-keyscan}
rm -vrf ${TARGET_DIR}/etc/{rc0.d,rc2.d,rc3.d,rc5.d,xinetd.d}
rm -vf ${TARGET_DIR}/etc/init.d/{cups,cups-browsed}
rm -vf ${TARGET_DIR}/usr/lib/{os-release,libstdc++.so.*-gdb.py}
