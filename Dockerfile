FROM node:16-alpine as build
WORKDIR /capapp
COPY package*.json /capapp/
RUN npm install
COPY . . 
RUN npm run build
FROM nginx:latest
COPY --from=build /capapp/build/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

