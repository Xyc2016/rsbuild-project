FROM node:22 AS builder

WORKDIR /app

RUN corepack enable
COPY pnpm-lock.yaml package.json ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --registry https://registry.npmmirror.com

COPY . .

RUN pnpm build

FROM alpine:3
COPY --from=builder /app/dist /app/dist
