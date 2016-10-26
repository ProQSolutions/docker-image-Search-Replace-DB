#!/bin/bash
set -e

ln -s /var/www/wp_html/* /var/www/

exec "$@"