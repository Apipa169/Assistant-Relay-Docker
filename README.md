![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports i386 Architecture][i386-shield]
![Maintained][maintained-shield]

# Assistant-Relay-Docker
Assistant Relay in Docker. See https://github.com/greghesp/assistant-relay to see how it works and for the release notes.


```bash
docker run -d --name assistant_relay \
-p 3000:3000 \
-v /path/to/volume/config.json:/assistant_relay/bin/config.json:rw \
-v /path/to/volume/audio-responses:/assistant_relay/bin/audio-responses:rw \
apipa169/assistant-relay:latest
```

Create a file in the volume called "config.json" before starting the container:

```json
{}
```

[aarch64-shield]: https://img.shields.io/badge/aarch64-no-red.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-no-red.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[maintained-shield]: https://img.shields.io/badge/maintained-yes-green.svg