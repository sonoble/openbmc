if [ ! -d ./poky ];then
        echo "1. Clone Yocto repository"
        git clone -b fido https://git.yoctoproject.org/git/poky
        echo "===================================================="
        echo "2. Clone OpenEmbedded and OpenBMC repositories"
        cd poky
        git clone -b fido https://github.com/openembedded/meta-openembedded.git
        git clone -b fido https://git.yoctoproject.org/git/meta-security
        git clone -b master https://github.com/facebook/openbmc.git meta-openbmc
else
        cd poky
fi
echo "===================================================="
echo "3. Initialize a build directory"
export TEMPLATECONF=meta-openbmc/meta-facebook/meta-wedge/conf
source oe-init-build-env meta-wedge


echo "===================================================="
echo "4. Build image"
bitbake wedge-image

#
