#!/bin/sh -e
# Usage: sh -c "$(curl -fsSL boot.roly.sh)"

repo="https://github.com/ylor/env"
dest="$HOME/.local/share/env"

# Prompt the user to press Enter to continue
echo "zero to env in 60"
echo "press Enter to proceed... (or ctrl+c to abort)"
read

echo "cloning..."
rm -rf "$dest" && mkdir -p "$dest"
# if command -v git >/dev/null; then
# 	git clone --quiet --recursive "$repo.git" "$dest"
# else
# 	curl --fail --show-error --location "$repo/archive/master.tar.gz" | tar --extract --strip-components=1 --directory "$dest"
# fi
cp -ri . "$HOME/.local/share/env"
echo "cloned!"

echo "initializing..."
if [ -d "$dest" ]; then
	sh "$dest/init.sh"
else
    bold='\033[1m'
    underline='\033[4m'
    red='\033[31m'
    # green='\033[32m'
    # reset='\033[0m'
	echo "${red}${bold}✗ ERROR"
	exit 1
fi
