Make sure you mount a `servers.py` to the `/opt/mcadvertise/servers.py`

```
docker run -it --net=host -v `pwd`/servers.py:/opt/mcadvertise/servers.py davetucker/mcadvertise
```
