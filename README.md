# uptimer-proxy

## Build
```bash
 docker build --no-cache -t uptime .
```

## 本地运行

```bash
docker run -itd \
  -p 3006:3006 \
  --name uptimer-proxy \
  -e PORT=3006 \
  -e BASE_URL=https://api.uptimerobot.com/v2 uptime:latest
```

## 拉取远端镜像运行
```bash
docker run -itd \
  -p 3006:3006 \
  --name uptimer-proxy \
  -e PORT=3006 \
  -e BASE_URL=https://api.uptimerobot.com/v2 move132/uptime:latest
```