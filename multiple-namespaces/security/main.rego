package security.example.com

import future.keywords.in
import future.keywords.if
import future.keywords.contains

warn_sudo contains msg if {
  some key,val in input.path
  "sudo" in val.capabilities
  msg := sprintf("Sudo capabilities granted on %v", [key])
}
