FROM                   docker.io/node:20-alpine AS build
RUN                    apk add --no-cache unzip npm
RUN                    mkdir /app
WORKDIR                /app
COPY                   ./code /app/
RUN                    npm install


FROM                 docker.io/node:20.19.6-slim
RUN                  apt update && \
                     apt install -y curl
COPY                 --from=build /app /app
WORKDIR              /app
ENTRYPOINT          ["server.js"]


