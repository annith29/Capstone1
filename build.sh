cat <<EOT >Dockerfile
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
EOT

cat Dockerfile
echo "Now we will create an image using this docker file with when function using jenkins "
docker build -t annith29/capstone-public-dev:${BUILD_NUMBER} .
