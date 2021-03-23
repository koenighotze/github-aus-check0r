# Github - Auscheck0r

![build](https://github.com/koenighotze/github-aus-check0r/workflows/build/badge.svg?branch=main)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/6d724f8ad65d4f4593b7ca91ab23cc09)](https://www.codacy.com/gh/koenighotze/github-aus-check0r/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=koenighotze/github-aus-check0r&amp;utm_campaign=Badge_Grade)

A simple tool for checking out all Github repositories of an organisation or an user.

## Usage

```bash
$ docker run -ti \
             --rm=true  \
             -e GITHUB_USERNAME=koenighotze \
             -e GITHUB_TOKEN=<GITHUB API TOKEN> \
             -e ENTRYPOINT=<ENTRYPOINT> \
             -v <TARGET DIRECTORY>:/home/auscheckor/target \
             koenighotze/github-auscheck0r
```

*   *GITHUB_USERNAME*: The username for accessing the Github API, e.g. `koenighotze`
*   *GITHUB_TOKEN*: The authentication token for using the Github API, e.g. `c497615529f89...`
*   *ENTRYPOINT*: The entrypoint for checking out repositories. Either user-based, e.g. `users/koenighotze` or an organisation e.g. `orgs/google`.
*   *TARGET DIRECTORY*: `/home/auscheckor/target` should be mounted to a local directory for storing the checked-out files, e.g. /home/koenighotze/dev/

For example:

```bash
$ docker run \
      -ti
      --rm=true  \
      -e GITHUB_USERNAME=koenighotze \
      -e GITHUB_TOKEN=c497615529f89... \
      -e TARGET_DIR=./checkout \
      -e ENTRYPOINT=users/koenighotze \
      -v `pwd`/target:/home/auscheckor/checkout \
      koenighotze/github-auscheck0r
```

This checks-out all repository from user `koenighotze` to the local directory `target`.
