![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports i386 Architecture][i386-shield]
![Maintained][maintained-shield]

# Assistant Relay Docker
Assistant Relay in Docker. See https://github.com/greghesp/assistant-relay to see how it works and for the release notes.

The image with the tag 'latest' is identical to the newest (non beta) version. The newest beta release is tagged as "beta" and it's release number.


# Installation

Create a file in the volume called "config.json" before starting the container:

```json
{
    "port":3000
}
```
Change the number to the port you want to use.

#### Docker Run
```bash
docker run -d --name assistant_relay \
-p 3000:3000 \
-v /path/to/volume/config.json:/assistant_relay/bin/config.json:rw \
-v /path/to/volume/audio-responses:/assistant_relay/bin/audio-responses:rw \
apipa169/assistant-relay:latest
```

#### Docker Compose
```yaml
version: '3.3'
services:
    assistant-relay:
        container_name: assistant_relay
        ports:
            - '3000:3000'
        volumes:
            - '/path/to/volume/config.json:/assistant_relay/bin/config.json:rw'
            - '/path/to/volume/audio-responses:/assistant_relay/bin/audio-responses:rw'
        image: 'apipa169/assistant-relay:latest'
```

## Beta
If you want to test the beta release you need to run the container in network mode "host" to support the Cast functionality.

The port needs to be defined in the config.json.

```bash
docker run -d --name assistant_relay \
--network host \
-v /path/to/volume/config.json:/assistant_relay/bin/config.json:rw \
-v /path/to/volume/audio-responses:/assistant_relay/bin/audio-responses:rw \
apipa169/assistant-relay:beta
```

## ARM / RaspberryPi

Currently ARM is not supported, therefore you can not run this on a RaspberryPi. But there is a workaround by using the Hass.io addon image, without running Hass.io (or Home Assistant).


#### Docker Run AMRv7
```bash
docker run -d --name assistant_relay \
-p 3000:3000 \
-v /path/to/volume/config.json:/data/config.json:rw \
-v /path/to/volume/audio-responses:/data/audio-responses:rw \
apipa169/armv7-hassio-assistant_relay:latest
```

## Home Assistant
Assistant Relay is a great addition to Home Assistant. For the Hass.io add-on see: https://github.com/Apipa169/Assistant-Relay-for-Hassio

The commands described on the add-on page will also work if you are not using the add-on.





[aarch64-shield]: https://img.shields.io/badge/aarch64-no-red.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-no-red.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[maintained-shield]: https://img.shields.io/badge/maintained-yes-green.svg
