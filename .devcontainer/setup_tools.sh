
#!/usr/bin/env bash
set -Eeuo pipefail

echo "=============================================="
echo " ENG 298 - Module 7: SBOM Lab Setup"
echo "=============================================="

# ---------------------------------------------
# 1. Install required system packages
# ---------------------------------------------
echo "[*] Updating package lists..."

sudo apt-get update

sudo apt-get install -y \
  curl \
  wget \
  unzip \
  ca-certificates \
  gnupg \
  git \
  jq

# ---------------------------------------------
# 2. Install Syft (SBOM generator)
# ---------------------------------------------
echo "[*] Installing Syft..."

curl -sSfL https://get.anchore.io/syft \
  | sudo sh -s -- -b /usr/local/bin

# ---------------------------------------------
# 3. Install Grype (vulnerability scanner)
# ---------------------------------------------
echo "[*] Installing Grype..."

curl -sSfL https://get.anchore.io/grype \
  | sudo sh -s -- -b /usr/local/bin

# ---------------------------------------------
# 4. Install Trivy (SBOM and vulnerability tool)
# ---------------------------------------------
echo "[*] Installing Trivy..."

curl -sSfL \
  https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh \
  | sudo sh -s -- -b /usr/local/bin

# ---------------------------------------------
# 5. Verify installations
# ---------------------------------------------
echo ""
echo "[*] Verifying installed tools..."

command -v syft
command -v grype
command -v trivy

echo ""
echo "Syft:"
syft version

echo ""
echo "Grype:"
grype version

echo ""
echo "Trivy:"
trivy --version

echo ""
echo "=============================================="
echo " SBOM Lab Setup Complete"
echo "=============================================="
echo "Tools installed: Syft, Grype, Trivy"
echo "Environment ready for Module 7."
