# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty32"
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y libgmp3-dev libmpfr-dev libisl-dev libcloog-isl-dev libmpc-dev texinfo make bison flex gcc g++ nasm build-essential grub qemu zip xorriso
    sudo export PREFIX="/opt/cross"
    sudo export TARGET=i686-elf
    sudo export PATH="$PREFIX/bin:$PATH"
    sudo mkdir /tmp/
    sudo mkdir /tmp/build
    sudo cd /tmp/build
    sudo wget -O binutils.tar.gz http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz
    sudo tar -xf binutils.tar.gz
    sudo cd binutils-2.25
    sudo mkdir build-binutils
    sudo cd build-binutils
    sudo ../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
    sudo make
    sudo make install
    sudo cd ../..
    sudo rm -r binutils-2.25
    sudo wget -O gcc.tar.gz http://ftp.gnu.org/gnu/gcc/gcc-4.9.2/gcc-4.9.2.tar.gz
    sudo tar -xf gcc.tar.gz
    sudo cd gcc-4.9.2
    sudo mkdir build-gcc
    sudo cd build-gcc
    sudo ../configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
    sudo make all-gcc
    sudo make all-target-libgcc
    sudo make install-gcc
    sudo make install-target-libgcc
    sudo rm -rf /tmp/build
  SHELL
end
