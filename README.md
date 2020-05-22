# Terraform modules

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![GitHub license](https://img.shields.io/github/license/bcochofel/terraform-modules.svg)](https://github.com/bcochofel/terraform-modules/blob/master/LICENSE)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/bcochofel/terraform-modules)](https://github.com/bcochofel/terraform-modules/tags)
[![GitHub issues](https://img.shields.io/github/issues/bcochofel/terraform-modules.svg)](https://github.com/bcochofel/terraform-modules/issues/)
[![GitHub forks](https://img.shields.io/github/forks/bcochofel/terraform-modules.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/bcochofel/terraform-modules/network/)
[![GitHub stars](https://img.shields.io/github/stars/bcochofel/terraform-modules.svg?style=social&label=Star&maxAge=2592000)](https://github.com/bcochofel/terraform-modules/stargazers/)

This repository has several modules on the `modules/` folder and some samples on
the `examples/` folder that you can adapt to your needs.

# Requirements

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks. `GNU awk` is required if using `terraform-docs` older than 0.8.0 with Terraform 0.12.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

You can also use [pre-commit](https://pre-commit.com/#install). After installing
`pre-commit` just execute:

```ShellSession
pre-commit install
```
