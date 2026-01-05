FROM                   docker.io/node:20-alpine AS build
RUN                    apk add --no-cache npm
RUN                    mkdir /app
WORKDIR                /app
COPY                   ./code /app/
RUN                    npm install


FROM                 gcr.io/distroless/nodejs:10
COPY                 --from=build /app /app
WORKDIR              /app
CMD                  ["hello.js"]








