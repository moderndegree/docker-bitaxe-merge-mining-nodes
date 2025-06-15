#!/bin/bash

# Bitcoin & DigiByte Docker Compose Management Script

COMPOSE_FILE="docker-compose.yml"
PROJECT_NAME="docker-bitaxe-merge-mining-nodes"
ENV_FILE=".env"
ENV_EXAMPLE=".env.example"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

# Function to load environment variables
load_env() {
    if [ -f "$ENV_FILE" ]; then
        export $(grep -v '^#' "$ENV_FILE" | xargs)
        print_status "Environment variables loaded from $ENV_FILE"
    else
        print_warning "No $ENV_FILE found. Using default values."
        print_warning "Consider copying $ENV_EXAMPLE to $ENV_FILE and customizing it."
    fi
}

# Function to create .env file from template
setup_env() {
    print_header "Environment Setup"
    
    if [ -f "$ENV_FILE" ]; then
        print_warning "$ENV_FILE already exists. Do you want to overwrite it? (y/N)"
        read -r response
        if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            print_status "Environment setup cancelled"
            return
        fi
    fi
    
    if [ ! -f "$ENV_EXAMPLE" ]; then
        print_error "$ENV_EXAMPLE not found"
        return 1
    fi
    
    cp "$ENV_EXAMPLE" "$ENV_FILE"
    print_status "Created $ENV_FILE from template"
    print_warning "Please edit $ENV_FILE with your actual configuration values"
    print_status "You can use: nano $ENV_FILE or your preferred editor"
}

# Function to check prerequisites
check_prerequisites() {
    print_header "Checking Prerequisites"
    
    if ! command -v docker &> /dev/null; then
        print_error "Docker is not installed"
        exit 1
    fi
    
    if ! command -v docker-compose &> /dev/null; then
        print_error "Docker Compose is not installed"
        exit 1
    fi
    
    if [ ! -f "$COMPOSE_FILE" ]; then
        print_error "docker-compose.yml not found"
        exit 1
    fi
    
    # Load environment variables
    load_env
    
    print_status "All prerequisites met"
}

# Function to show environment info
show_env() {
    print_header "Current Environment Configuration"
    
    if [ ! -f "$ENV_FILE" ]; then
        print_warning "No $ENV_FILE found. Run '$0 setup-env' to create one."
        return
    fi
    
    echo "Bitcoin Configuration:"
    echo "  RPC User: ${BTC_RPC_USER:-[not set]}"
    echo "  RPC Port: ${BTC_RPC_PORT:-8332}"
    echo "  P2P Port: ${BTC_P2P_PORT:-8333}"
    echo "  Testnet: ${BTC_TESTNET:-0}"
    echo ""
    echo "DigiByte Configuration:"
    echo "  RPC User: ${DGB_RPC_USER:-[not set]}"
    echo "  RPC Port: ${DGB_RPC_PORT:-14022}"
    echo "  P2P Port: ${DGB_P2P_PORT:-12024}"
    echo "  Testnet: ${DGB_TESTNET:-0}"
    echo ""
    echo "Wallet Configuration:"
    echo "  Coinbase BTC Address: ${COINBASE_BTC_ADDRESS:-[not set]}"
    echo "  Bitcoin Mining Address: ${BTC_MINING_ADDRESS:-[not set]}"
    echo "  DigiByte Payout Address: ${DGB_PAYOUT_ADDRESS:-[not set]}"
    echo ""
    echo "Network:"
    echo "  Subnet: ${NETWORK_SUBNET:-172.20.0.0/16}"
    echo "  RPC Allow IP: ${RPC_ALLOW_IP:-172.20.0.0/16}"
}

# Function to build images
build() {
    print_header "Building Images"
    check_prerequisites
    
    print_status "Building DigiByte image..."
    docker-compose build dgb
    
    print_status "Build completed successfully"
}

# Function to start services
start() {
    print_header "Starting Services"
    check_prerequisites
    
    # Create data directories
    mkdir -p btc-data dgb-data
    
    print_status "Starting Bitcoin and DigiByte nodes..."
    docker-compose up -d
    
    print_status "Services started successfully"
    print_status "Bitcoin RPC: http://localhost:${BTC_RPC_PORT:-8332}"
    print_status "DigiByte RPC: http://localhost:${DGB_RPC_PORT:-14022}"
    
    # Wait a moment then show status
    sleep 3
    status
}

# Function to stop services
stop() {
    print_header "Stopping Services"
    
    print_status "Stopping all services..."
    docker-compose down
    
    print_status "Services stopped successfully"
}

# Function to restart services
restart() {
    print_header "Restarting Services"
    stop
    sleep 2
    start
}

# Function to show logs
logs() {
    print_header "Service Logs"
    
    if [ -n "$1" ]; then
        # Show logs for specific service
        docker-compose logs -f "$1"
    else
        # Show logs for all services
        docker-compose logs -f
    fi
}

# Function to show status
status() {
    print_header "Service Status"
    
    # Container status
    echo "Container Status:"
    docker-compose ps
    echo ""
    
    # Check if containers are running
    BTC_RUNNING=$(docker-compose ps btc | grep -q "Up" && echo "true" || echo "false")
    DGB_RUNNING=$(docker-compose ps dgb | grep -q "Up" && echo "true" || echo "false")
    
    if [ "$BTC_RUNNING" = "true" ]; then
        print_header "Bitcoin Node Status"
        if docker-compose exec -T btc bitcoin-cli getblockchaininfo &>/dev/null; then
            docker-compose exec -T btc bitcoin-cli getblockchaininfo | grep -E '"chain"|"blocks"|"headers"|"verificationprogress"'
        else
            print_warning "Bitcoin RPC not ready yet"
        fi
        echo ""
    fi
    
    if [ "$DGB_RUNNING" = "true" ]; then
        print_header "DigiByte Node Status"
        if docker-compose exec -T dgb digibyte-cli getblockchaininfo &>/dev/null; then
            docker-compose exec -T dgb digibyte-cli getblockchaininfo | grep -E '"chain"|"blocks"|"headers"|"verificationprogress"'
        else
            print_warning "DigiByte RPC not ready yet"
        fi
        echo ""
    fi
}

# Function to execute CLI commands
btc_cli() {
    load_env
    if docker-compose ps btc | grep -q "Up"; then
        docker-compose exec btc bitcoin-cli -rpcuser="${BTC_RPC_USER:-bitcoin_user}" -rpcpassword="${BTC_RPC_PASSWORD:-bitcoin_password}" "$@"
    else
        print_error "Bitcoin container is not running"
        exit 1
    fi
}

dgb_cli() {
    load_env
    if docker-compose ps dgb | grep -q "Up"; then
        docker-compose exec dgb digibyte-cli -rpcuser="${DGB_RPC_USER:-digibyte_user}" -rpcpassword="${DGB_RPC_PASSWORD:-digibyte_password}" "$@"
    else
        print_error "DigiByte container is not running"
        exit 1
    fi
}

# Function to clean up (remove containers and images)
clean() {
    print_header "Cleaning Up"
    
    print_warning "This will remove all containers and images. Are you sure? (y/N)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        docker-compose down --rmi all --volumes
        print_status "Cleanup completed"
    else
        print_status "Cleanup cancelled"
    fi
}

# Function to show usage
usage() {
    echo "Usage: $0 {setup-env|build|start|stop|restart|logs|status|show-env|btc-cli|dgb-cli|clean}"
    echo ""
    echo "Commands:"
    echo "  setup-env  - Create .env file from template"
    echo "  build      - Build all Docker images"
    echo "  start      - Start all services"
    echo "  stop       - Stop all services"
    echo "  restart    - Restart all services"
    echo "  logs       - Show logs (use 'logs btc' or 'logs dgb' for specific service)"
    echo "  status     - Show service and blockchain status"
    echo "  show-env   - Display current environment configuration"
    echo "  btc-cli    - Execute bitcoin-cli commands"
    echo "  dgb-cli    - Execute digibyte-cli commands"
    echo "  clean      - Remove all containers and images"
    echo ""
    echo "Examples:"
    echo "  $0 setup-env"
    echo "  $0 start"
    echo "  $0 status"
    echo "  $0 show-env"
    echo "  $0 btc-cli getblockchaininfo"
    echo "  $0 dgb-cli getnetworkinfo"
    echo "  $0 logs dgb"
    echo ""
    echo "First-time setup:"
    echo "  1. $0 setup-env"
    echo "  2. Edit .env file with your credentials"
    echo "  3. $0 build"
    echo "  4. $0 start"
}

# Main script logic
case "$1" in
    setup-env)
        setup_env
        ;;
    build)
        build
        ;;
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    logs)
        shift
        logs "$@"
        ;;
    status)
        status
        ;;
    show-env)
        show_env
        ;;
    btc-cli)
        shift
        btc_cli "$@"
        ;;
    dgb-cli)
        shift
        dgb_cli "$@"
        ;;
    clean)
        clean
        ;;
    *)
        usage
        exit 1
        ;;
esac
