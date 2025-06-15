# Docker Bitaxe Merge Mining Nodes

> **Bitcoin & DigiByte Docker Node Setup for Bitaxe Gamma Solo Mining**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Docker](https://img.shields.io/badge/Docker-Supported-blue.svg)](https://www.docker.com/)
[![Bitcoin](https://img.shields.io/badge/Bitcoin-Core-orange.svg)](https://bitcoin.org/)
[![DigiByte](https://img.shields.io/badge/DigiByte-Core-blue.svg)](https://digibyte.org/)
[![Bitaxe](https://img.shields.io/badge/Bitaxe-Compatible-green.svg)](https://github.com/skot/bitaxe)

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
chmod +x manage-nodes.sh
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

## ⚙️ Configuration Options

All configuration is managed through environment variables in your `.env` file:

### Bitcoin Node Configuration
| Variable | Default | Description |
|----------|---------|-------------|
| `BTC_RPC_USER` | `bitcoin_user` | Bitcoin RPC username |
| `BTC_RPC_PASSWORD` | `bitcoin_password` | Bitcoin RPC password |
| `BTC_RPC_PORT` | `8332` | Bitcoin RPC port |
| `BTC_P2P_PORT` | `8333` | Bitcoin P2P port |
| `BTC_TESTNET` | `0` | Enable testnet (0=mainnet, 1=testnet) |
| `BTC_MAX_CONNECTIONS` | `125` | Maximum peer connections |

### DigiByte Node Configuration
| Variable | Default | Description |
|----------|---------|-------------|
| `DGB_RPC_USER` | `digibyte_user` | DigiByte RPC username |
| `DGB_RPC_PASSWORD` | `digibyte_password` | DigiByte RPC password |
| `DGB_RPC_PORT` | `14022` | DigiByte RPC port |
| `DGB_P2P_PORT` | `12024` | DigiByte P2P port |
| `DGB_TESTNET` | `0` | Enable testnet (0=mainnet, 1=testnet) |
| `DGB_MAX_CONNECTIONS` | `300` | Maximum peer connections |

### Network & System Configuration
| Variable | Default | Description |
|----------|---------|-------------|
| `NETWORK_SUBNET` | `172.20.0.0/16` | Docker network subnet |
| `RPC_ALLOW_IP` | `172.20.0.0/16` | RPC access subnet |
| `TX_INDEX` | `1` | Enable transaction index |

## ⛏️ Bitaxe Solo Mining Configuration

### Prerequisites for Solo Mining
- **Bitaxe gamma device** with latest firmware
- **Network connectivity** between Bitaxe and your Docker host
- **Port forwarding** (if Bitaxe is on different network)
- **Realistic expectations** about solo mining probability

### Connecting Your Bitaxe

1. **Ensure nodes are running**:
```bash
./manage-nodes.sh start
./manage-nodes.sh status
```

2. **Configure Bitaxe for Bitcoin solo mining**:
```
Pool URL: stratum+tcp://YOUR_HOST_IP:8332
Worker: YOUR_BTC_RPC_USER
Password: YOUR_BTC_RPC_PASSWORD
```

3. **Configure Bitaxe for DigiByte merge mining**:
```
Pool URL: stratum+tcp://YOUR_HOST_IP:14022  
Worker: YOUR_DGB_RPC_USER
Password: YOUR_DGB_RPC_PASSWORD
```

### Mining Pool Configuration

Your nodes will act as "pools" for your Bitaxe. The RPC endpoints provide the necessary stratum-like interface:

| Cryptocurrency | Stratum URL | Purpose |
|----------------|-------------|---------|
| **Bitcoin** | `stratum+tcp://YOUR_IP:8332` | Primary mining target |
| **DigiByte** | `stratum+tcp://YOUR_IP:14022` | Merge mining target |

### Network Configuration for Mining

If your Bitaxe is on a different network segment, update your `.env` file:

```bash
# Allow RPC access from your Bitaxe network
RPC_ALLOW_IP=192.168.1.0/24  # Replace with your network

# Or allow from specific Bitaxe IP
RPC_ALLOW_IP=192.168.1.100    # Replace with Bitaxe IP
```

### Mining Monitoring

Monitor your solo mining operation:

```bash
# Check Bitcoin mining activity
./manage-nodes.sh btc-cli getmininginfo
./manage-nodes.sh btc-cli getblocktemplate

# Check DigiByte mining activity  
./manage-nodes.sh dgb-cli getmininginfo
./manage-nodes.sh dgb-cli getblocktemplate

# Monitor network hash rate
./manage-nodes.sh btc-cli getnetworkhashps
./manage-nodes.sh dgb-cli getnetworkhashps

# Check recent blocks
./manage-nodes.sh btc-cli getbestblockhash
./manage-nodes.sh dgb-cli getbestblockhash
```

### Expected Mining Behavior

**Block Discovery Probability (Bitaxe Gamma ~1.2 TH/s):**
- **Bitcoin**: ~1 block every 23,500 years (at current difficulty)
- **DigiByte**: ~1 block every 1-2 months (varies by algorithm)

**Why Solo Mine Despite Low Probability?**
- 🎓 **Educational value** - Learn blockchain mechanics
- 🌐 **Network support** - Strengthen decentralization  
- 🎰 **Lottery excitement** - Potential for full block rewards
- 🔧 **Technical mastery** - Complete mining stack control

### Troubleshooting Mining Issues

| Issue | Solution |
|-------|----------|
| **Bitaxe can't connect** | Check firewall, network routing, RPC credentials |
| **High reject rate** | Verify node synchronization and network latency |
| **No work from node** | Ensure `txindex=1` and nodes are fully synced |
| **Connection drops** | Check network stability and RPC allow list |

## 🔒 Security Features

- **Environment-based secrets**: No hardcoded credentials in any files
- **Git-safe**: `.env` file automatically excluded from version control
- **Network isolation**: RPC access restricted to Docker network by default
- **Health monitoring**: Automatic container health checks
- **Minimal attack surface**: Only necessary ports exposed

## 🌐 Service Access

Once started, the services will be available at:

- **Bitcoin RPC**: `http://localhost:8332` (or your configured port)
- **DigiByte RPC**: `http://localhost:14022` (or your configured port)

## 📋 Example Usage

### Basic Node Operations
```bash
# Check Bitcoin blockchain synchronization
./manage-nodes.sh btc-cli getblockchaininfo

# Get DigiByte network information  
./manage-nodes.sh dgb-cli getnetworkinfo

# View current configuration
./manage-nodes.sh show-env

# Monitor all logs in real-time
./manage-nodes.sh logs

# Monitor specific service logs
./manage-nodes.sh logs btc
./manage-nodes.sh logs dgb

# Check node status and health
./manage-nodes.sh status
```

### Mining-Specific Operations
```bash
# Check mining capabilities and status
./manage-nodes.sh btc-cli getmininginfo
./manage-nodes.sh dgb-cli getmininginfo

# Get current block template (what your miner will work on)
./manage-nodes.sh btc-cli getblocktemplate
./manage-nodes.sh dgb-cli getblocktemplate

# Monitor network difficulty and hashrate
./manage-nodes.sh btc-cli getdifficulty
./manage-nodes.sh dgb-cli getdifficulty
./manage-nodes.sh btc-cli getnetworkhashps
./manage-nodes.sh dgb-cli getnetworkhashps

# Check your node's peer connections
./manage-nodes.sh btc-cli getpeerinfo | grep addr
./manage-nodes.sh dgb-cli getpeerinfo | grep addr

# Monitor recent blocks (check for any you might have found!)
./manage-nodes.sh btc-cli getbestblockhash
./manage-nodes.sh btc-cli getblock $(./manage-nodes.sh btc-cli getbestblockhash)
./manage-nodes.sh dgb-cli getbestblockhash
```

## 💰 Coinbase Wallet Integration

### Important Limitations
- **Coinbase does NOT support DigiByte (DGB)** - you'll need a separate wallet
- **Solo mining probability is extremely low** with 1.2 TH/s hashrate
- **Block rewards are substantial** (~6.25 BTC ≈ $150k+) but very rare to find

### Setup Coinbase Integration
```bash
# Run the wallet setup script
./wallet-setup.sh setup

# View current wallet configuration
./wallet-setup.sh show

# Test node connectivity
./wallet-setup.sh test
```

### Manual Configuration
If you prefer manual setup, add these to your `.env` file:

```bash
# Get this from Coinbase: Portfolio → Bitcoin → Receive
COINBASE_BTC_ADDRESS=bc1qexample...your...address...here

# For DigiByte, use a wallet that supports DGB:
# - Exodus Wallet (recommended)
# - Trust Wallet  
# - DigiByte Core Wallet
DGB_PAYOUT_ADDRESS=Dexample...your...dgb...address...here
```

### Recommended DigiByte Wallets (Since Coinbase doesn't support DGB)
| Wallet | Platform | Features |
|--------|----------|----------|
| **Exodus** | Desktop/Mobile | User-friendly, built-in exchange |
| **Trust Wallet** | Mobile | Multi-currency, DeFi support |
| **DigiByte Core** | Desktop | Official wallet, full node |
| **Atomic Wallet** | Desktop/Mobile | Multi-currency, atomic swaps |

### Mining Probability Reality Check
With a Bitaxe Gamma (1.2 TH/s):
- **Bitcoin Network**: ~500 EH/s (500,000,000 TH/s)
- **Your Share**: 0.0000024% of network hashrate
- **Expected Time**: ~200,000 years per block (statistically)
- **Purpose**: Learning, network support, lottery ticket mentality

**Consider pool mining for regular payouts instead of solo mining.**

### Wallet Operations (Optional)
```bash
# Create a new wallet for mining rewards
./manage-nodes.sh btc-cli createwallet "mining_rewards"
./manage-nodes.sh dgb-cli createwallet "mining_rewards"

# Get a new address for mining payouts
./manage-nodes.sh btc-cli getnewaddress "mining" "bech32"
./manage-nodes.sh dgb-cli getnewaddress "mining"

# Check wallet balance (if you find a block!)
./manage-nodes.sh btc-cli getbalance
./manage-nodes.sh dgb-cli getbalance
```

## 🐛 Troubleshooting

### General Issues
| Issue | Solution |
|-------|----------|
| **No .env file** | Run `./manage-nodes.sh setup-env` to create one |
| **Permission denied** | Make script executable: `chmod +x manage-nodes.sh` |
| **Port conflicts** | Check if ports are in use and update `.env` accordingly |
| **RPC connection issues** | Verify RPC credentials in `.env` file |
| **Sync issues** | Check logs: `./manage-nodes.sh logs [service]` |
| **Disk space** | Ensure 50GB+ free space for blockchain data |

### Mining-Specific Issues
| Issue | Solution |
|-------|----------|
| **Bitaxe connection fails** | Check network connectivity and firewall rules |
| **High stale/reject rate** | Ensure nodes are fully synced and network latency is low |
| **No work from node** | Verify `TX_INDEX=1` in `.env` and nodes are synchronized |
| **Bitaxe shows offline** | Check RPC credentials match `.env` values |
| **Mining to wrong address** | Configure wallet and mining address properly |
| **Can't see hashrate** | Check Bitaxe logs and stratum connection |

### Network Connectivity for Mining
```bash
# Test if mining ports are accessible from Bitaxe network
# Replace YOUR_BITAXE_IP with actual IP
ping YOUR_HOST_IP  # Basic connectivity
telnet YOUR_HOST_IP 8332  # Bitcoin RPC port
telnet YOUR_HOST_IP 14022 # DigiByte RPC port

# Check if nodes are accepting connections
./manage-nodes.sh btc-cli getconnectioncount
./manage-nodes.sh dgb-cli getconnectioncount

# Verify RPC is working
curl -u $BTC_RPC_USER:$BTC_RPC_PASSWORD \
  -d '{"jsonrpc":"1.0","id":"test","method":"getblockchaininfo","params":[]}' \
  -H 'Content-Type: application/json' \
  http://localhost:8332/
```

## 🚢 GitHub Deployment

This project is optimized for GitHub sharing:

- ✅ **Sensitive data protected**: `.env` file with credentials excluded from git
- ✅ **Directory structure preserved**: Data directories tracked via `.gitkeep` files  
- ✅ **Blockchain data excluded**: Actual blockchain files ignored by git
- ✅ **Clean repository**: Only essential project files tracked

**For new users cloning your repository:**
1. Directory structure will be automatically created
2. Run `./manage-nodes.sh setup-env` to create their own `.env` file
3. Blockchain data will sync fresh (not copied from your machine)

## 📁 Project Structure

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
├── 📦 Dockerfile.dgb         # DigiByte Docker image for merge mining
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

## 🔗 Mining Resources

### Mining Resources
- **Official Repository**: [github.com/bitaxeorg/bitaxeGamma](https://github.com/bitaxeorg/bitaxeGamma)
- **Bitaxe Organization**: [bitaxeorg](https://github.com/bitaxeorg) - All Bitaxe models
- **OSMU Community**: [Open Source Miners United Discord](https://osmu.xyz)
- **ESP-Miner Firmware**: [github.com/bitaxeorg/ESP-Miner](https://github.com/bitaxeorg/ESP-Miner)
- **Bitaxe Website**: [bitaxe.org](https://bitaxe.org)

### Mining Calculators & Stats
- **Bitcoin Difficulty**: [bitcoinwisdom.io](https://bitcoinwisdom.io)
- **DigiByte Stats**: [digiexplorer.info](https://digiexplorer.info)
- **Solo Mining Calculator**: [solo.ckpool.org/static](https://solo.ckpool.org/static)
- **Network Hash Rate**: Track both BTC and DGB network statistics

### Educational Resources
- **Merge Mining**: [Bitcoin Wiki - Merged Mining](https://en.bitcoin.it/wiki/Merged_mining_specification)
- **Solo Mining**: Understanding the economics and probability
- **Full Node Benefits**: Why running your own node matters
- **ASIC Mining**: Hardware considerations and optimization

### Alternative Mining Options
If solo mining seems too uncertain, consider:
- **Mining Pools**: Join pools for regular but smaller rewards
- **Mining Pool Comparison**: Research fees and payout methods  
- **Hybrid Approach**: Solo mine occasionally, pool mine regularly
- **Educational Mining**: Use testnet for learning without real money

## 🆘 Support

- 📖 Check the [Troubleshooting](#-troubleshooting) section
- 🐛 [Open an issue](https://github.com/moderndegree/docker-bitaxe-merge-mining-nodes/issues) for bugs
- 💡 [Start a discussion](https://github.com/moderndegree/docker-bitaxe-merge-mining-nodes/discussions) for questions

---

**Made with ❤️ for the cryptocurrency community**
