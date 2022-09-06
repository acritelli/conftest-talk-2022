# Policy Example with Namespaces - Vault Policy

The policies in `policy.main.rego`

Also an example of a warning.

## Usage - Local Bundles

Policy bundles can be stored in OCI artifact repositories, but the easiest way to use this example is to build local bundles.

First, build each bundle:

```
opa build architecture/ -o architecture.tar.gz
opa build security/ -o security.tar.gz
```

Next, pull the policies in from the bundle:

```
# The full path is needed below
conftest pull $(pwd)/architecture.tar.gz
conftest pull $(pwd)/security.tar.gz
```

Finally, run `conftest` using policies in all namespaces:

```
conftest test vault_policy.hcl --all-namespaces
```

## Usage - OCI Registry

If you'd like to try using an OCI registry, you can get started in a few quick steps.

First, start up a simple Docker registry:

```
docker run -d -p 5000:5000 --restart always --name registry registry:2
```

Next, push each bundle to the repository:

```
conftest push -p architecture/ localhost:5000/architecture
conftest push -p security/ localhost:5000/security
```

Once the bundles have been pushed up to the repository, you can download them:

```
conftest pull localhost:5000/architecture
conftest pull localhost:5000/security
```

This will download the policies to the `policy/` directory. You can now test them:

```
conftest test vault_policy.hcl --all-namespaces
```
