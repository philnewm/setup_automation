#!/bin/bash
# Creates a ISO image with a custom kickstart file
# Requires: genisoimage, syslinux, createrepo

if [ $# -lt 2 ]; then
	echo "Usage1: $0 source_iso kickstart"
	exit 1
fi

if [ ! -f $1 ]; then
	echo "ISO image $1 does not exist!"
	exit 1
fi

if [ ! -f $2 ]; then
	echo "Kickstart file $2 does not exist!"
	exit 1
fi

SourceImage="$1"
KickstartFile="$2"
OutputImage=$(basename "$SourceImage" | sed 's/.iso$/-ks.iso/')

echo "Source file: $SourceImage"
echo "Kickstart file: $KickstartFile"

WorkDir=`pwd`/work
if [ -d $WorkDir ] ; then
	echo "An existing work directory exists."
	echo "Delete it and start from scratch."
	exit 1
fi


echo "Copying iso contents"
mkdir -p $WorkDir/source $WorkDir/output
mount -o loop $SourceImage $WorkDir/source
rsync -a $WorkDir/source/ $WorkDir/output/
umount $WorkDir/source

# Copy kickstart
cp -v $KickstartFile $WorkDir/output/ks.cfg

# Tweak the isolinux.cfg so default boot option uses the kickstart
sed 's/\(hd:LABEL[^ ]*\)/\1 inst.ks=\1:\/ks.cfg/' -i $WorkDir/output/isolinux/isolinux.cfg


Label=$(file $SourceImage | grep -ohE "'.*'" | tr -d \')

pushd .
cd $WorkDir/output
genisoimage \
	-V "$Label" \
	-A "$Label" \
	-o $WorkDir/$OutputImage \
	-joliet-long \
	-b isolinux/isolinux.bin \
	-c isolinux/boot.cat \
	-no-emul-boot \
	-boot-load-size 4 \
	-boot-info-table \
	-R -J -v -T \
	$WorkDir/output

popd

echo "Output file: $WorkDir/$OutputImage"
