# 'as' tag the name of this phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# from 一出现, 表示自动结束上一个 phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html