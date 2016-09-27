
====================
Mk.20 heat templates
====================

OpenStack Heat templates for training and development labs


Available stacks
================


mk20 basic lab
--------------

* 1 config node
* 3 control nodes
* 1 compute node


mk20 advanced lab
-----------------

* 1 config node
* 3 control nodes
* 1 compute node
* 1 monitor node


mk20 expert lab
---------------

* 1 config node
* 3 control nodes
* 2 compute nodes
* 1 monitor node
* 1 meter node
* 1 log node


Available resources
===================

Resource definion is part of environment file and the path to HOT fragment is relative to the location of this file!

* Mk20::Lab::BaseNetwork: template/_network.yaml
* Mk20::Lab::SaltMaster: template/_salt_master.yaml
* Mk20::Lab::OpenStackControl: template/_openstack_control_cluster.yaml
* Mk20::Lab::OpenStackCompute: template/_openstack_compute_(single|multi).yaml
* Mk20::Lab::OpenStackSupport: template/_openstack_support_(single|multi).yaml


Quick usage
===========

Install necessary libraries

.. code-block:: bash

   apt-get install python-novaclient python-heatclient

To create heat stack:

.. code-block:: bash

    source ./keystonerc 
    ./create_stack.sh template_name env_name

For example to deploy advanced lab to tcpisek cloud:

.. code-block:: bash

    ./create_stack.sh mk20_lab_advanced tcpisek

To delete heat stack

.. code-block:: bash

    source ./keystonerc
    ./delete_stack.sh template_name env_name
