# Envoy Proxying `http` -> `https` via a TLS enabled squid proxy

The client make http call to the endpoint service. Envoy handle TLS origination and forward the request to a L2 TLS Proxy.

{client} - http -> {envoy} - https -> {proxy} - https -> {endpoint}

curl -s -H "host: service-https" http://localhost:10000  | jq -r '.headers["x-forwarded-proto"]'

Currently, it is not feasible to handle dynamic forwarding due to TcpProxy tunneling_config requiring a static value for hostname used in the CONNECT statement to the L2 proxy. Each endpoint requires to configure a loopback cluster and listener duet.