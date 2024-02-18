#!/usr/bin/env bash
# Wezterm Project - Start a new wezterm project

PROJECTS_DIR="$HOME/.config/wezterm/projects"

project=""

if [[ -z "$1" ]]; then
	# List all files in projects directory. Only keep the file name without the extension
	project=$(find "$PROJECTS_DIR" -maxdepth 1 -type f -name "*.lua" | xargs -n 1 basename | sed "s/\.lua//" | fzf --cycle --layout=reverse)
else
	if [[ ! -e "$PROJECTS_DIR/$1.lua" ]]; then
		echo "The project file '$PROJECTS_DIR/$1.lua' not exists"
		exit 1
	fi
	project="$1"
fi

if [[ -z $project ]]; then
	echo "No project selected"
	exit 1
fi

WZ_PROJECT="$project" wezterm start --always-new-process &
