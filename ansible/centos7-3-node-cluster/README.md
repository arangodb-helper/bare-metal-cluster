# ArangoDB Cluster on RHEL / CentOS

This simple example assumes that you are setting up a cluster on three
Red-Hat based system. The ansible playbooks are all-in-one. In a more
general setup, you would split tasks and roles into seperate files.

There are four playbooks

- install arangodb and the cluster setup
- start the cluster
- stop the cluster
- nuke the cluster

# example-hosts

This files contains the IP addresses of the three servers.  In general
you will have an external IP addresses and corresponding IP addresses.

Change the addresses according to environment.

    [dc1]
    34.73.221.12  private_ip=10.142.0.6
    35.231.28.193 private_ip=10.142.0.7
    35.237.32.89  private_ip=10.142.0.8

## Install ArangoDB

This playbook will install the latest ArangoDB version and the cluster
helper scripts.

    ansible-playbook -i example-hosts install-arangodb.yml

### Log files

The log files are located in */var/log/arangodb3*.

- *arangodb.log*: the starter log file
- *arangod-agent-8531.log*: the agent log file
- *arangod-coordinator-8529.log*: the coordinator log file
- *arangod-dbserver-8530.log*: the dbserver log file

### Ports

*8528*: these ports should be reachable from the internal network, but
not from the external one. The ArangoDB Starter uses this port to
communicate with each other.

*8529*: these ports should be reachable from the internal and external
network. The Coordinators are reachable on these ports. In a more
complete example, you would put a load-balancer in front of all
coordinators.

*8530*: these ports should be reachable from the internal network, but
not from the external one. The DBserver are bound to this port.

*8531*: these ports should be reachable from the internal network, but
not from the external one. The Agents are bound to this port.

## Data directories

The data directories are per default located in
*/var/lib/arangodb3-cluster*.  See the *setup-dirs.yml* playbook for
an example how to use a different location.  This playbook assumes
that the directories under */data* exist and are accessible by the
user *arangodb*.

## Start the ArangoDB cluster

This playbook will start the cluster. It assumes that the
*install-arangodb.yml* has been run.

    ansible-playbook -i example-hosts start-cluster.yml

## Stop the ArangoDB cluster

This playbook will stop the cluster. It assumes that the
*install-arangodb.yml* has been run.

    ansible-playbook -i example-hosts stop-cluster.yml

## Nuke the ArangoDB cluster

This playbook will stop and nuke the cluster. It assumes that the
*install-arangodb.yml* has been run.

    ansible-playbook -i example-hosts nuke-cluster.yml

