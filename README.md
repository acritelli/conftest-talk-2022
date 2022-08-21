# Conftest: Expressing and Enforcing Policy for Configuration Files

This repository contains code examples for my talk about Conftest. Each subdirectory also contains a README. The following examples are contained in this repository:

* [ansible](./ansible/README.md) - A simple example of a basic policy run against an Ansible playbook. The policy contains different approaches for writing rules (to demonstrate how duplication can be reduced). This example also shows deny and violation rules.
* [external-data](./external-data/README.md) - An example of separating policy from external data sources using the `--data` flag.
* [githooks](./githooks/README.md) - An example of using a Git pre-commit hook to test policy against a Dockerfile prior to a commit being accepted.
* [multiple-namespaces](./multiple-namespaces/) - A more complex example that separates policies into different namespaces to show how different groups within an organization can author policies. This example also contains instructions for bundling the resulting policies into artifacts and uploading them to an OCI registry or importing them from local archives.
