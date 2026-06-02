FROM nginx

WORKDIR /usr/share/nginx/html

COPY index.html .

EXPOSE 70

CMD ["nginx", "-g", "daemon off;"]
