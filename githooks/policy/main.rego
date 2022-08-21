package main

import future.keywords.in
import future.keywords.if
import future.keywords.contains

allowed_base_images := [ "ubuntu:18.04", "ubuntu:20.04", "ubuntu:22.04" ]

deny_forbidden_base_images contains msg if {
  some command in input
  command.Cmd == "from"
  not command.Value[0] in allowed_base_images
  msg := sprintf("Base image '%v' is not in list of allowed base images", [command.Value[0]])
}
