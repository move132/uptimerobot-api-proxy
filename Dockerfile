# 使用 node 的官方镜像作为基础镜像
FROM node:lts as build-stage

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 文件
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制项目文件和文件夹到工作目录
COPY . .

# 构建应用
RUN npm run tsup


FROM node:slim

COPY --from=build-stage /app/ /app/

# 暴露端口
EXPOSE 3006
ENV PORT 3006
ENV BASE_URL https://api.uptimerobot.com/v2
# 运行应用
CMD ["node", "app/dist/index.js"]
