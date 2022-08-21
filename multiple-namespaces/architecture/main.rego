package architecture.example.com

import future.keywords.in
import future.keywords.if
import future.keywords.contains

deny_database_policy contains msg if {
  some key,val in input.path
  regex.match("monolithic-database.*", key)
  msg := sprintf("Capabilities granted on %v. The use of the monolithic-database engine has been deprecated.", [key])
}
