# External data example - Docker Compose

The policies in `policy/main.rego` only permit certain ports to be exposed by a Docker Compose definition. The allowed ports are defined in `data.yaml`. This provides an example of using an external data source to separate the policy itself from data (such as a list of ports) used by the policy.

## Usage

To run the example:

```
conftest test docker-compose.yaml --data data.yaml
```
