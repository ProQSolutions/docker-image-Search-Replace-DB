## Building
To use build this image:
`docker build .`

## Using the image
When this container initializes it will look for a wordpress install located at /var/www/wp_html/
So you will want to mount your WordPress directory there

## Example Docker Compose
```
version: '2'

services:
  db:
    image: mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: wordpress
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress

  wordpress:
    image: wordpress:latest
    volumes:
      - ./www:/var/www/html
    links:
      - db
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_PASSWORD: wordpress

  searchreplacedb:
    image: proq/Search-Replace-DB
    ports:
      - "8080:80"
    links:
      - db
    volumes:
      - ./www:/var/www/wp_html
```
