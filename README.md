# Nexus

This Nexus Includes:

- A `xumak-nexus` proxy repository that has access to XumaK Nexus on http://54.236.230.120/nexus/content/repositories/public/ with the user `bedrok_nexus`
- A `layerx-proxy` proxy repository that has access to XumaK LayerX on http://54.236.230.120/nexus/content/repositories/layerx-development/ with the user `readonly`
- A group `${CLIENT_REPOSITORY_NAME}` that contains the repositories `xumak-nexus`, `Releses`, `Snpashots` and `layerx-proxy`
- Default user admin:admin123
- Default client repository name `myCompany`

We build this image only for AWS registry, this is due the limitation of the Docker plugin that doesn't allow to login from two registries at the same time. If you need the image in Xumak registry you sould build it manually `make VERSION=2.14.1 build-docker`

## Notice

Now Grid uses pristine docker images, It is not necessary to have exposer for this project, and maybe in the near future we can delete this repository in favor of xumak-grid/containers repository

Copyright © 2016 Tikal Technologies, Inc.