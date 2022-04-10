# amd64_linux-development-environment
amd64_linux development environment

# Build
To build the image run:

```bash
docker buildx build --platform linux/amd64 . -t snuplc_devenv --load
```

# Run
To run the image run:
```bash
docker-compose up -d
```

# Connect 
To connect to the container via ssh run:
```bash
ssh root@localhost -p 1200
```
