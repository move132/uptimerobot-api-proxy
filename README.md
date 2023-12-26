# uptimer-proxy

# Build
```bash
 docker build --no-cache -t uptime .
```

# 运行

```bash
docker run \
  -itd
  -p 3006:3006 \
  --name uptimer-proxy \
  -e PORT=3006 \
  -e BASE_URL=https://api.uptimerobot.com/v2 uptime:latest
```

