#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
DARK_GREY='\033[1;30m'
NC='\033[0m'

Err() {
  echo -e "[${RED}ERROR${NC}|${DARK_GREY}$0${NC}] $1" >&2
}

Info() {
  echo -e "[${GREEN}INFO ${NC}|${DARK_GREY}$0${NC}] $1"
}

Debug() {
  echo -e "[${YELLOW}DEBUG${NC}|${DARK_GREY}$0${NC}] $1"
}
