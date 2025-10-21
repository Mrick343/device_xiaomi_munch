cd kernel/xiaomi/sm8250
git submodule update --init --remote --merge
chmod +x nextpatch.sh && bash nextpatch.sh
rm -rf KernelSU-Next/userspace/su
cd ../../..
