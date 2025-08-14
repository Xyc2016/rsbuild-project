FROM node:22


WORKDIR /app

COPY . .

RUN corepack enable
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --registry https://registry.npmmirror.com
RUN pnpm build

CMD ["sh", "-c", "cp -r dist/* /v-dist/"]
