FROM node:22-alpine AS builder

WORKDIR /app

RUN corepack enable
COPY pnpm-lock.yaml package.json ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --registry https://registry.npmmirror.com

COPY . .

RUN pnpm build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html

