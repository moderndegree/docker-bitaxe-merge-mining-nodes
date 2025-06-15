# Docker Bitaxe Merge Mining Nodes

> **Bitcoin & DigiByte Docker Node Setup for Bitaxe Gamma Solo Mining**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Docker](https://img.shields.io/badge/Docker-Supported-blue.svg)](https://www.docker.com/)
[![Bitcoin](https://img.shields.io/badge/Bitcoin-Core-orange.svg)](https://bitcoin.org/)
[![DigiByte](https://img.shields.io/badge/DigiByte-Core-blue.svg)](https://digibyte.org/)
[![Bitaxe](https://img.shields.io/badge/Bitaxe-Compatible-green.svg)](https://github.com/bitaxeorg/bitaxe)

A secure, production-ready Docker setup for running Bitcoin and DigiByte nodes optimized for **Bitaxe gamma solo mining** with merge mining capabilities.

## 🎯 Project Purpose

This project is specifically designed to support **Bitaxe gamma solo miners** for merge mining Bitcoin (BTC) and DigiByte (DGB). By running your own full nodes, you can:

- 🏆 **Solo mine directly** to your own nodes (no pool fees!)
- ⚡ **Merge mine** both Bitcoin and DigiByte simultaneously
- 🔒 **Maintain full control** over your mining rewards
- 📊 **Monitor your mining** with direct blockchain access
- 🚀 **Reduce latency** between your miner and the blockchain

## ⛏️ Bitaxe Solo Mining Overview

### What is Bitaxe Gamma?
The [Bitaxe Gamma](https://github.com/bitaxeorg/bitaxeGamma) is an open-source Bitcoin ASIC miner based on the Bitmain BM1370 chip from the Antminer S21 Pro. Key features:
- **~1.2 TH/s** mining performance (1,200 GH/s)
- **Ultra-efficient** ~15 J/TH power consumption (~20W total)
- **Solo mining capable** with proper node setup
- **Open source hardware** and firmware
- **Compact form factor** perfect for home mining
- **Latest generation** BM1370 ASIC technology

### Merge Mining Explained
**Merge mining** allows you to mine multiple cryptocurrencies simultaneously using the same computational work:

```
Single Hash Work → Bitcoin Block Attempt + DigiByte Block Attempt
```

**Benefits:**
- ✅ **No additional power consumption** - same energy, double rewards potential
- ✅ **Increased profitability** - earn both BTC and DGB rewards  
- ✅ **Network security** - contribute to both blockchain networks
- ✅ **Diversified rewards** - reduce dependency on single cryptocurrency

### Why Solo Mining?
Solo mining with your own nodes provides several advantages:

| Advantage | Description |
|-----------|-------------|
| **Zero Pool Fees** | Keep 100% of block rewards (minus transaction fees) |
| **Full Control** | Complete control over transaction selection and rewards |
| **Network Health** | Contribute to blockchain decentralization |
| **Privacy** | No pool knows your mining activity |
| **Learning** | Deep understanding of blockchain mechanics |

**Note**: Solo mining is best suited for learning, network support, and the excitement of potentially finding a block. The probability of finding blocks is proportional to your hashrate vs. network difficulty.

## ✨ Features

- 🔐 **Secure Configuration**: Environment-based credential management
- 🐳 **Docker Orchestration**: Complete Docker Compose setup
- 🛠️ **Easy Management**: Single script for all operations
- 🌐 **GitHub Ready**: Proper `.gitignore` and structure for open source
- 🔒 **Security Focused**: No hardcoded credentials, minimal attack surface
- 📊 **Health Monitoring**: Built-in container health checks
- 🎯 **Production Ready**: Optimized for both development and production use
- ⛏️ **Bitaxe Optimized**: Configured for Bitaxe Gamma solo mining (1.2 TH/s)
- 🔗 **Merge Mining Ready**: Support for simultaneous BTC/DGB mining
- 🏆 **Solo Mining Support**: Direct connection for independent mining
- 💰 **Wallet Integration**: Built-in support for Coinbase and external wallets
- 🆕 **Latest DigiByte**: Using DigiByte Core v8.22.2 with improved fee estimation

## 🚀 Quick Start

### Prerequisites

- Docker (20.10+)
- Docker Compose (2.0+)
- Git
- 50GB+ free disk space (for blockchain data)

### 1. Clone and Setup

```bash
git clone https://github.com/moderndegree/docker-bitaxe-merge-mining-nodes.git
cd docker-bitaxe-merge-mining-nodes
chmod +x manage-nodes.sh wallet-setup.sh
```

### 2. Configure Environment

```bash
# Create your environment file from the template
./manage-nodes.sh setup-env

# Edit the .env file with your actual credentials
nano .env
```

**Important**: Update these critical values in your `.env` file:
```bash
# Use strong, unique credentials
BTC_RPC_USER=your_secure_btc_username
BTC_RPC_PASSWORD=your_super_secret_btc_password
DGB_RPC_USER=your_secure_dgb_username
DGB_RPC_PASSWORD=your_super_secret_dgb_password
```

### 3. Build and Start

```bash
# Build the Docker images
./manage-nodes.sh build

# Start the services
./manage-nodes.sh start

# Check status
./manage-nodes.sh status
```

## 🎛️ Management Commands

| Command | Description |
|---------|-------------|
| `./manage-nodes.sh setup-env` | Create .env file from template |
| `./manage-nodes.sh show-env` | Display current configuration |
| `./manage-nodes.sh build` | Build Docker images |
| `./manage-nodes.sh start` | Start all services |
| `./manage-nodes.sh stop` | Stop all services |
| `./manage-nodes.sh restart` | Restart all services |
| `./manage-nodes.sh status` | Show service and blockchain status |
| `./manage-nodes.sh logs [service]` | View logs (all or specific service) |
| `./manage-nodes.sh btc-cli <command>` | Execute Bitcoin CLI commands |
| `./manage-nodes.sh dgb-cli <command>` | Execute DigiByte CLI commands |
| `./manage-nodes.sh clean` | Remove containers and images |
| `./wallet-setup.sh setup` | Configure wallet addresses for mining rewards |
| `./wallet-setup.sh show` | Display current wallet configuration |
| `./wallet-setup.sh test` | Test wallet connectivity and validation |

## ⚙️ Configuration

All configuration is managed through environment variables in your `.env` file.

### Quick Configuration
**Required**: Set these essential credentials in your `.env` file:

```bash
# Required RPC credentials
BTC_RPC_USER=your_secure_btc_username
BTC_RPC_PASSWORD=your_super_secret_btc_password
DGB_RPC_USER=your_secure_dgb_username
DGB_RPC_PASSWORD=your_super_secret_dgb_password
```

### Complete Configuration Reference
| Category | Variable | Default | Description |
|----------|----------|---------|-------------|
| **Bitcoin** | `BTC_RPC_USER` | `bitcoin_user` | Bitcoin RPC username ✅ |
| | `BTC_RPC_PASSWORD` | `bitcoin_password` | Bitcoin RPC password ✅ |
| | `BTC_RPC_PORT` | `8332` | Bitcoin RPC port |
| | `BTC_P2P_PORT` | `8333` | Bitcoin P2P port |
| | `BTC_TESTNET` | `0` | Enable testnet (0=mainnet, 1=testnet) |
| | `BTC_MAX_CONNECTIONS` | `125` | Maximum peer connections |
| **DigiByte** | `DGB_RPC_USER` | `digibyte_user` | DigiByte RPC username ✅ |
| | `DGB_RPC_PASSWORD` | `digibyte_password` | DigiByte RPC password ✅ |
| | `DGB_RPC_PORT` | `14022` | DigiByte RPC port |
| | `DGB_P2P_PORT` | `12024` | DigiByte P2P port |
| | `DGB_TESTNET` | `0` | Enable testnet (0=mainnet, 1=testnet) |
| | `DGB_MAX_CONNECTIONS` | `300` | Maximum peer connections |
| **Network** | `NETWORK_SUBNET` | `172.20.0.0/16` | Docker network subnet |
| | `RPC_ALLOW_IP` | `172.20.0.0/16` | RPC access subnet |
| **System** | `TX_INDEX` | `1` | Enable transaction index |
| **Wallets** | `COINBASE_BTC_ADDRESS` | _(empty)_ | Bitcoin address for Coinbase integration |
| | `BTC_MINING_ADDRESS` | _(empty)_ | Alternative Bitcoin mining address |
| | `DGB_PAYOUT_ADDRESS` | _(empty)_ | DigiByte wallet address for rewards |

**Legend**: ✅ = Required | All others optional with sensible defaults

### Configuration Validation
```bash
# Verify your configuration
./manage-nodes.sh show-env

# Test wallet addresses (if configured)
./wallet-setup.sh test
```

## ⛏️ Mining Setup & Configuration

### Prerequisites
- **Bitaxe gamma device** with latest firmware
- **Network connectivity** between Bitaxe and your Docker host
- **Realistic expectations** about solo mining probability

### Connecting Your Bitaxe

1. **Start the nodes**:
```bash
./manage-nodes.sh start
./manage-nodes.sh status
```

2. **Configure Bitaxe mining settings**:
   - **Bitcoin**: `stratum+tcp://YOUR_HOST_IP:8332` (Worker: `BTC_RPC_USER`, Password: `BTC_RPC_PASSWORD`)
   - **DigiByte**: `stratum+tcp://YOUR_HOST_IP:14022` (Worker: `DGB_RPC_USER`, Password: `DGB_RPC_PASSWORD`)

3. **Network configuration** (if Bitaxe is on different network):
```bash
# Update .env file
RPC_ALLOW_IP=192.168.1.0/24  # Your network range
```

### Mining Monitoring & Operations
```bash
# Check mining status
./manage-nodes.sh btc-cli getmininginfo
./manage-nodes.sh dgb-cli getmininginfo

# Monitor network statistics
./manage-nodes.sh btc-cli getnetworkhashps
./manage-nodes.sh dgb-cli getdifficulty

# Check recent blocks
./manage-nodes.sh btc-cli getbestblockhash
./manage-nodes.sh dgb-cli getbestblockhash

# Test connectivity
curl -u $BTC_RPC_USER:$BTC_RPC_PASSWORD \
  -d '{"jsonrpc":"1.0","id":"test","method":"getblockchaininfo","params":[]}' \
  -H 'Content-Type: application/json' http://localhost:8332/
```

### Mining Reality Check
**Block Discovery Probability (Bitaxe Gamma ~1.2 TH/s):**
- **Bitcoin**: ~1 block every 23,500 years (extremely rare)
- **DigiByte**: ~1 block every 1-2 months (varies by algorithm)

**Why Solo Mine?** Learning, network support, lottery excitement, and technical mastery.

### Troubleshooting Mining Issues
| Issue | Solution |
|-------|----------|
| **Bitaxe can't connect** | Check firewall, network routing, RPC credentials |
| **High reject rate** | Verify node synchronization and network latency |
| **No work from node** | Ensure `TX_INDEX=1` and nodes are fully synced |
| **Connection drops** | Check network stability and RPC allow list |

##  Usage Examples

### Basic Operations
```bash
# Node management
./manage-nodes.sh start
./manage-nodes.sh status
./manage-nodes.sh logs

# Blockchain status
./manage-nodes.sh btc-cli getblockchaininfo
./manage-nodes.sh dgb-cli getnetworkinfo

# Configuration
./manage-nodes.sh show-env
./wallet-setup.sh show
```

### Advanced Operations
```bash
# Wallet management (optional)
./manage-nodes.sh btc-cli createwallet "mining_rewards"
./manage-nodes.sh btc-cli getnewaddress "mining" "bech32"
./manage-nodes.sh btc-cli getbalance

# Network monitoring
./manage-nodes.sh btc-cli getpeerinfo | grep addr
./manage-nodes.sh dgb-cli getconnectioncount
```

## 💰 Wallet Integration

### Setup
```bash
# Automated setup
./wallet-setup.sh setup

# Manual configuration in .env file
COINBASE_BTC_ADDRESS=bc1qexample...your...address...here
DGB_PAYOUT_ADDRESS=Dexample...your...dgb...address...here
```

### Important Notes
- **Coinbase does NOT support DigiByte** - use Exodus, Trust Wallet, or DigiByte Core
- **Solo mining probability is extremely low** (~200,000 years for Bitcoin blocks)
- **Block rewards are substantial** but very rare to find

### Recommended DigiByte Wallets
| Wallet | Platform | Features |
|--------|----------|----------|
| **Exodus** | Desktop/Mobile | User-friendly, built-in exchange |
| **Trust Wallet** | Mobile | Multi-currency, DeFi support |
| **DigiByte Core** | Desktop | Official wallet, full node |

## 🐛 Troubleshooting

### Common Issues
| Issue | Solution |
|-------|----------|
| **No .env file** | Run `./manage-nodes.sh setup-env` |
| **Permission denied** | Run `chmod +x manage-nodes.sh wallet-setup.sh` |
| **Port conflicts** | Update ports in `.env` file |
| **RPC connection issues** | Verify credentials in `.env` file |
| **Sync issues** | Check logs: `./manage-nodes.sh logs [service]` |
| **Disk space** | Ensure 50GB+ free space |
| **Bitaxe connection fails** | Check network connectivity and firewall |
| **High reject rate** | Ensure nodes are synced, check latency |
| **No work from node** | Verify `TX_INDEX=1` and sync status |

### Network Connectivity Tests
```bash
# Basic connectivity
ping YOUR_HOST_IP
telnet YOUR_HOST_IP 8332   # Bitcoin RPC
telnet YOUR_HOST_IP 14022  # DigiByte RPC

# Node status
./manage-nodes.sh btc-cli getconnectioncount
./manage-nodes.sh dgb-cli getconnectioncount
```

##  Project Structure

```
docker-bitaxe-merge-mining-nodes/     # Bitaxe Solo Mining Node Setup
├── 📄 LICENSE                # MIT License
├── 📖 README.md              # This documentation (includes mining guide)
├── 📝 CHANGELOG.md           # Version history and mining updates  
├── 🤝 CONTRIBUTING.md        # Guidelines for mining community contributions
├── ⚙️  .env.example           # Mining configuration template with Bitaxe examples
├── 🔒 .gitignore             # Git exclusion rules
├── 🐳 docker-compose.yml     # Service orchestration optimized for mining
├── 🎮 manage-nodes.sh        # Main management script with mining commands
├── � wallet-setup.sh        # Wallet configuration script for mining rewards
├── �📦 Dockerfile.dgb         # DigiByte Docker image for merge mining (v8.22.2)
├── 📁 btc-data/              # Bitcoin blockchain data for solo mining
│   └── .gitkeep              # Ensures directory tracking
└── 📁 dgb-data/              # DigiByte blockchain data for merge mining
    └── .gitkeep              # Ensures directory tracking
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## ⚖️ License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Third-Party Software

This project configures and runs:
- **Bitcoin Core**: Licensed under MIT License ([Bitcoin GitHub](https://github.com/bitcoin/bitcoin))
- **DigiByte Core**: Licensed under MIT License ([DigiByte GitHub](https://github.com/DigiByte-Core/DigiByte))

## ⚠️ Disclaimer

**Important**: By using this software to run cryptocurrency nodes and mining operations, you acknowledge that:

- You are responsible for compliance with all applicable laws and regulations
- Cryptocurrency regulations vary by jurisdiction
- This software is provided "as is" without warranty
- Running cryptocurrency nodes may consume significant bandwidth and storage
- Solo mining probability is extremely low with small hashrate
- Always use strong, unique passwords for RPC access
- Mining rewards are subject to cryptocurrency market volatility

## 🔗 Resources & Links

### Bitaxe Hardware & Firmware
- **Bitaxe Gamma**: [github.com/bitaxeorg/bitaxeGamma](https://github.com/bitaxeorg/bitaxeGamma)
- **ESP-Miner Firmware**: [github.com/bitaxeorg/ESP-Miner](https://github.com/bitaxeorg/ESP-Miner)
- **Bitaxe Website**: [bitaxe.org](https://bitaxe.org)
- **OSMU Community**: [Open Source Miners United Discord](https://osmu.xyz)

### Mining Statistics & Calculators
- **Bitcoin Difficulty**: [bitcoinwisdom.io](https://bitcoinwisdom.io)
- **DigiByte Stats**: [digiexplorer.info](https://digiexplorer.info)
- **Solo Mining Calculator**: [solo.ckpool.org/static](https://solo.ckpool.org/static)

### Educational Resources
- **Merge Mining**: [Bitcoin Wiki - Merged Mining](https://en.bitcoin.it/wiki/Merged_mining_specification)
- **Full Node Benefits**: Why running your own node matters for decentralization
- **ASIC Mining**: Hardware considerations and optimization tips

### Alternative Options
Consider pool mining for regular payouts, hybrid approaches, or testnet for learning without financial risk.

## 🆘 Support

- 📖 Check the [Troubleshooting](#-troubleshooting) section
- 🐛 [Open an issue](https://github.com/moderndegree/docker-bitaxe-merge-mining-nodes/issues) for bugs
- 💡 [Start a discussion](https://github.com/moderndegree/docker-bitaxe-merge-mining-nodes/discussions) for questions

---

**Made with ❤️ for the cryptocurrency community**
