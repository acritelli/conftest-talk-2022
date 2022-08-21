package main

import future.keywords.in
import future.keywords.if
import future.keywords.contains

import data.allowed_ports

deny_ports contains msg if {
  some service in input.services
  some published_port in service.ports
  port := split(published_port, ":")[0]
  not to_number(port) in allowed_ports
  msg := sprintf("Port %v is not allowed to be exposed.", [port])
}
