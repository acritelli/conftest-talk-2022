path "auth/token/*" {
    capabilities = ["create", "read", "update", "sudo"]
}

path "monolithic-database/*" {
    capabilities = ["create", "read", "update"]
}
