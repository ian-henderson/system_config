#!/bin/bash

parent_dir="$PWD/.."

### Home Dir ##################################################

home_dotfiles=(
	"bash_profile"
	"bashrc"
	"gitconfig"
	"inputrc"
)

for f in "${home_dotfiles[@]}"; do
	source_file="$parent_dir/$f"
	target_file="$HOME/.$f"

	if [[ -e "$target_file" ]]; then
		rm "$target_file"
	fi

	if [[ -e "$source_file" ]]; then
		ln -s "$source_file" "$target_file"
	fi
done

bashrcd="$HOME/.bashrc.d"

if [[ -e "$bashrcd" ]]; then 
	rm -rf "$bashrcd"
fi

ln -s "$parent_dir/bashrc.d" "$bashrcd"

### Config Dir ################################################

config="$HOME/.config"

if [[ ! -d "$config" ]]; then
	mkdir -p "$config"
fi

config_dirs=(
	"alacritty"
	"fastfetch"
	"foot"
	"gammastep"
	"gtk-3.0"
	"nvim"
	"sway"
)

for d in "${config_dirs[@]}"; do
	source_dir="$parent_dir/$d"
	target_dir="$config/$d"

	if [[ -e "$target_dir" ]]; then
		rm -rf "$target_dir"
	fi

	if [[ -e "$source_dir" ]]; then
		ln -s "$source_dir" "$target_dir"
	fi
done

# One-off thing to make sure sway has a logs directory
sway_logs="$HOME/.config/sway/logs"
if [[ ! -d "$sway_logs" ]]; then
	mkdir "$sway_logs"
fi
