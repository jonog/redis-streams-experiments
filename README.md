
## Redis Streams Experiments

### Background
http://antirez.com/news/114

### Instructions

Build and start redis in Docker:
```
make build
make network
make start-server
```

Experiment with redis-cli:
```
make cli
```

Demo:
```
make run-demo-xadd
```

Cleanup:
```
make cleanup
```
