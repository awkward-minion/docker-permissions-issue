# Configuring npm for non-root uses in docker


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