# Mela Infra

This is Mela Infra repo

## Construct

You should have the following tools installed on your development machine:

- [tfenv](https://github.com/tfutils/tfenv)
- [pre-commit](https://pre-commit.com)
- [terraform-docs](https://terraform-docs.io/)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfsec](https://github.com/aquasecurity/tfsec)
- [markdownlint](https://github.com/igorshubovych/markdownlint-cli)
- [markdown-link-check](https://github.com/tcort/markdown-link-check)
- [shellcheck](https://github.com/koalaman/shellcheck)
- [typos](https://github.com/crate-ci/typos)

Remember to run below command for the hooks to trigger on every commit.

```shell
pre-commit install
pre-commit install --install-hooks
```

Initial configuration

```
make
```

## Static analysis

Static analysis against Terraform configuration can be performed by running the following command

```
make test
```

## Contributing

See [Contribute Guide](./CONTRIBUTING.md)
