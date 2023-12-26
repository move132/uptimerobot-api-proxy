# FROM node:16

# RUN npm install -g pnpm && npm install -g tsup

# WORKDIR /app

# COPY ./src/index.ts package.json tsup.config.ts tsconfig.json .
# RUN pnpm install && pnpm run build

# EXPOSE 9008

# CMD [ "node", "./dist/index.js" ]

# # 设置基础镜像
# FROM node:slim

# # 设置工作目录
# WORKDIR /app

# # 复制 package.json
# COPY package.json /app/

# # 安装依赖
# RUN npm install -g pnpm && pnpm install

# # 复制 index.ts 文件
# COPY ./src/index.ts /app/

# # 复制 src 目录
# COPY ./src/ /app/src/

# # 调试命令，列出容器中的文件
# RUN ls /app

# # 构建项目
# RUN npm run build

# # 调试命令，列出容器中的文件
# RUN ls /app

# # 暴露端口
# EXPOSE 3006
# ENV PORT 3006
# ENV BASE_URL https://api.uptimerobot.com/v2
# # 运行应用
# CMD ["node", "dist/index.js"]



# 设置基础镜像
FROM node:slim
WORKDIR /app

COPY package*.json tsup.config.ts ./src/index.ts ./

# 调试命令，列出容器中的文件
RUN ls /app
# 安装依赖
RUN npm install -g pnpm && pnpm install
# 构建项目
RUN npm run tsup

COPY . .
# 调试命令，列出容器中的文件
RUN ls /app

# 暴露端口
EXPOSE 3006
ENV PORT 3006
ENV BASE_URL https://api.uptimerobot.com/v2
# 运行应用
CMD ["node", "dist/index.js"]