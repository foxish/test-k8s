# Intel is vested in the container world.

## Introduction 

* Still virtual machines, but better.
* Certain ring buffers in kernel network stack being offloaded to hardware.
    * Frees up CPU cycles, better perf.
    * Multiple queues per host.
* SR-IOV: Virtual NICs created in hardware.
    * Intel server NICs have this.
    * Working on enabling this for the entire container ecosystem.
* Tunneling through the container, VM and so on to directly execute on hardware.

## Resource director (RDT)

* Better telemetry.
* Dynamically changing cache amounts/monitoring pressure.
* works on-host and across cloud.

## Letting k8s use performance data

* Talking to k8s and getting combined metrics out into resource director.

## QuickAssist

* Offloads crypto/compression away from the CPU.
* Enabling this to work with containers.

## DPDK

* Data plane dev kit.
* Creates fast datapath from userspace to NIC.
* Seeks to eliminate system calls and so on.

## Guaranteeing strong bounds on time

* Lots of work on OpenStack for all this.
* Memory isolation, policy monitoring/enforcement is still a little difficult.

## Intel Clear Containers

* Using VT-x to create memory isolation for containers.
* Secure and memory isolated. Middle ground, some part of kernel exists per container.
* k8s can understand clear containers (?).
* Requires a hypervisor like kvm.

## Integrated with k8s

* Telemetry and orchestration information pushed to k8s.
* k8s gets better view of the system.
* Blockchain being used to (???).
    * Contributor to the hyperchain project.
    * Framework to deploy distributed ledgers.

## Stackenetes: containerized openstack

* OpenStack infrastructure managed the same way as containers with k8s.
* Using k8s to orchestrate VMs and containers.

## portworx

* High performance storage for distributed containers.
* Being used by some genomics firm.

## OCI & CNCF

* CNCF driving innovation, running the CNCF data center. 
* Orchestrated with stackenetes & k8s.


# Citrix's talk on Cloud-native LoadBalancers
Citrix netscaler used for loadbalancing.

## DevOps and automation.
* The usual
* Microservices.

## Loadbalancing - intra-cluster
* LB per end-point or LB per container host.
* 1) LB dedicated to the service, but single point of failure.
* 2) LB per host gives more resilience.
* Edge loadbalancer == ingress (k8s??)
* Ingress LB
    * Authoritative state of the cluster is maintained by the LB controller.
    * The state is used to govern the loadbalancing rules.
    * Orchestration v/s Choreography.
* Ingress LB, usually proprietary, intracluster like kube-proxy.
* DNS, monitoring/logging, LB.
* NetScaler CPX Express: dockerhub, no license reqouired as dev.
* Does the load balancing for us.
* Integrating with k8s had issues, Flannel overlays in the n/w.
* SDN integration within k8s with the rest of the data centers.
* Client-side LB - Netflix Ribbon/Uber HyperBohn/...