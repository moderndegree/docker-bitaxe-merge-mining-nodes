#!/bin/bash

# Wallet Management Script for Coinbase Integration
# =================================================

COMPOSE_FILE="docker-compose.yml"
ENV_FILE=".env"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}=== $1 ===${NC}"
}

# Function to validate Bitcoin address
validate_btc_address() {
    local address=$1
    if [[ ${#address} -lt 26 ]] || [[ ${#address} -gt 62 ]]; then
        return 1
    fi
    # Basic validation for common Bitcoin address formats
    if [[ $address =~ ^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$ ]] || \
       [[ $address =~ ^bc1[a-z0-9]{39,59}$ ]] || \
       [[ $address =~ ^bc1p[a-z0-9]{58}$ ]]; then
        return 0
    fi
    return 1
}

# Function to validate DigiByte address
validate_dgb_address() {
    local address=$1
    if [[ ${#address} -lt 26 ]] || [[ ${#address} -gt 42 ]]; then
        return 1
    fi
    # DigiByte addresses start with D (legacy) or dgb1 (bech32)
    if [[ $address =~ ^D[1-9A-HJ-NP-Za-km-z]{33}$ ]] || \
       [[ $address =~ ^dgb1[a-z0-9]{39,59}$ ]]; then
        return 0
    fi
    return 1
}

# Function to setup Coinbase wallet integration
setup_coinbase_integration() {
    print_header "Coinbase Wallet Integration Setup"
    
    if [ ! -f "$ENV_FILE" ]; then
        print_error "No .env file found. Please run './manage-nodes.sh setup-env' first."
        exit 1
    fi
    
    print_status "Setting up Coinbase wallet integration..."
    echo ""
    
    # Bitcoin address setup
    print_header "Bitcoin (BTC) Coinbase Address"
    echo "To get your Bitcoin receive address:"
    echo "1. Open Coinbase app/website"
    echo "2. Go to Portfolio → Bitcoin"
    echo "3. Click 'Receive'"
    echo "4. Copy the address shown"
    echo ""
    read -p "Enter your Coinbase Bitcoin receive address: " btc_address
    
    if ! validate_btc_address "$btc_address"; then
        print_error "Invalid Bitcoin address format. Please check and try again."
        exit 1
    fi
    
    # DigiByte address setup
    print_header "DigiByte (DGB) External Wallet"
    print_warning "IMPORTANT: Coinbase does NOT support DigiByte (DGB)!"
    echo "You need a separate wallet that supports DGB:"
    echo "- Exodus Wallet (recommended)"
    echo "- Trust Wallet"
    echo "- DigiByte Core Wallet"
    echo "- Atomic Wallet"
    echo ""
    read -p "Enter your DigiByte receive address (or press Enter to skip): " dgb_address
    
    if [ -n "$dgb_address" ] && ! validate_dgb_address "$dgb_address"; then
        print_error "Invalid DigiByte address format. Please check and try again."
        exit 1
    fi
    
    # Update .env file
    print_status "Updating .env file with wallet addresses..."
    
    # Add or update Bitcoin address
    if grep -q "^COINBASE_BTC_ADDRESS=" "$ENV_FILE"; then
        sed -i "s/^COINBASE_BTC_ADDRESS=.*/COINBASE_BTC_ADDRESS=$btc_address/" "$ENV_FILE"
    else
        echo "COINBASE_BTC_ADDRESS=$btc_address" >> "$ENV_FILE"
    fi
    
    # Add or update DigiByte address if provided
    if [ -n "$dgb_address" ]; then
        if grep -q "^DGB_PAYOUT_ADDRESS=" "$ENV_FILE"; then
            sed -i "s/^DGB_PAYOUT_ADDRESS=.*/DGB_PAYOUT_ADDRESS=$dgb_address/" "$ENV_FILE"
        else
            echo "DGB_PAYOUT_ADDRESS=$dgb_address" >> "$ENV_FILE"
        fi
    fi
    
    print_status "Wallet addresses configured successfully!"
    echo ""
    
    # Display configured addresses
    print_header "Configured Addresses"
    echo "Bitcoin (BTC): $btc_address"
    if [ -n "$dgb_address" ]; then
        echo "DigiByte (DGB): $dgb_address"
    else
        echo "DigiByte (DGB): Not configured"
    fi
    echo ""
    
    print_warning "IMPORTANT REMINDERS:"
    echo "1. Solo mining with 1.2 TH/s has EXTREMELY low probability of finding blocks"
    echo "2. Bitcoin blocks reward ~6.25 BTC (~$150k+ at current prices)"
    echo "3. You're competing against miners with ExaHash/s (millions of times more powerful)"
    echo "4. This setup is primarily for learning and supporting the network"
    echo "5. Consider pool mining for regular rewards"
    echo ""
    
    print_status "To apply changes, restart your nodes:"
    echo "./manage-nodes.sh restart"
}

# Function to show current wallet configuration
show_wallet_config() {
    print_header "Current Wallet Configuration"
    
    if [ ! -f "$ENV_FILE" ]; then
        print_error "No .env file found."
        return 1
    fi
    
    BTC_ADDR=$(grep "^COINBASE_BTC_ADDRESS=" "$ENV_FILE" 2>/dev/null | cut -d'=' -f2)
    DGB_ADDR=$(grep "^DGB_PAYOUT_ADDRESS=" "$ENV_FILE" 2>/dev/null | cut -d'=' -f2)
    
    if [ -n "$BTC_ADDR" ]; then
        echo "Bitcoin (Coinbase): $BTC_ADDR"
    else
        echo "Bitcoin (Coinbase): Not configured"
    fi
    
    if [ -n "$DGB_ADDR" ]; then
        echo "DigiByte: $DGB_ADDR"
    else
        echo "DigiByte: Not configured"
    fi
}

# Function to test node connection with wallet
test_wallet_connection() {
    print_header "Testing Wallet Connection"
    
    # Test if nodes are running
    if ! docker compose -f "$COMPOSE_FILE" ps | grep -q "Up"; then
        print_error "Nodes are not running. Start them with: ./manage-nodes.sh start"
        return 1
    fi
    
    print_status "Testing Bitcoin node connection..."
    if docker compose -f "$COMPOSE_FILE" exec -T btc bitcoin-cli getblockchaininfo > /dev/null 2>&1; then
        print_status "✓ Bitcoin node is responding"
    else
        print_error "✗ Bitcoin node is not responding"
    fi
    
    print_status "Testing DigiByte node connection..."
    if docker compose -f "$COMPOSE_FILE" exec -T dgb digibyte-cli getblockchaininfo > /dev/null 2>&1; then
        print_status "✓ DigiByte node is responding"
    else
        print_error "✗ DigiByte node is not responding"
    fi
}

# Function to show usage
show_usage() {
    echo "Wallet Management for Coinbase Integration"
    echo ""
    echo "Usage: $0 <command>"
    echo ""
    echo "Commands:"
    echo "  setup     - Setup Coinbase wallet integration"
    echo "  show      - Show current wallet configuration"
    echo "  test      - Test connection to nodes"
    echo "  help      - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 setup    # Configure Coinbase and DigiByte wallet addresses"
    echo "  $0 show     # Display currently configured addresses"
    echo "  $0 test     # Test if nodes are responding"
}

# Main script logic
case "$1" in
    setup)
        setup_coinbase_integration
        ;;
    show)
        show_wallet_config
        ;;
    test)
        test_wallet_connection
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        show_usage
        exit 1
        ;;
esac
