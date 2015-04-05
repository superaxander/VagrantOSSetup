#/bin/sh

export PREFIX="/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"
mkdir /tmp/
mkdir /tmp/build
cd /tmp/build
wget -O binutils.tar.gz http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz
tar -xf binutils.tar.gz
cd binutils-2.25
mkdir build-binutils
cd build-binutils
../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install
cd ../..
rm -r binutils-2.25
wget -O gcc.tar.gz http://ftp.gnu.org/gnu/gcc/gcc-4.9.2/gcc-4.9.2.tar.gz
tar -xf gcc.tar.gz
cd gcc-4.9.2
mkdir build-gcc
cd build-gcc
../configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
