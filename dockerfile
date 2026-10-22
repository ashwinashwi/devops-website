FROM nginx:alpine
COPY indx.html /usr/share/nginx/html/index.html
EXPOSE 80
