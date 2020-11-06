#!/bin/sh
set -e

source /gh-toolkit/shell.sh

gh_validate_env "GITHUB_TOKEN" "SET GITHUB_TOKEN ENV Variable"
gh_validate_input "SAVE_PATH" "SET SAVE_PATH Variable"

gitconfig "WordPress BOT" "githubactionbot+wp@gmail.com"

ITEM_SLUG="$(gh_input "ITEM_SLUG" "${GITHUB_REPOSITORY#*/}")"
SAVE_PATH="$(gh_input "SAVE_PATH")"
PACKAGE_NAME="$(gh_input "PACKAGE_NAME")"
HEADERS="$(gh_input "HEADERS" "{}")"
DOMAIN="$(gh_input "DOMAIN" "${ITEM_SLUG}")"
SAVE_FULL_PATH="$SAVE_PATH/$DOMAIN.pot"

if [ ! -d "$DEST_FOLDER_PATH" ]; then
  mkdir -p $SAVE_PATH
fi

gh_log
gh_log_group_start "🔽 Downloading WP-CLI"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
gh_log_group_end

gh_log
gh_log_group_start "📝 Parsed Arguments"
gh_log "DOMAIN        : $DOMAIN"
gh_log "SLUG          : $SLUG"
gh_log "PACKAGE_NAME  : $PACKAGE_NAME"
gh_log "HEADERS       : $HEADERS"
gh_log "SAVE_PATH     : $SAVE_PATH/$DOMAIN.pot"
gh_log_group_end

gh_log
gh_log_group_start "📝 Generating POT File"
wp i18n make-pot . "$SAVE_FULL_PATH" --slug="$ITEM_SLUG" --package-name="$PACKAGE_NAME" --headers="$HEADERS" --domain="$DOMAIN" --allow-root
gh_log_group_end

gh_log
if [ "$(git status --porcelain)" != "" ]; then
  gh_log_group_start "👌 Pushing To Github"
  git add "$SAVE_FULL_PATH"
  git commit -m "💬 POT File Regenerated"
  git push "https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY"
  gh_log_group_end
else
  gh_log "✅ Nothing To Push"
fi
