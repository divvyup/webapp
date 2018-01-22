#! /bin/bash

# Update our git repo
git reset --hard HEAD
git pull

# Then find and kill the container currently running
docker stop $(docker ps | grep "divvyapp" | awk '{print $1;}')
# Rebuild it
docker build -t divvyapp .
# Finally bring it back up
docker run -d -p 3075:3075 divvyapp