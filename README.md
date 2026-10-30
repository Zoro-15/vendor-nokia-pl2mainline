# Minimal Mainline Vendor Tree: Nokia 6.1 (PL2)

**Target Device:** HMD Global Nokia 6.1 (`PL2` / `Plate2` / `PL2_mainline`, Qualcomm SDM630).  
**Target Platform:** LineageOS 24.0 / Android 17 (Baklava, API Level 37) & Treble GSI ARM64.  
**Active Slot:** `SLOT B ONLY` (`vendor_b`).

---

## 1. Overview
This repository provides the minimal, mainline-compliant `/vendor` tree for booting modern Android (AOSP / Treble GSI / LineageOS) on the Nokia 6.1 with upstream Linux kernels (7.2.y).

It completely replaces bloated downstream BSP vendor trees by:
- Enforcing standard Linux DRM/KMS (`freedreno` / `msm`) without proprietary KGSL drivers.
- Bundling authentic OEM signed Adreno 508 Zap Shader firmware (`a508_zap.*`) for Qualcomm TrustZone PIL authentication.
- Providing required Adreno 5xx workarounds (`vendor.mesa.fd.mesa.debug=sysmem`, `vendor.minigbm.avoid_ubwc=true`).
- Supporting Android 17 `aconfigd` via `/metadata` partition mapping on `logdump`.
- Enabling modern shared memory allocation via `sys.use_memfd=true`.

---

## 2. Directory Layout
```text
vendor-nokia-pl2mainline/
├── Android.mk                          # AOSP build hook
├── BoardConfigVendor.mk                # Exported board definitions
├── pl2_mainline-vendor.mk              # Product copy files & packaging rules
├── extract_files.sh                    # Automated downstream borrower script
├── pack_vendor.sh                      # Standalone 15-second ext4/sparse pack script
├── README.md                           # Documentation
└── proprietary/
    ├── build.prop                      # Device, Treble, and GPU workaround properties
    ├── etc/
    │   ├── fstab.nokia-pl2             # Mounts /system, /vendor, /metadata, /data
    │   ├── ueventd.rc                  # DRM / DMA-BUF node permissions & firmware dirs
    │   ├── init/
    │   │   ├── hw/
    │   │   │   └── init.nokia-pl2.rc   # Bootdevice symlink, early/late mounts, USB DWC3
    │   │   └── use_memfd.rc            # Android 17 / AOSP shared memory fix
    │   └── vintf/
    │       └── manifest.xml            # Minimal Treble VINTF device manifest
    └── firmware/                       # Authentic signed OEM firmware files
        ├── a508_zap.mdt                # Authentic OEM Zap Shader Header
        ├── a508_zap.b00                # Authentic OEM Zap Shader Slice 0
        ├── a508_zap.b01                # Authentic OEM Zap Shader Slice 1
        ├── a508_zap.b02                # Authentic OEM Zap Shader Slice 2
        ├── a508_zap.elf                # Authentic OEM Zap Shader Unified ELF
        ├── a530_pm4.fw                 # Adreno 508 PM4 microcode
        └── a530_pfp.fw                 # Adreno 508 PFP microcode
```

---

## 3. Fast Packaging (Google Colab / Standalone Linux)
To generate `vendor_b.img` in 15 seconds:
```bash
./pack_vendor.sh
```
Flash command (Slot B ONLY):
```cmd
fastboot flash vendor_b vendor_b.img
```
