# Simple Policy Example - Ansible Playbook

The policies in `policy/main.rego` uses two different approaches to enforce a simple policy: deny installation of telnet or netcat. The playbook in `playbook.yaml` attempts to install both telnet and netcat using different methods.

The first approach demonstrates how duplciate rule names result in a logical OR.

The second approach reduces the duplication to use only a single rule.

## Usage

To run the example:

```
conftest test playbook.yaml
```

```
❯ conftest test playbook.yaml
FAIL - playbook.yaml - main - Task 'Install telnet' contains illegal package telnet
FAIL - playbook.yaml - main - Task 'Install telnet, but with apt' contains illegal package telnet
FAIL - playbook.yaml - main - Task 'Install netcat' contains illegal package netcat
FAIL - playbook.yaml - main - Task 'Install netcat' contains illegal package netcat
FAIL - playbook.yaml - main - Task 'Install telnet' contains illegal package telnet
FAIL - playbook.yaml - main - Task 'Install telnet, but with apt' contains illegal package telnet

7 tests, 1 passed, 0 warnings, 6 failures, 0 exceptions
```
