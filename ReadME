# setup-kubernetes-cluster-on-vps
In this repo we are setting up a kubernetes cluster on vps instances using ansible.
Inspired from https://github.com/bmf-san/setup-kubernetes-cluster-on-vps-boilerplate

# Get started
Here i am using three vps from ovh.One master(should be 2 vcores at least) and two nodes.
It is important to create a hosts file under inventories folder and add the servers there.

## roles
the folder roles contain the tasks of the project that will be run as they are in the site.yml file.

## secrets
the secrets file inside secrets contains some secure variables we use in the project.
a variable is written in this format: variable: "value"

## commands
as described in the Makefile:
make init-provision is used to run the tasks where init tag exist and make provision is used to run the remaining tasks.
make encrypt-secrets is used to encrypt the secrets file.
make decrypt-secrets is used to descrypt the file and make edit-secrets is used to edit the file.
You should have a file called .vault-pass.txt that contains a password in plaintext for security.