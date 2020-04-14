# RTLSDR Docker image

## Supported tags and architectures

This images supports following architectures:

-   `amd64` - for most desktop processors
-   `arm7v` - for 32-Bit ARM images like Raspbian (Raspberry 1, 2, 3 and 4)
-   `arm64` - for 64-Bit ARM images like armbian (Pine 64, etc.)
-   `386` - for legacy desktop processors

## Tools included

This Docker image contains a build of rtlsdr. Following programs are included in this image:

-   rtl_eeprom
-   rtl_fm
-   rtl_power
-   rtl_sdr
-   rtl_tcp
-   rtl_test

## Examples

You can run any rtlsdr command on your Docker host. To run the container in interactive mode use following command:

```shell
docker run -it --network host --device [YOUR_DVBT_DEVICE] rtl_tcp -a [YOUR_HOST_IP] -p [YOUR_HOST_PORT]
```

If your Docker host is running on ip address 192.168.0.1 and you want to use tcp port 1234 with your DVB-T stick on /dev/bus/usb/003/002 use the following command:

```shell
docker run -it --network host --device /dev/bus/usb/003/002 legacycode/rtlsdr rtl_tcp -a 192.168.0.1 -p 1234
```

Use SDRSharp and connect to your Docker rtl_tcp server with ip 192.168.0.1 and port 1234.

## Contribute

Feel free to contribute! You can find this project on [GitHub][1]]!

## License information

This [Dockerfile][1] is provided under the [MIT License][2].

License information about rtlsdr can be found in the [official repository][3].

The Docker images are based on the [Alpine Docker image][4]. Refer to the official [Alpine Docker image][4] page for license information.

[1]: https://github.com/legacycode/rtlsdr-docker

[2]: https://github.com/legacycode/rtlsdr-docker/blob/latest/LICENSE.md

[3]: https://osmocom.org/projects/rtl-sdr/repository/revisions/master/entry/COPYING

[4]: https://hub.docker.com/_/alpine
