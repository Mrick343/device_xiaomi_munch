cd kernel/xiaomi/munch
git submodule update --init --remote --merge
chmod +x nextpatch.sh && bash nextpatch.sh
rm -rf KernelSU-Next/userspace/su
cd ../../..
