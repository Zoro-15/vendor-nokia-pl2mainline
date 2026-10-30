#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FW_DIR="${SCRIPT_DIR}/proprietary/firmware"
mkdir -p "${FW_DIR}"

echo "=========================================================="
echo " Extracting / Updating Downstream Firmware for PL2 Mainline"
echo "=========================================================="

declare -A FILES=(
    ["a508_zap.mdt"]="https://raw.githubusercontent.com/nokia-msm8998/proprietary_vendor_nokia_PL2/lineage-24.0/proprietary/vendor/firmware/a508_zap.mdt"
    ["a508_zap.b01"]="https://raw.githubusercontent.com/nokia-msm8998/proprietary_vendor_nokia_PL2/lineage-24.0/proprietary/vendor/firmware/a508_zap.b01"
    ["a508_zap.b00"]="https://raw.githubusercontent.com/nokia-msm8998/proprietary_vendor_nokia_sdm660-common/lineage-24.0/proprietary/vendor/firmware/a508_zap.b00"
    ["a508_zap.b02"]="https://raw.githubusercontent.com/nokia-msm8998/proprietary_vendor_nokia_sdm660-common/lineage-24.0/proprietary/vendor/firmware/a508_zap.b02"
    ["a530_pm4.fw"]="https://gitlab.com/kernel-firmware/linux-firmware/-/raw/main/qcom/a530_pm4.fw"
    ["a530_pfp.fw"]="https://gitlab.com/kernel-firmware/linux-firmware/-/raw/main/qcom/a530_pfp.fw"
)

for file in "${!FILES[@]}"; do
    url="${FILES[$file]}"
    echo "--> Downloading ${file}..."
    curl -fsSL -L "${url}" -o "${FW_DIR}/${file}"
done

echo "--> Verified $(ls -1 "${FW_DIR}" | wc -l) firmware files in ${FW_DIR}"

