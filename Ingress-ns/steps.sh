#!/usr/bin/env bash

# These steps we're running on a GCE
# cluster spawned possibly by kube-up.sh

# spin up the namespaces
kubectl create namespace app1
kubectl create namespace app2

# now ready to apply the deployments & services
kubectl apply -f app1/deployment.yaml
kubectl apply -f app2/deployment.yaml
kubectl apply -f app1/service.yaml
kubectl apply -f app2/service.yaml

# Now check that the exposed service is available
# on two different external IP addresses.
# It may take 1-2 minutes for the external IP
# addresses to be created.

# Running curl on the two IP addresses should give
# one nginx and one apache instance.

# Now, let us put the thing behind an ingress.
# Create the ingress controller.
kubectl apply -f ingress.yaml