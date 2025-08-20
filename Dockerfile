FROM nginx:alpine
COPY src/ /usr/share/nginx/html/
COPY src/ /style.css /usr/share/nginx/html/
COPY src/ /about.html /usr/share/nginx/html/
EXPOSE 443:433