# mix-release-docker

One command to build a small-ish Docker image for your Phoenix app.

## Why?

There are many methods out there, such as:

- [edib-tool/mix-edib](https://github.com/edib-tool/mix-edib)
- [Recruitee/mix_docker](https://github.com/Recruitee/mix_docker)
- [bitwalker/alpine-erlang](https://github.com/bitwalker/alpine-erlang)
- [msaraiva/alpine-erlang](https://github.com/msaraiva/alpine-erlang) (The base image of this script)

This script makes it easy to get all of these:

- The host machine does not need Erlang
- The final image is small(-ish) (Phoenix "Hello World" image is 48MB as of writing)
- The resulting image is "functional" -- you can run `apk add curl` inside the container for production debugging
- It creates a [Distillery](https://github.com/bitwalker/distillery) release, so you can run `my_app console` in the container
- The `Dockerfile` is not opaque and you can customize it. For example if you need runtime dependencies such as Java or `unixodbc` it's just a matter of changing the `Dockerfile.release`
- When [Docker multi-stage build](https://docs.docker.com/engine/userguide/eng-image/multistage-build/) becomes widely available you can just concate the two `Dockerfile`s and change `ADD` to `COPY --from` and this mostly just works.

## Usage

1. Clone this repo's file into your project root
2. Change the settings in `build.sh`
3. Change the project name in `Dockerfile.release`
4. `sh build.sh`
5. Profit
