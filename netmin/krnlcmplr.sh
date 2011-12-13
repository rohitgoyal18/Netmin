#!/bin/bash
[ ! `id -u` = 0 ] && echo compiler: Only root can compile the kernel. && exit
clear
echo -e "\t\t   Welcome to the Kernel Compilation Program"
echo -e "\t\t   ========================================="
echo
cd "/usr/src/linux-2.4"
echo "Step I"
echo "------"
echo -e "Please enter the new kernel's name: \c"
read krnl_name
[ -z "$krnl_name" ] && echo New kernel name cannot be null. && exit
[ -n "`ls /boot | grep $krnl_name`" ] && echo kernel already exist. && exit
sed -i 4c"EXTRAVERSION = -8$krnl_name" Makefile
echo
echo "Step II"
echo "-------"
echo "Cleaning old files..."
make mrproper
echo
echo "Step III"
echo "--------"
cpu_type=`uname -p`
echo "Copying system's config file..."
cp -p "configs/kernel-2.4.20-$cpu_type.config" .config
echo
echo "Step IV"
echo "-------"
echo "Creating new config file..."
make oldconfig
echo
echo "Step V"
echo "------"
echo "Customizing new kernel configuration..."
make menuconfig
echo
echo "Step VI"
echo "-------"
echo "Checking kernel module dependencies..."
make dep
echo
echo "Step VII"
echo "--------"
echo "Cleaning files..."
make clean
echo
echo "Step VIII"
echo "---------"
echo "Creating new kernel image..."
make bzImage
echo
echo "Step IX"
echo "-------"
echo "Copying new kernel to /boot partition..."
cp arch/i386/boot/bzImage "/boot/vmlinuz-2.4.20-8$krnl_name"
cp System.map "/boot/System.map-2.4.20-8$krnl_name"
cp .config "/boot/config-2.4.20-8$krnl_name"
echo
echo "Step X"
echo "------"
echo "Creating and installing new kernel modules..."
make modules
make modules_install
echo
echo "Step XI"
echo "-------"
echo "Configuring Boot Loader config file..."
sed -n 13,15p /boot/grub/grub.conf > /tmp/kc
sed -i 1c"title Red Hat Linux 9.0 (2.4.20-8$krnl_name)" /tmp/kc
sed -i "s/vmlinuz-2.4.20-8/vmlinuz-2.4.20-8$krnl_name/g" /tmp/kc
cat /tmp/kc >> /boot/grub/grub.conf
echo
echo "Congratulations, your new kernel is ready"
echo -e "Press any key to reboot the system...\c"
read -n 1
init 6
