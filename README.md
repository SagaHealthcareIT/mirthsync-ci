# mirthSync-ci

![](https://github.com/SagaHealthcareIT/mirthsync-ci/actions/workflows/mirthsync.yml/badge.svg?branch=main)

[mirthSync](https://github.com/SagaHealthcareIT/mirthsync) is a command line
tool for synchronizing Mirth Connect code between servers by allowing you to
push or pull channels, code templates, configuration map and global scripts.

This repository contains an example of using mirthSync within the context of a
CI/CD workflow. 

Currently there is a Github actions workflow that demonstrates
how mirthSync can be used to push reviewed and approved code from development or
feature branches to a staging environment for testing. In the future, we will
add examples of workflows for Bitbucket, Jenkins, CodeBuild and more.

The walkthrough is the blog post
[CI/CD for Mirth Connect with mirthSync](https://saga-it.com/blog/ci-cd-for-mirth-connect-using-mirthsync),
and this repository is its end result. The workflow pins mirthSync 3.9.0 and
checks the download against its published SHA-256. `src/` is in the layout
mirthSync 3 writes: channels sit in group folders (ungrouped ones in
`Default Group`) and their scripts are separate `.js` files.

To use it, fork the repository, run `make pull-local` against your own
development server to replace the sample code with yours, and add the
`STAGE_URL`, `STAGE_USER` and `STAGE_PASS` secrets for your staging server.
Until `STAGE_URL` is set, the workflow installs mirthSync and skips the push.
Copy `.envrc.dist` to `.envrc` for the local `make` targets.

## License

Copyright © 2017-2021 Saga IT LLC

Distributed under the Eclipse Public License either version 1.0 or any later version.
