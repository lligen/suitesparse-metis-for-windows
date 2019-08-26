


mkdir build
mkdir -p install/android_armv7 install/android_aarch64
cd build
rm * -rf


## build armv7
cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DANDROID_NDK=/data/android-ndk/android-ndk-r14b \
        -DANDROID_ABI='armeabi-v7a with NEON' -DANDROID_TOOLCHAIN_NAME=arm-linux-androideabi-4.9 -DANDROID_STL=gnustl_static\
        -DCMAKE_TOOLCHAIN_FILE=../cmake/android.toolchain.cmake \
        -DCMAKE_INSTALL_PREFIX=../install/android_armv7 \
        -DCMAKE_BUILD_TYPE=Release ..
make -j8
make install





## build aarch64
rm * -rf
cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DANDROID_NDK=/data/android-ndk/android-ndk-r14b \
        -DANDROID_ABI=arm64-v8a -DANDROID_TOOLCHAIN_NAME=aarch64-linux-android-4.9 -DANDROID_STL=gnustl_static\
        -DCMAKE_TOOLCHAIN_FILE=../cmake/android.toolchain.cmake \
        -DCMAKE_INSTALL_PREFIX=../install/android_aarch64 \
        -DCMAKE_BUILD_TYPE=Release ..
make -j8
make install

cd ..