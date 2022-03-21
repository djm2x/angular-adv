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
# Copy dependency definitions
# COPY --from=build-env /app/package.json .
# COPY --from=build-env /app/node_modules .
RUN ls -al
COPY --from=build-env /app/dist .
RUN ls -al

# Expose the port the app runs in
EXPOSE 4000

# Serve the app
CMD ["node", "angular-test/server/main.js"]
