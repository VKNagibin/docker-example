FROM node:slim AS build
WORKDIR /app
COPY package.json package.json
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:stable
COPY --from=build /app/build /opt/site
COPY nginx.conf nginx.conf