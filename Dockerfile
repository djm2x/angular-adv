FROM node:16-alpine3.14 as build-env
WORKDIR /app
COPY ./package.json ./package-lock.json ./
RUN npm ci && npm cache clean --force
COPY . ./
RUN ls -al
RUN npm run build:ssr

# FROM node:16-slim
FROM node:16-alpine3.14

WORKDIR /app
RUN mkdir -p /dist
RUN mkdir -p /node_modules
# Copy dependency definitions
COPY --from=build-env /app/dist dist
COPY --from=build-env /app/node_modules node_modules

# Expose the port the app runs in
EXPOSE 4000

# Serve the app
CMD ["node", "dist/angular-test/server/main.js"]
