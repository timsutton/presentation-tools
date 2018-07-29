#!/bin/bash -eu

# Bail if 'highlight' not found
if ! highlight -h > /dev/null 2> /dev/null; then
	echo "highlight not found at PATH. 'brew install highlight' is one way to install it."
	exit 1
fi

# Install themes
#
# conf_dir will be /usr/local/etc/highlight if installed iwth brew
conf_dir=$(highlight --print-config | awk -F'= ' '/HL_CONFIG_DIR/ {print $2}')
mkdir -p "${conf_dir}/themes"
cp -v highlight_themes/*.theme "${conf_dir}/themes"
