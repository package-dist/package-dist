# Commit Messages

## Format

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/), enforced
by [commitlint](https://commitlint.js.org/). Subject lines should be no longer than 72 characters
and include a leading commit type (ex: `feat`, `fix`, `chore`, etc.). The type should be followed
by a parentheses describing the scope of the project that is impacted, such as `clients`, `docs`,
`reps`. Write the subject line using [imperative mood](https://chris.beams.io/git-commit#imperative).

The commit message body should be separated from the subject line using an empty line. Lines in the
commit message body should be no longer than 100 characters.

## Content

Use the body to explain [what and why vs. how](https://chris.beams.io/posts/git-commit/#why-not-how).
Link to an issue whenever possible and aim for 2 paragraphs, e.g.:

- What is the problem being solved?
- Why is this the best approach?
- What other approaches did you consider?
- What side effects will this approach have?
- What future work remains to be done?

Avoid overly verbose commit messages, particularly those that reference names of code functions
directly. Let the code speak for itself and the commit message speak for the bigger picture.

A good example commit message:

```text
doc: add contributor guidelines

Create project contributor guidelines that documents standards for pull requests and commit
messages. Project standards exist in the `contributing/` folder, with dedicated markdown files
for each general area of project development. These files are summarized for human consumption
in `CONTRIBUTING.md` and referenced in `AGENTS.md` for AI coding agents/assistants. This is meant
to encourage progressive disclosure to coding agents [1]. The initial `AGENTS.md` also includes
an overview of the project structure, which is summarized in the `README.md`.

Conventional commits were chosen as the commit message standard because it is the default
commit format enforced by super-linter. Future contributors may decide to relax this requirement.
All commits must also include a DCO sign-off. Commit signing is considered optional, but
encouraged. Commit message content guidelines were inspired by the Tekton project commit message
standards [2].

[1] https://arxiv.org/pdf/2607.17598
[2] https://github.com/tektoncd/community/blob/0475e40dab9738d289b3a6c13dabade49286adb1/standards.md#commit-messages
```

## DCO Sign-off

Commit messages must include a [Developer Certificate of Origin (DCO)](https://developercertificate.org)
sign-off, which indicates that your contribution adheres to the terms of the DCO. You can append the DCO
to your commit message using the `-s` option in the Git CLI. For example:

```sh
git commit -s -m "<your commit message>"
```

or to amend an existing (local) commit:

```sh
git commit --amend -s --no-edit
```

## Signed Commits (optional)

You may optionally sign your commits with a GPG or SSH key. We recommend configuring a signing key
in your GitHub account so that your signed commits can be
[verified](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification).
