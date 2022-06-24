# Wrangler 2 docker wrapper

Docker wrapper for cloudflare wrangler so you don't need node or any
other dependencies

## Version
Version tag of this docker image should match version of wrangler


## Basic usage

```bash
docker run -it \
  -e CLOUDFLARE_API_TOKEN="CREATE VIA EDIT CLOUDFLARE WORKERS API TOKEN TEMPLATE" \
  -e CLOUDFLARE_ACCOUNT_ID="FIND ME IN SIDBAR OF DOMAIN OVERVIEW" \
  jez500/wrangler:latest
```

## Convenience usage

Create a `.env` file then add the `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID` variables,
ideally secure this file with permissions

Create a bash alias that calls the docker image with the `.env` file. Eg

```bash
alias wrangler="docker run -it --env-file=/home/user/.wrangler/.env jez500/wrangler:latest"
```

Then just call `wrangler`, to confirm credentials working, run `wrangler whoami`

## Config file

Default config file in the image is located at `/config/wrangler.toml` if you want to volume 
mount that to a local directory. Eg

```bash                                                                      
touch /home/user/.wrangler/config/wrangler.toml
docker run -it --env-file=/home/user/.wrangler/.env -v /home/user/.wrangler/config:/config jez500/wrangler:latest
```
