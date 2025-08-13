
FROM node:24


WORKDIR /app

COPY . /app/

RUN corepack enable && pnpm install

CMD [ "sh", "-c", "pnpm run dev" ]
