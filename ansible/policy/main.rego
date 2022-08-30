package main

import future.keywords.in
import future.keywords.if
import future.keywords.contains

# ##### Method 1: Duplicate rules #####
# # Rules with duplicate names are evaluated as a logical OR
# # The below example will match packages installed by the package or apt module

deny_telnet contains msg if {
  some task in input.tasks
  task["ansible.builtin.package"].name == "telnet"
  task["ansible.builtin.package"].state != "absent"
  msg := sprintf("Task '%v' contains illegal package telnet", [task["name"]])
}

deny_telnet contains msg if {
  some task in input.tasks
  task["ansible.builtin.apt"].name == "telnet"
  task["ansible.builtin.apt"].state != "absent"
  msg := sprintf("Task '%v' contains illegal package telnet", [task["name"]])
}

deny_netcat contains msg if {
  some task in input.tasks
  task["ansible.builtin.package"].name == "netcat"
  task["ansible.builtin.package"].state != "absent"
  msg := sprintf("Task '%v' contains illegal package netcat", [task["name"]])
}

deny_netcat contains msg if {
  some task in input.tasks
  task["ansible.builtin.apt"].name == "netcat"
  task["ansible.builtin.apt"].state != "absent"
  msg := sprintf("Task '%v' contains illegal package netcat", [task["name"]])
}

# ##### Method 2: Less duplication  #####
# # The deny_bad_packages rule uses loops to greatly reduce duplication
# # Specifying illegal_packages and ansible_modules could also be done using data
# # outside of the actual policy code.

illegal_packages := ["telnet", "netcat"]
ansible_modules := ["ansible.builtin.package", "ansible.builtin.apt"]

deny_bad_packages contains msg if {
  some task in input.tasks
  some ansible_module in ansible_modules
  some illegal_package in illegal_packages
  task[ansible_module].name == illegal_package
  task[ansible_module].state != "absent"
  msg := sprintf("Task '%v' contains illegal package %v", [task["name"], illegal_package])
}

# Examples of violation and warn messages

# Use -o json to view this violation output
violation_netcat contains complex_message if {
  some task in input.tasks
  task["ansible.builtin.package"].name == "netcat"
  task["ansible.builtin.package"].state != "absent"
  complex_message := {
    "msg": "Netcat is not a permitted package",
    "details": {
      "wiki_article": "https://wiki.example.com/allowed_packages",
      "security_policy": "SEC-12345"
    }
  }
}

warn_apt contains msg if {
  some task in input.tasks
  task["ansible.builtin.apt"]
  msg := sprintf("Task '%v' uses the apt module. Please use the package module instead.", [task["name"]])
}
