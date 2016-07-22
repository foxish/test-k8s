#!/usr/bin/env bash

# These steps we're running on a GCE
# cluster spawned possibly by kube-up.sh


# THE BELOW COMMENTED OUT STEPS ONLY IF WE ARE USING THE PV, PVC.
# THESE ALSO NEED TO BE TURNED ON IN THE DEPLOYMENT FILE.

## create the PVs (this needs disks named www-vol1 and www-vol2 of 10G each on GCE.
#kubectl apply -f app1/pv.yaml
#kubectl apply -f app2/pv.yaml
#
## create the PVCs
#kubectl apply -f app1/pvc.yaml
#kubectl apply -f app2/pvc.yaml

# check that the PVCs are bound at this point.
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
