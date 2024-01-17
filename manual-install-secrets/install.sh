#!/bin/bash
set -e

echo 'Copy-paste in the private key (in LastPass at "ArgoCD GitHub private key"), then EOF with ctrl-D'
echo

PKEY=$(cat)

yq ".data.sshPrivateKey = (\"$PKEY\" | @base64)" repos-github-klodnicki.yaml | kubectl apply -f - -n argocd

echo
echo 'Copy-paste in the access token (in LastPass at "ArgoCD GitHub access token"), then EOF with ctrl-D'

TOKEN=$(cat)

yq ".data.accessToken = (\"$TOKEN\" | @base64)" access-token-github-klodnicki.yaml | kubectl apply -f - -n argocd
