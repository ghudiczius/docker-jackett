# Jackett

> The repository has been moved to [https://gitlab.jmk.hu/docker/media/jackett](https://gitlab.jmk.hu/docker/media/jackett).

Simple docker image for Jackett without any bloat, built on the official debian image. Jackett runs as user `jackett` with `uid` and `gid` `1000` and listens on port `9117`.

## Usage

```sh
docker run --rm registry.gitlab.jmk.hu/media/jackett:<VERSION> \
  -p 9117:9117 \
  -v path/to/data:/data \
  -v path/to/downloads:/downloads
```

or

```sh
docker run --rm ghudiczius/jackett:<VERSION> \
  -p 9117:9117 \
  -v path/to/data:/data \
  -v path/to/downloads:/downloads
```
