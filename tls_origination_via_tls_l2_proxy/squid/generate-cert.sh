#!/bin/sh

set -e

openssl req \
  -x509 \
  -newkey rsa:2048 \
  -sha256 \
  -nodes \
  -extensions v3_ca \
  -days 9999 \
  -keyout squid-ca-key.pem \
  -out squid-ca-cert.pem \
  -subj "/C=US/ST=Utah/L=Provo/O=ACME Signing Authority Inc/CN=example.com"

cat squid-ca-cert.pem squid-ca-key.pem >> squid-ca-cert-key.pem