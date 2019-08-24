#!/bin/bash

set -eo

BRANCH=${GITHUB_REF#refs/heads/}
ITEM_SLUG="$INPUT_ITEM_SLUG"
SAVE_PATH="$INPUT_SAVE_PATH"
PACKAGE_NAME="$INPUT_PACKAGE_NAME"
HEADERS="$INPUT_HEADERS"
DOMAIN="$INPUT_DOMAIN"

if [[ -z "$ITEM_SLUG" ]]; then
	ITEM_SLUG=${GITHUB_REPOSITORY#*/}
fi

if [[ -z "$SAVE_PATH" ]]; then
	echo "Set Pot File Save destination"
	exit 1
fi

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable"
	exit 1
fi

if [[ -z "$HEADERS" ]]; then
	HEADERS='{}'
fi

if [[ -z "$DOMAIN" ]]; then
	DOMAIN=${ITEM_SLUG}
fi

if [[ ! -e $SAVE_PATH ]]; then
    mkdir $SAVE_PATH
elif [[ ! -d $SAVE_PATH ]]; then
    rm -r $SAVE_PATH
    mkdir $SAVE_PATH
fi

# Update Github Config.
git config --global user.email "githubactionbot+wp@gmail.com" && git config --global user.name "WP Pot Generator"

## Generate POT File.
wp i18n make-pot . "$SAVE_PATH/$DOMAIN.pot" --slug="$ITEM_SLUG" --package-name="$PACKAGE_NAME" --headers="$HEADERS" --domain="$DOMAIN" --allow-root

# Add File To Commit
git add -A

# Add Commit Message
git commit -m "WordPress POT File Created/Update"

# Push To Github
git push "https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY" HEAD:$BRANCH