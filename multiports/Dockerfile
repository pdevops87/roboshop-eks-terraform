FROM                 docker.io/node:20.19.6-bullseye-slim As build
RUN                  mkdir /app
COPY                 multiports/  /app/
WORKDIR              /app
RUN                  npm install


FROM                docker.io/2node:20
WORKDIR             /app
COPY               --from=build /app /app
CMD                 ["node server.js" && "sleep 3000"]


