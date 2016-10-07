
====================
Mk.XX Heat templates
====================

OpenStack Heat templates for Mk-based cloud for training and development.


Available stacks
================


Mk.20 basic testing lab
-----------------------

* 1 config node
* 3 control nodes
* 1 compute node


Mk.20 advanced testing lab
--------------------------

* 1 config node
* 3 control nodes
* 1 compute node
* 1 monitor node


Mk.20 expert testing lab
------------------------

* 1 config node
* 3 control nodes
* 2 compute nodes
* 1 monitor node
* 1 meter node
* 1 log node


Mk.20 basic StackLight lab
--------------------------

* 1 config node
* 3 control nodes
* 1 compute node
* 1 monitor node


Mk.20 advanced StackLight lab
-----------------------------

* 1 config node
* 3 control nodes
* 1 compute node
* 3 monitor nodes


Available resources
===================

Custom resources are defined as part of environment variable file and the path
to Heat template fragment is relative to the location of that environmental
file! This file contains values for image names, flavors, ip pool name that
fit given the cloud setup.

.. list-table:: Testing lab resources
   :widths: 10 15 30
   :header-rows: 1

   * - Resource name
     - Template file
     - Description
   * - Mk20::Lab::BaseNetwork
     - _network.yaml
     - Base network setup
   * - Mk20::Lab::SaltMaster
     - _salt_master.yaml
     - Configuration and control node
   * - Mk20::Lab::OpenStackControl
     - _openstack_control_cluster.yaml
     - OpenStack and OpenContrail control plane cluster
   * - Mk20::Lab::OpenStackCompute
     - _openstack_compute_(single|multi).yaml
     - OpenStack compute nodes
   * - Mk20::Lab::OpenStackSupport
     - _openstack_support_(single|multi).yaml
     - Mk.20 monitoring suite
   * - Mk20::Lab::OpenStackSupport
     - _openstack_support_(single|multi).yaml
     - Mk.20 original monitoring suite


.. list-table:: StackLight lab resources
   :widths: 10 15 30
   :header-rows: 1

   * - Resource name
     - Template file
     - Description
   * - Mk20::StackLight::BaseNetwork
     - _network.yaml
     - Base network setup
   * - Mk20::StackLight::SaltMaster
     - _salt_master.yaml
     - Configuration and control node
   * - Mk20::StackLight::OpenStackControl
     - _openstack_control_cluster.yaml
     - OpenStack and OpenContrail control plane cluster
   * - Mk20::StackLight::OpenStackCompute
     - _openstack_compute_(single|multi).yaml
     - OpenStack compute node
   * - Mk20::StackLight::StackLightSupport
     - _stacklight_support_(single|cluster).yaml
     - StackLight monitoring suite


Usage
=====

Install necessary libraries.

.. code-block:: bash

   apt-get install python-novaclient python-heatclient

Create `keystonerc` file for your OpenStack endpoint, for example use
following for DC in Czech Republic. Just fill in the username, password and
tenant name.

.. code-block:: bash

    export OS_USERNAME=
    export OS_PASSWORD=
    export OS_TENANT_NAME=
    export OS_AUTH_URL=https://vpc.tcpisek.cz:5000/v2.0
    export OS_AUTH_STRATEGY=keystone

Souce rc file and create heat stack.

.. code-block:: bash

    source ./keystonerc 
    ./create_stack.sh template_name env_name stack_name

For example to deploy advanced lab to tcpisek environment with name `lab01` use
following code.

.. code-block:: bash

    ./create_stack.sh mk20_lab_advanced tcpisek lab01

To delete heat stack `lab01`.

.. code-block:: bash

    source ./keystonerc
    ./delete_stack.sh lab01
