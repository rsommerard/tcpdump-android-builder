# tcpdump android build

Docker container to build the tcpdump tool for the Android platform

## Usage

This build the Docker image and build tcpdump. The result is in the build folder
which appears during the build.

`./build.sh && ./run.sh`

## Customization

To change the tcpdump version, edit the entrypoint.sh file and change the
values.
