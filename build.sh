export ARCH=arm64

if [ -d ~/toolchain/aarch64-4.9/bin/ ]; then
	echo "Found toolchain: Setting up . . . "
else
	echo "Missing toolchain: Obtaining from Google . . ."
	git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b master ~/toolchain/aarch64-4.9 
fi
export CROSS_COMPILE=~/toolchain/aarch64-4.9/bin/aarch64-linux-android-

make exynos7420-noblelte_usa_spr_defconfig

while read -p "Start build with:`echo $'\n ' `1) $(nproc) cores?`echo $'\n ' `2) $(($(nproc)/2)) cores?`echo $'\n '`3) $(($(nproc)/4)) cores?`echo $'\n '`X|x to cancel auto build`echo $'\n>'`" corechoice
do
case "$corechoice" in
	1 )	
		echo "Building with $(nproc) cores"
		make -j$(nproc)
		break
		;;

        2 )
		echo "Building with $(($(nproc)/2)) cores"
		make -j$(($(nproc)/2))
                break
                ;;
        3 )
		echo "Building with $(($(nproc)/4)) core(s)"
		make -j$(($(nproc)/4))
		break
                ;;
        X|x )
                echo "Cancelling auto build"
                break
                ;;
        * )
                echo "Invalid: Try again"
                ;;

esac
done
