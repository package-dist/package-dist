# Development Environment and Process

## Tools

We recommend installing the following tools:

- [GNU Make](https://www.gnu.org/software/make/manual/make.html)
- [Docker](https://www.docker.com/products/cli/) or [Podman](https://podman.io/). If using Podman,
  configure your environment to alias `docker` to `podman`, such as through the `podman-docker`
  [Fedora package](https://packages.fedoraproject.org/pkgs/podman/podman-docker/).

If you need to modify the `commitlint` configuration, install [Node.js](https://nodejs.org/en) 22 or
higher, then install the necessary npm dependencies:

```sh
npm install
```

## Checking your work

We user [super-linter](https://github.com/super-linter/super-linter) to enforce all code standards.
We recommend running this locally for all contributions by invoking `make lint` from the command
line. If a lint check fails, use the log output to identify the failing check. Run `make fix` to
automatically apply suggested fixes for a particular linter by providing the `FIX_LINTER` variable.
Below is an example that applies spelling corrections:

```sh
make fix FIX_LINTER=SPELL_CODESPELL
```
