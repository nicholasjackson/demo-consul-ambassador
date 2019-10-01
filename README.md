# Ambassador and Consul Service Mesh

This Terraform code configures two Consul Datacenters, one running in Kubernetes and the other on Virtual Machines in Microsoft Azure.

![](/images/gateways.png)

The two Datacenters are federated together and service traffic is routed using Consul Gateways.

Terraform Version: 0.12.7 +

## Environment variables

Before running `terraform plan` or `apply` configure the following environment variables to your Azure account secrets

```
export ARM_CLIENT_ID="xxx-xxx-x-x-x-x-x-xxxx-"
export ARM_CLIENT_SECRET="x-x-x-xxxx--xxx--x-x-xx"
export ARM_SUBSCRIPTION_ID="xx-x--xx-xxx-xxx-x-x"
export ARM_TENANT_ID="xxx-xx-xx-x"

export TF_VAR_client_id="${ARM_CLIENT_ID}"
export TF_VAR_client_secret="${ARM_CLIENT_SECRET}"
```

## Creating infrastructure

You can then run `terraform apply` to create the infrastructure

## Output variables

The Terraform output variables contain the details of the various loadbalancers, public IP addresses and Kubernetes config which can be
used to access the system.

```
$ terraform output

k8s_config = apiVersion: v1
clusters:
- cluster:
#...
vms_consul_gateway_addr = 13.64.246.61
vms_consul_server_addr = 13.64.245.65
vms_pong_addr = 13.64.245.34
vms_private_key = -----BEGIN RSA PRIVATE KEY-----
MIIJKQIBAAKCAgEA2qokNUFCSDCgf5DdUTSRE20UF/VzNtNE9J2N1QUrZFcjGXj4
#...
```

## SMI Controller

This configuration will automatically deploy the Consul SMI controller however in order to interact with it the custom CRDs and the policy must be applied with `kubectl`.

First apply the CRDS:

```
$ kubectl apply -f crds.yml
customresourcedefinition.apiextensions.k8s.io/traffictargets.access.smi-spec.io created
customresourcedefinition.apiextensions.k8s.io/httproutegroups.specs.smi-spec.io created
customresourcedefinition.apiextensions.k8s.io/tcproutes.specs.smi-spec.io created
```
