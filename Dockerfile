FROM nginx:alpine
COPY src/ /usr/share/nginx/html/
EXPOSE 443:433