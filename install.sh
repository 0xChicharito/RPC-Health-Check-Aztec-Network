#!/bin/bash

# RPC Health Check - Installer for existing directory
# Works with existing .env file in current directory

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Config
REPO_URL="https://raw.githubusercontent.com/0xChicharito/rpc-health-check/main"
CURRENT_DIR=$(pwd)

echo -e "${BLUE}════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  RPC Health Check - Quick Installer${NC}"
echo -e "${BLUE}════════════════════════════════════════════════${NC}"
echo ""
echo "Installation directory: $CURRENT_DIR"
echo ""

# Check if .env exists
if [ ! -f ".env" ]; then
    echo -e "${YELLOW}⚠${NC} Warning: .env file not found in current directory"
    echo "This script requires an existing .env file"
    exit 1
fi

echo -e "${GREEN}✓${NC} Found .env file"
echo ""

# Download files
echo "Downloading monitoring scripts..."
echo ""

FILES=(
    "rpc_health_check.sh"
    "setup_cron.sh"
)

DOWNLOAD_SUCCESS=0
DOWNLOAD_FAILED=0

for file in "${FILES[@]}"; do
    echo -n "  Downloading $file ... "
    if curl -fsSL "$REPO_URL/$file" -o "$file" 2>/dev/null; then
        echo -e "${GREEN}✓${NC}"
        DOWNLOAD_SUCCESS=$((DOWNLOAD_SUCCESS + 1))
    else
        echo -e "${RED}✗${NC}"
        DOWNLOAD_FAILED=$((DOWNLOAD_FAILED + 1))
    fi
done

echo ""

if [ $DOWNLOAD_FAILED -gt 0 ]; then
    echo -e "${RED}✗ Failed to download $DOWNLOAD_FAILED file(s)${NC}"
    echo ""
    echo "Manual download:"
    echo "  curl -O $REPO_URL/rpc_health_check.sh"
    echo "  curl -O $REPO_URL/setup_cron.sh"
    exit 1
fi

echo -e "${GREEN}✓${NC} All files downloaded successfully"
echo ""

# Set permissions
echo "Setting permissions..."
chmod +x rpc_health_check.sh 2>/dev/null || true
chmod +x setup_cron.sh 2>/dev/null || true
echo -e "${GREEN}✓${NC} Permissions set"
echo ""

# Check if backup RPC configuration exists in .env
if ! grep -q "^BACKUP_ETHEREUM_RPCS=" .env; then
    echo -e "${YELLOW}⚠${NC} Adding backup RPC configuration to .env..."
    cat >> .env << 'EOF'

# Backup RPC URLs (comma-separated, required for RPC health check)
BACKUP_ETHEREUM_RPCS=https://eth.llamarpc.com,https://rpc.ankr.com/eth,https://eth.drpc.org,https://ethereum.publicnode.com

# Backup Beacon URLs (comma-separated, required for RPC health check)
BACKUP_BEACON_URLS=https://ethereum-beacon-api.publicnode.com,https://beaconstate.ethstaker.cc

# Telegram Notification (Optional)
TELEGRAM_BOT_TOKEN=
TELEGRAM_CHAT_ID=
EOF
    echo -e "${GREEN}✓${NC} Backup RPC configuration added to .env"
else
    echo -e "${GREEN}✓${NC} Backup RPC configuration already exists in .env"
fi
echo ""

# Success
echo -e "${GREEN}════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  Installation Complete! 🎉${NC}"
echo -e "${GREEN}════════════════════════════════════════════════${NC}"
echo ""
echo "Files installed in: $CURRENT_DIR"
echo ""
echo "Next steps:"
echo ""
echo "  1. Configure backup RPCs (if needed):"
echo "     nano .env"
echo "     # Edit BACKUP_ETHEREUM_RPCS and BACKUP_BEACON_URLS"
echo ""
echo "  2. Run manual check:"
echo "     ./rpc_health_check.sh"
echo ""
echo "  3. Setup automatic monitoring:"
echo "     ./setup_cron.sh"
echo ""
echo "The script will use RPC URLs from your existing .env file."
echo ""
