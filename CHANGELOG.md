# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release of Bitcoin & DigiByte Docker setup for Bitaxe Gamma solo mining
- Environment-based configuration system optimized for mining operations
- Unified management script (`manage-nodes.sh`) with mining-specific commands
- Docker Compose orchestration for both nodes with mining considerations
- Health checks for service monitoring and mining reliability
- Comprehensive documentation including Bitaxe Gamma setup and merge mining guides
- MIT License for open source sharing
- Contributing guidelines for mining community
- Security-focused design with non-root containers

### Features
- **Bitaxe Gamma Solo Mining Support**: Optimized for BM1370-based miners (~1.2 TH/s)
- **Merge Mining Ready**: Simultaneous Bitcoin and DigiByte mining capabilities
- **Secure Configuration**: Environment variables for all sensitive mining credentials
- **Easy Management**: Single script for all mining node operations
- **Docker Orchestration**: Complete setup with health monitoring for mining stability
- **GitHub Ready**: Proper `.gitignore` and structure for open source mining projects
- **Production Ready**: Optimized for both development and production mining setups
- **Multi-Platform**: Supports Linux, macOS, and Windows (with WSL)

### Mining-Specific Features
- **Solo Mining Configuration**: Direct node connection for independent mining
- **RPC Optimization**: Proper stratum-like interface for ASIC miners
- **Network Configuration**: Flexible network setup for various mining topologies
- **Mining Monitoring**: Built-in commands for tracking mining performance
- **Merge Mining Support**: Simultaneous mining of Bitcoin and DigiByte
- **Low Latency Setup**: Optimized for minimal mining latency

### Security
- No hardcoded mining credentials in any files
- `.env` file automatically excluded from version control
- RPC access configurable for mining network topology
- Non-root user execution in containers
- Strong password recommendations for mining security
- Network isolation options for mining operations

### Documentation
- Comprehensive README with Bitaxe setup guide
- Detailed merge mining explanation and benefits
- Solo mining configuration and expectations
- Mining-specific troubleshooting section
- Network connectivity guides for mining setups
- Mining resources and educational materials
- Contributing guidelines for mining community participation
- MIT License with proper attributions

## [1.0.0] - 2025-06-15

### Added
- Initial project structure optimized for Bitaxe Gamma solo mining
- Bitcoin Core node support with mining configuration
- DigiByte Core node support (v7.17.3) with merge mining capability
- Environment variable configuration for mining credentials
- Docker Compose orchestration for mining node reliability
- Management script with mining-specific functionality
- Comprehensive mining documentation and licensing

---

## Version History

- **v1.0.0** - Initial release with full Bitcoin and DigiByte solo mining support for Bitaxe Gamma (BM1370-based, ~1.2 TH/s)
