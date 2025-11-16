# CHANGELOG

## [Version 2.1] - 2024-11-16

### ✨ New Features

- **Telegram Notifications**: Added Telegram bot integration for real-time alerts
  - Notify when RPC fails and switches to backup
  - Notify when original RPC recovers and is restored
  - Critical alerts when no backup RPC available
- **Multi-language Support**: All outputs and comments converted to English
- Configurable Telegram bot token and chat ID via .env file

### 📝 Telegram Notification Types

1. RPC Failure Alert - when switching to backup
2. RPC Restoration Alert - when original RPC recovers
3. Critical Alert - when no backup available

### 🔧 Configuration

New .env variables:
```bash
TELEGRAM_BOT_TOKEN=your_bot_token_here
TELEGRAM_CHAT_ID=your_chat_id_here
```

---

## [Version 2.0] - 2024-11-16

### ✨ New Features

- **Auto-restore original RPC**: Script now automatically detects when original RPC has recovered and switches back to it
- Added `.original_rpc` file to store original RPC information
- Priority check for original RPC restoration before each health check run

### 🔄 Improvements

- Optimized check flow: check original RPC restoration capability first before checking current RPC
- Auto-delete `.original_rpc` file when both ETH RPC and Beacon are restored
- Improved log messages with emojis for better readability

### 📝 New Workflow

1. Check if using backup RPC
2. If yes → Check if original RPC has recovered
3. If original RPC recovered → Auto-switch back to original RPC
4. If not → Continue checking current RPC as normal

---

## [Version 1.0] - 2024-11-15

### 🎉 Initial Release

- Check health of Ethereum RPC
- Check health of Consensus Beacon
- Automatic retry on error detection
- Auto-replace with backup RPC
- Backup .env file before changes
- Detailed logging
- Support for cron job automation
