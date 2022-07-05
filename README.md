# Monorepo POC for builds

This monorepo uses lerna for build and package management, contains a remix application and a node.js API.
This illustrates usage of `pkg` and `docker` 

Thankyou @Aankhen for helping me 

## Installtion

```bash
    npm install
    lerna bootstrap --hoist
```

## Build
sh
```
- This will build remix-app and its dependencies only

```bash
    lerna run build
```

## Build Binaries

- This will build express API

```bash
    lerna run build-exe
```

## Docker

```bash
docker build  -t monorepo-local-test .
docker run  -p 8080:8080 monorepo-local-test
```