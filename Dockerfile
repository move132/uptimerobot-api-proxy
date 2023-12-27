
# # 设置基础镜像
# FROM node:slim
# WORKDIR /app

# # COPY package*.json tsup.config.ts ./src/index.ts ./
# COPY . .

# # 安装依赖
# RUN npm install -g pnpm && pnpm install
# # 构建项目
# RUN pnpm run tsup

# # 暴露端口
# EXPOSE 3006
# ENV PORT 3006
# ENV BASE_URL https://api.uptimerobot.com/v2
# # 运行应用
# CMD ["node", "dist/index.js"]



# 设置基础镜像
FROM node:slim
WORKDIR /app

COPY ./dist .

# 暴露端口
EXPOSE 3006
ENV PORT 3006
ENV BASE_URL https://api.uptimerobot.com/v2
# 运行应用
CMD ["node", "dist/index.js"]