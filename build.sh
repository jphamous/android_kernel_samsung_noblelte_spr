export ARCH=arm64

if [ -d ~/toolchain/aarch64-4.9/bin/ ]; then
	echo "Found toolchain: Setting up . . . "
else
	echo "Missing toolchain: Obtaining from Google . . ."
	git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b master ~/toolchain/aarch64-4.9 
fi
export CROSS_COMPILE=~/toolchain/aarch64-4.9/bin/aarch64-linux-android-

make exynos7420-noblelte_usa_spr_defconfig
