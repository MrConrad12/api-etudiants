FROM node:18-alpine AS build
WORKDIR /app

RUN corepack enable
COPY . .

RUN yarn install
RUN yarn build

# Étape finale
FROM node:18-alpine
WORKDIR /app

RUN corepack enable
COPY --from=build /app/dist ./dist
COPY package.json .
COPY yarn.lock .

RUN yarn config set enableImmutableInstalls false
RUN yarn workspaces focus --production

EXPOSE 3000
CMD ["node", "dist/index.js"]
