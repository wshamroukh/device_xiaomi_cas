# vendorsetup.sh for Xiaomi CAS

echo ">> Checking and cloning required repos for Xiaomi CAS..."

# Clone vendor if not exists
if [ ! -d "vendor/xiaomi/cas" ]; then
    echo ">> Cloning vendor_xiaomi_cas (branch cas16)..."
    git clone https://github.com/Khaikate/vendor_xiaomi_cas.git -b cas16 vendor/xiaomi/cas
else
    echo ">> vendor/xiaomi/cas already exists, skipping clone."
fi

# Clone kernel if not exists
if [ ! -d "kernel/xiaomi/cas" ]; then
    echo ">> Cloning kernel_xiaomi_cas (branch cas16)..."
    git clone https://github.com/Khaikate/kernel_xiaomi_cas.git -b cas16 kernel/xiaomi/cas
else
    echo ">> kernel/xiaomi/cas already exists, skipping clone."
fi

# Clone miui_camera if not exists
if [ ! -d "vendor/xiaomi/cas-miuicamera" ]; then
    echo ">> Cloning vendor_xiaomi_cas-miuicamera (branch cas15)..."
    git clone https://github.com/Khaikate/vendor_xiaomi_cas-miuicamera.git -b cas15 vendor/xiaomi/cas-miuicamera
else
    echo ">> vendor/xiaomi/cas-miuicamera already exists, skipping clone."
fi

echo ">> All required repos are set up."