# We use Ubuntu 18.04 as base image
FROM ubuntu:18.04

# We install apt-cacher-ng
RUN apt-get update && apt-get install -y apt-cacher-ng	

# We want to persist cache data
VOLUME ["/var/cache/apt-cacher-ng"]

# Application runs 8080 internally
EXPOSE 8080

# run the specified command within the container 
CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*