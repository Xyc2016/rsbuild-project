FROM node:24 AS builder

WORKDIR /app

COPY . /app/

RUN yarn
RUN yarn run build


FROM node:24

WORKDIR /app

COPY --from=builder /app/dist ./dist

CMD ["npx", "--yes", "http-server", "dist"]
