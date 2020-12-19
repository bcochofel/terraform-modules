# Terraform modules

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![GitHub license](https://img.shields.io/github/license/bcochofel/terraform-modules.svg)](https://github.com/bcochofel/terraform-modules/blob/master/LICENSE)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/bcochofel/terraform-modules)](https://github.com/bcochofel/terraform-modules/tags)
[![GitHub issues](https://img.shields.io/github/issues/bcochofel/terraform-modules.svg)](https://github.com/bcochofel/terraform-modules/issues/)
[![GitHub forks](https://img.shields.io/github/forks/bcochofel/terraform-modules.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/bcochofel/terraform-modules/network/)
[![GitHub stars](https://img.shields.io/github/stars/bcochofel/terraform-modules.svg?style=social&label=Star&maxAge=2592000)](https://github.com/bcochofel/terraform-modules/stargazers/)

This repository has several modules on the `modules/` folder and some samples on
the `examples/` folder that you can adapt to your needs.

There's also `test` folder that uses [Terratest](https://github.com/gruntwork-io/terratest).

# Requirements

* [`pre-commit`](https://pre-commit.com/#install)
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `tflint` hook.

You can also use [pre-commit](https://pre-commit.com/#install). After installing
`pre-commit` just execute:

```ShellSession
pre-commit install
```

# References

* [Terraform Versions Constraints](https://www.terraform.io/docs/configuration/version-constraints.html)
