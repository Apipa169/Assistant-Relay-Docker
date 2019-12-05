# Assistant-Relay-Docker
Assistant Relay in Docker


```bash
docker run -d --name assistant_relay -p 3000:3000 -v /path/to/config/config.json:/assistant_relay/bin/config.json:rw -v /path/to/audio-responses:/assistant_relay/bin/audio-responses:rw apipa169/assistant-relay:latest
```
