#!/bin/bash

if [[ -n "$TOOLBOX_PATH" ]]; then
	echo "Can't toggle theme from toolbox"
	exit 1
fi

theme_file="$SYSTEM_CONFIG/theme"

if [[ -e "$theme_file" ]]; then
	read theme < "$theme_file"
fi

if [[ "$theme" == "dark" ]]; then
	echo "light" > "$theme_file"
else
	echo "dark" > "$theme_file"
fi

$SYSTEM_CONFIG/scripts/set_theme.sh
