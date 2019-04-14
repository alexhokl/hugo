# hugo

A dockerised Hugo

### Website development

```sh
docker run --rm --name website -v ${PWD}:/home/app/site -p 80:1313 -d alexhokl/hugo:dev
```

### Hosting website

```sh
docker run --rm --name website -p 80:1313 -d alexhokl/hugo:latest
```