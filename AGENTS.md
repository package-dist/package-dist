# Agent Instructions

## Project Structure

- `clients/` contains `package-dist` client implementations for specific ecosystems.
- `contributing/` contains overall project development guidelines and standards.
- `docs/` contains user and contributor-facing project documentation.
- `openspec/` contains [OpenSpec](https://openspec.dev/) proposals, specifications, and tasks.
- `reps/` contains the technical `package-dist` _representation_ of a software package for a given
  software ecosystem.
- `translators/` contains `package-dist` translation server implementations for specific
  ecosystems.

## Commits and Pull Requests

- Use conventional commits format, with subject lines less than 72 characters and body lines less
  than 100 characters. See [commit-messages format](./contributing/commit-messages.md#format).
- Focus on what changed and why, not how, in your commit messages. See [commit-messages content](./contributing/commit-messages.md#content).
- Always include a [DCO sign-off](./contributing/commit-messages.md#dco-sign-off). Signing commits
  using GPG or SSH keys is encouraged, but not required.
- Always work in a dedicated branch, not `main`. Publish changes to an individual's fork when
  submitting a pull request. See [pull request process](./contributing/pull-requests.md).
