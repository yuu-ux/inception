#!/bin/sh
set -eu

# /var/www/html が空なら WordPress を展開
if [ ! -e /var/www/html/wp-includes/version.php ]; then
  echo "[entrypoint] Populating /var/www/html with WordPress..."
  tmpdir=$(mktemp -d)
  unzip -q /usr/src/wordpress.zip -d "$tmpdir"
  mkdir -p /var/www/html
  # 移動（隠しファイル含む）
  sh -c "cd \"$tmpdir/wordpress\" && tar cf - ." | tar xf - -C /var/www/html
  chown -R www-data:www-data /var/www/html
  rm -rf "$tmpdir"
fi

exec "$@"

