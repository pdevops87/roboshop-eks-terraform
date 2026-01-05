FROM                   docker.io/node:20-alpine AS build
RUN                    apk add --no-cache npm
RUN                    mkdir /app
COPY                   /code/package*.json /app/
WORKDIR                /app
RUN                    npm install


FROM                 gcr.io/distroless/nodejs20
COPY                 --from=build /app /app
WORKDIR              /app
CMD                  ["hello.js"]








