#!/bin/bash
set -e

ln -fs /var/www/wp_html/* /var/www/

exec "$@"
