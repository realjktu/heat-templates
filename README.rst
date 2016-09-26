
===================
mk20 heat templates
===================

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


Quick usage
===========

Install necessary libraries

.. code-block:: bash

   apt-get install python-novaclient python-heatclient

To create heat stack

.. code-block:: bash

    source ./keystonerc 
    ./create_stack.sh template_name env_name

To delete heat stack

.. code-block:: bash

    source ./keystonerc
    ./delete_stack.sh template_name env_name
