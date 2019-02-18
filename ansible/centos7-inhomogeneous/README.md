# ArangoDB Cluster on RHEL / CentOS

This is a slight more complex example then the previous one. It allows
you to control with component (agent, coordinator, dbserver) is started
on which machine.

# example-hosts

This files contains the IP addresses of the three servers.  In general
you will have an external IP addresses and corresponding IP addresses.

Change the addresses according to environment.

    [dc1]
    35.237.32.89  private_ip=10.142.0.12 agent=true  coordinator=false dbserver=true
    34.73.17.205  private_ip=10.142.0.13 agent=true  coordinator=true  dbserver=false
    34.73.27.41   private_ip=10.142.0.14 agent=true  coordinator=false dbserver=false
    34.73.59.148  private_ip=10.142.0.15 agent=false coordinator=true  dbserver=true

You can specify, which component should be started on each machine. Please note,
that you need three agents.
