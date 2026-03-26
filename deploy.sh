#!/bin/bashS

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "Checking Docker installation..."

if ! command -v docker &> /dev/null
then
 echo -e "${RED}ERROR: Docker is not installed${NC}"
 exit 1
fi

echo "Checking port 80..."

if sudo lsof -i :80 &> /dev/null
then
 echo -e "${RED}ERROR: Port 80 already in use${NC}"
 exit 1
fi

echo "Checking port 3306..."

if sudo lsof -i :3306 &> /dev/null
then
 echo -e "${RED}ERROR: Port 3306 already in use${NC}"
 exit 1
fi

echo -e "${GREEN}All checks passed. Deploying containers...${NC}"

docker compose up -d
