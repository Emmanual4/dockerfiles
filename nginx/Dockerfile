From emmanual4/java:latest

# Update Software repository
RUN apt-get update && \ 
apt-get install -y nginx

Expose 80 443
CMD ["nginx", "-g", "daemon off;"]

