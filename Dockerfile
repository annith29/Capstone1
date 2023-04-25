FROM node:latest 
RUN apt-get update && apt-get install -y nginx
RUN rm /etc/nginx/sites-enabled/default 
COPY nginx.conf /etc/nginx/sites-enabled/
WORKDIR /usr/src/app
ENV NODE_OPTIONS="--openssl-legacy-provider"
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN echo "server {\n\tlisten 80;\n\troot /usr/src/app/build;\ntindex index.html;\n\tserver_name localhost;\n}" > etc/nginx/sites-enabled/default
EXPOSE 80 
CMD ["nginx", "-g" ,"daemon off;"]