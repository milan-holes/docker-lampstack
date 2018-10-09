# initial sync
docker-sync start

# sync on change
fswatch -o ./www | xargs -n1 -I{} docker-sync sync