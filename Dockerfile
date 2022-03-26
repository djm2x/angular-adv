FROM node:16-alpine3.14

WORKDIR /app

RUN mkdir -p /dist

COPY dist dist

EXPOSE 4000

CMD ["node", "dist/angular-test/server/main.js"]
