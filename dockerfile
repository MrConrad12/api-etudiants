# Étape 1 : Build
FROM node:18-alpine AS build

WORKDIR /app

RUN corepack enable
COPY . .

# Désactive PnP pour utiliser node_modules
RUN yarn config set nodeLinker node-modules

RUN yarn install
RUN yarn build

# Étape 2 : Prod image
FROM node:18-alpine

WORKDIR /app

RUN corepack enable
COPY --from=build /app/dist ./dist
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/yarn.lock ./yarn.lock
COPY --from=build /app/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "dist/index.js"]
