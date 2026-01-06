# Build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY package.json server.js ./
RUN npm install --production

# Runtime stage (distroless)
FROM gcr.io/distroless/nodejs20-debian12
WORKDIR /app
COPY --from=build /app /app
CMD ["server.js"]





# code/
# COPY code/ /app , to copy subfolder also
# package.json ./ == package.json /app
# package.json . == package.json /app



