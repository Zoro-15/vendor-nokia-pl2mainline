#!/usr/bin/env bash
set -eo pipefail

IMG_SIZE="${VENDOR_SIZE:-512M}"
OUT_DIR="${OUT_DIR:-.}"
OUTPUT="${OUT_DIR}/vendor_b.img"
RAW_IMG="${OUT_DIR}/vendor_b.raw.img"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/proprietary"

echo "=========================================================="
echo " Packaging Nokia 6.1 (PL2) Mainline Minimal Vendor Image"
echo " Target: Slot B ONLY (vendor_b.img) | Size: ${IMG_SIZE}"
echo "=========================================================="

# Ensure required packaging tools
if ! command -v mke2fs >/dev/null 2>&1 || ! command -v img2simg >/dev/null 2>&1; then
    echo "--> Installing filesystem tools (e2fsprogs, android-sdk-libsparse-utils)..."
    export DEBIAN_FRONTEND=noninteractive
    apt-get update -qq && apt-get install -y -qq e2fsprogs android-sdk-libsparse-utils > /dev/null 2>&1 || true
fi

echo "--> Preparing permissions for Android vendor partition..."
chmod -R 755 "${SRC_DIR}"
find "${SRC_DIR}" -type f -exec chmod 644 {} +
if [ "$(id -u)" -eq 0 ]; then
    chown -R 0:0 "${SRC_DIR}"
fi

echo "--> Generating ext4 filesystem from ${SRC_DIR}..."
mke2fs -t ext4 -b 4096 -d "${SRC_DIR}" -L "vendor" "${RAW_IMG}" "${IMG_SIZE}"

echo "--> Converting raw ext4 into Android sparse image..."
if command -v img2simg >/dev/null 2>&1; then
    img2simg "${RAW_IMG}" "${OUTPUT}"
    rm -f "${RAW_IMG}"
else
    echo "[-] Warning: img2simg not found, keeping raw image as ${OUTPUT}"
    mv "${RAW_IMG}" "${OUTPUT}"
fi

echo "=========================================================="
echo " VENDOR IMAGE READY: ${OUTPUT}"
ls -lh "${OUTPUT}"
echo ""
echo " Flash Command (Slot B ONLY):"
echo "   fastboot flash vendor_b ${OUTPUT}"
echo "=========================================================="

