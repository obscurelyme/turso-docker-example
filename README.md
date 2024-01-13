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
