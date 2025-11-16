# Quick Start Guide

## 🚀 Setup in 5 Minutes

### Step 1: Create Telegram Bot (Optional, 2 minutes)

1. Open Telegram, search `@BotFather`
2. Send: `/newbot`
3. Follow instructions, copy your **Bot Token**
4. Search `@userinfobot`, get your **Chat ID**

### Step 2: Configure .env (1 minute)

Edit `.env` file:

```bash
ETHEREUM_RPC_URL=https://your-rpc-url.com
CONSENSUS_BEACON_URL=https://your-beacon-url.com
VALIDATOR_PRIVATE_KEYS=0x...
COINBASE=0x...
P2P_IP=...

# Add these for Telegram notifications
TELEGRAM_BOT_TOKEN=123456789:ABCdefGHIjklMNOpqrsTUVwxyz
TELEGRAM_CHAT_ID=123456789
```

### Step 3: Install & Run (2 minutes)

```bash
# Grant permissions
chmod +x rpc_health_check.sh setup_cron.sh

# Test run (optional)
./rpc_health_check.sh

# Setup auto-run every 5 minutes
./setup_cron.sh
```

### Step 4: Verify (30 seconds)

```bash
# Check cron job is running
crontab -l

# Watch logs
tail -f rpc_health_check.log
```

## ✅ Done!

Your RPC monitoring is now active. You'll receive Telegram notifications when:
- ❌ RPC fails (switching to backup)
- ✅ RPC recovers (restoring original)

## 🧪 Test Telegram Notifications

```bash
# Test if Telegram is working
curl -X POST "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/sendMessage" \
  -d chat_id=<YOUR_CHAT_ID> \
  -d text="✅ RPC Monitor is ready!"
```

## 📊 Monitor Status

```bash
# View logs in real-time
tail -f rpc_health_check.log

# Check if using backup RPC
cat .original_rpc

# View current configuration
cat .env | grep -E "(ETHEREUM_RPC|CONSENSUS_BEACON)"
```

## ⚙️ Customize

### Change check frequency

Edit `setup_cron.sh`:
```bash
CRON_SCHEDULE="*/5 * * * *"  # Every 5 minutes
# Change to:
CRON_SCHEDULE="*/10 * * * *"  # Every 10 minutes
```

### Add more backup RPCs

Edit `rpc_health_check.sh`:
```bash
BACKUP_ETH_RPCS=(
    "https://your-backup-1.com"
    "https://your-backup-2.com"
    # Add more here
)
```

## 🆘 Troubleshooting

### Telegram not working?
```bash
# Check configuration
grep TELEGRAM .env

# Test manually
curl -X POST "https://api.telegram.org/bot<TOKEN>/sendMessage" \
  -d chat_id=<CHAT_ID> \
  -d text="Test"
```

### Cron not running?
```bash
# Check service
sudo systemctl status cron

# View cron logs
grep CRON /var/log/syslog
```

### Script permission denied?
```bash
chmod +x rpc_health_check.sh
```

## 📚 Full Documentation

See [README.md](README.md) for complete documentation.
