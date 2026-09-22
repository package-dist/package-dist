# package-dist

A universal software package distribution standard and toolchain.

## How it works

`package-dist` uses the [OCI Image Specification](https://github.com/opencontainers/image-spec) as a
common schema to define and distribute any [software package](https://slsa.dev/spec/v1.2/terminology#distribution-model).
Each software package ecosystem (ex: Apache Maven, Python PyPI packages, npm) specifies its own
_representation_ within an OCI [image manifest](https://github.com/opencontainers/image-spec/blob/v1.1.1/manifest.md).

```mermaid
block
  columns 1
  oci("oci")
  block:reps
    columns 3
    maven("maven") pypi("pypi") npm("npm")
  end

  reps-- "Implements" -->oci
```

These representations are used to create _client tools_ that natively publish and retrieve software
packages in OCI format, as well as _translation servers_ that provide backwards-compatibility with
existing package ecosystem toolchains.

```mermaid
architecture-beta
  group package-dist

  service registry(database)[OCI Registry] in package-dist

  service mavenT(server)[maven translator] in package-dist
  service pypiT(server)[pypi translator] in package-dist
  service npmT(server)[npm translator] in package-dist
  junction translator in package-dist

  registry:B <-- T:translator
  translator:B -- T:mavenT
  translator:L -- R:pypiT
  translator:R -- L:npmT

  group clients

  service maven-client(internet)[oci maven client] in clients
  service pypi-client(internet)[oci pypi client] in clients
  service npm-client(internet)[oci npm client] in clients
  junction oci-client in clients

  maven-client:B -- T:oci-client
  pypi-client:R -- L:oci-client
  npm-client:L -- R:oci-client
  oci-client:B --> T:registry

  group legacy

  service maven(internet)[maven] in legacy
  service pypi(internet)["pip, uv"] in legacy
  service npm(internet)["npm, yarn"] in legacy

  pypi:T --> B:pypiT
  maven:T --> B:mavenT
  npm:T --> B:npmT

```

## What's in here

`package-dist` is organized as a monorepo, with the following focused subdirectories:

- `clients/` for `package-dist` client implementations
- `docs/` for public-facing documentation
- `reps/` for the technical _representation_ of a software package within a `package-dist`
  container registry.
- `translators/` for `package-dist` translation server implementations

This project uses [OpenSpec](https://openspec.dev/) to encourage spec-driven software development.
Feature proposals, specs, and tasks all live within the `openspec` folder.
