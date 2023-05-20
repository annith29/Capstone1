FROM node:16-alpine as build
WORKDIR /react-app
COPY package*.json /react-app/
RUN npm install
COPY . .
RUN npm run build
FROM nginx:latest
COPY --from=build /react-app/build/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
