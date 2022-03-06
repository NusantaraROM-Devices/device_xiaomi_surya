#
# FakeRiz
#

# Clone vendor
rm -rf vendor/xiaomi/surya
git clone git@github.com:fakeriz/vendor_xiaomi_surya.git -b 10 vendor/xiaomi/surya

# Setup cache
export USE_CCACHE=1 && export CCACHE_EXEC=/usr/bin/ccache && ccache -M 100G && export CCACHE_COMPRESS=1