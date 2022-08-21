# Git pre-commit hook example - Dockerfile

The policies in `policy/main.rego` deny use of a base container image if it is not in a list of approved images. A Git [pre-commit hook](../.git/hooks/pre-commit) runs `conftest` against the `Dockerfile` using this policy. The `Dockerfile` contains the following two lines for testing this policy:

```
# FROM ubuntu:12.04
FROM ubuntu:20.04
```

You must have `conftest` installed on your system for this example to work.

## Usage

To test this example, you can adjust the `FROM` directive in the Dockerfile to use an image that isn't on the approved list. The easiest way to do this is by uncommenting the second line and commenting out the third line:

```
FROM ubuntu:12.04
# FROM ubuntu:20.04
```

You can now attempt to commit your changes, which should fail:

```
git add .
git commit -m "Use 12.04 base image
```
