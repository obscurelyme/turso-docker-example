# Turso w/ Express NodeJS and Docker

```sh
docker build -t [NAME] .
```

to see your image

```sh
docker image ls
```

to run the image CONTAINER_NAME is whatever you want to call the container and IMAGE_NAME is whatever you named your image in the build step.

```sh
docker run -d -p 3000:3000 --name [CONTAINER_NAME] [IMAGE_NAME]
```

To run the image with a bind mount

```sh
docker run -d -p 3000:3000 -v /"$(pwd)":/app --name [CONTAINER_NAME] [IMAGE_NAME]
```

NOTE: on windows you need a double // for anon volumes in the below case we ignore node_modules

```sh
docker run -d -p 3000:3000 -v /"$(pwd)":/app -v //app/node_modules --name [CONTAINER_NAME] [IMAGE_NAME]
```

To run with .env file

```sh
docker run -d -p 3000:3000 -v /"$(pwd)":/app -v //app/node_modules --env-file=.env --name [CONTAINER_NAME] [IMAGE_NAME]
```

### Use Docker Compose

To accomplish all of the following above but with just a single command, run...

```sh
docker-compose up -d
```

```sh
docker-compose down -v
```

#### Development docker compose

```sh
docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up -d --build
```

#### Production docker compose

```sh
docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml up -d --build
```
