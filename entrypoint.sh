#!/bin/sh

set -eu

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

echo " "
echo "##[group] ⬇️ Downloading WP-CLI"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
echo "##[endgroup]"

echo "##[group] 📝 Generator Arguments"
echo "
DOMAIN : $DOMAIN
SLUG : $ITEM_SLUG
PACKAGE_NAME : $PACKAGE_NAME
HEADERS : $HEADERS
SAVE_PATH : $SAVE_PATH/$DOMAIN.pot"
echo "##[endgroup]"

echo "##[group] 📄 Generating POT File"
wp i18n make-pot . "$SAVE_PATH/$DOMAIN.pot" --slug="$ITEM_SLUG" --package-name="$PACKAGE_NAME" --headers="$HEADERS" --domain="$DOMAIN" --allow-root
echo "##[endgroup]"

if [[ "$(git status --porcelain)" != "" ]]; then
  echo "##[group] 👌 Pushing To Github"
  git config --global user.email "githubactionbot+wp@gmail.com" && git config --global user.name "WP Pot Generator"
  git add -A
  git commit -m "💬 #$GITHUB_RUN_NUMBER - WP POT File Updated / ⚡ Triggered By $GITHUB_SHA"
  git push "https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY"
  echo "##[endgroup]"
else
  echo "✅ Nothing To Push"
fi
