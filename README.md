# docker-rainloop
[![](https://images.microbadger.com/badges/image/solidnerd/rainloop.svg)](http://microbadger.com/images/solidnerd/rainloop "Get your own image badge on microbadger.com")

A minimalistic docker version of [Rainloop Community Edition](http://www.rainloop.net/)

## Version: [1.10.4](http://www.rainloop.net/changelog/)

## Quickstart

To Start the container use the following command.

```
docker run -d -p "80:80" solidnerd/rainloop:1.10.4.179
```

**or**

```
docker-compose up
```

use [docker-compose](https://github.com/docker/compose) .

## Save the Rainloop data persistent
If you want the Rainloop data persistent than use the exposed Volume with a command like this:
```
docker run -d -p "80:80" -v $(pwd)/data:/var/www/rainloop/data solidnerd/rainloop:1.10.4.179
```

## Rainloop Specifica

### Contacts
This container supports all Database PHP extensions for the contacts:
- MySQL
- PostgreSQL
- SQLite


# LICENSE
The MIT License (MIT)

Copyright (c) 2016 Niclas Mietz
