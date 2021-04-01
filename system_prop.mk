# ADB
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=adb \
    ro.adb.secure=0 \
    service.adb.root=1

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.monitorRotation=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/sys/devices/700b0200.sdhci/mmc_host/mmc0/mmc0:0001/mmc0:0001:2/net/wlan0/address

# AV
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.monitorRotation=true \
    persist.sys.media.avsync=true

# Charger
PRODUCT_PROPERTY_OVERRIDES += \
    ro.charger.disable_init_blank=true
    ro.charger.enable_suspend=true

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    camera.flash_off=0 \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216 \
    ro.com.google.clientidbase=android-google

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610 \
    ro.hardware.gralloc=gbm \
    ro.hardware.hwcomposer=drm \
    gralloc.gbm.device=/dev/dri/renderD129 \
    hwc.drm.device=/dev/dri/card1 \
    drm.gpu.vendor_name=tegra \
    ro.hardware.vulkan=tegra

# Input
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.noresample=1
	
# LMKd
PRODUCT_PRODUCT_PROPERTIES += \
    ro.lmk.low=1001 \
    ro.lmk.medium=800 \
    ro.lmk.critical=0 \
    ro.lmk.critical_upgrade=false \
    ro.lmk.upgrade_pressure=100 \
    ro.lmk.downgrade_pressure=100 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=100 \
    ro.lmk.use_minfree_levels=true
    
# Privileged permissions whitelist
PRODUCT_PROPERTY_OVERRIDES += \
     ro.control_privapp_permissions=log     

# Screen
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# USB configfs
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.sys.usb.udc=700d0000.xudc \
    sys.usb.controller=700d0000.xudc
	
# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    ap.interface=wlan0 \
    wifi.direct.interface=p2p-dev-wlan0 \
    wifi.interface=wlan0
