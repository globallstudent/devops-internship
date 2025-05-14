# Week 5: IaC | Ansible
## Weekly tasks
1. Introduction to Ansible
    * Objective: Understand the basics of Ansible, its use cases, and fundamental concepts.
    * Resources:
        * [Ansible Documentation: Introduction](https://docs.ansible.com/ansible/latest/getting_started/introduction.html) 
        * [Ansible for Beginners](https://spacelift.io/blog/ansible-tutorial)
        * [Ansible Tutorials](https://www.tutorialspoint.com/ansible/index.htm) 
        * [What is Ansible?](https://www.youtube.com/watch?v=1id6ERvfozo)
2. Setting Up Ansible
    * Objective: Install and configure Ansible on your local machine or server.
    * Tasks:
        * Install Ansible on different platforms (Ubuntu, CentOS, etc.).
        * Configure Ansible control nodes and managed nodes.
    * Resources:
        * [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/index.html) 
        * [Ansible Configuration](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings-locations) 
3. Ansible Basics: Inventory, Playbooks, and Modules
    * Objective: Learn how to create and manage inventories, write basic playbooks, and use Ansible modules.
    * Tasks:
        * Create an inventory file for different environments.
        * Write simple playbooks for common tasks like installing packages, managing services, and copying files.
        * Explore common Ansible modules (e.g., apt, yum, service, file).
    * Resources:
        * [Ansible Inventory | How to build](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html)
        * [Ansible Documentation: Playbooks](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html)
        * [Intro to Ansible Playbooks](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_intro.html) 
        * [Ansible modules](https://docs.ansible.com/ansible/latest/module_plugin_guide/index.html)
        * [Top used modules](https://opensource.com/article/19/9/must-know-ansible-modules)
4. Ansible Variables and Facts
    * Objective: Understand how to use variables and gather facts to create dynamic playbooks.
    * Tasks:
        * Use Ansible facts to gather information about remote hosts.
        * Implement variables in playbooks and manage them using different methods (e.g., vars_files, vars_prompt, environment variables).
    * Resources:
        * [An introduction to Ansible facts](https://www.redhat.com/sysadmin/playing-ansible-facts)
        * [Ansible Facts: How to Gather and Use Them Effectively](https://www.geeksforgeeks.org/ansible-facts/)
        * [Ansible Documentation: Ansible facts](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html)
        * [Ansible Documentation: Variables](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#using-advanced-variable-syntax)
        * [Ansible Playbook variables and facts](https://developers.redhat.com/learning/learn:ansible:get-started-ansible-playbooks/resource/resources:ansible-playbook-variables-and-facts)
        * [Special Variables](https://docs.ansible.com/ansible/2.9/reference_appendices/special_variables.html)
5. Conditionals, Loops, and Handlers
    * Objective: Learn to use conditionals, loops, and handlers to create more complex playbooks.
    * Tasks:
        * Implement conditionals to control task execution based on certain conditions.
        * Use loops to perform repeated tasks.
        * Set up handlers to trigger actions based on task outcomes.
    * Resources:
        * [Ansible Documentation: Conditionals](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_conditionals.html)
        * [Ansible Conditionals](https://spacelift.io/blog/ansible-when-conditional)
        * [Ansible Documentation: Loops](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_loops.html)
        * [Ansible Loops: Tutorial](https://spacelift.io/blog/ansible-loops)
        * [Ansible Documentation: Handlers](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_handlers.html)
6. Roles and Best Practices
    * Objective: Organize your playbooks using roles and follow best practices for Ansible project structure.
    * Tasks:
        * Create and use roles to organize playbooks.
        * Follow Ansible best practices for project structure and playbook design.
    * Resources:
        * [Ansible Documentation: Roles](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html)
        * [Ansible Roles](https://spacelift.io/blog/ansible-roles) 
        * [Ansible Documentation: Best Practices](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html)
7. Ansible Galaxy
    * Objective: Learn how to use Ansible Galaxy to find and use community roles.
    * Tasks:
        * Search for and install roles from Ansible Galaxy.
    * Resources:
        * [Ansible Documentation: Galaxy](https://docs.ansible.com/ansible/latest/cli/ansible-galaxy.html) 


## Homework
1. Clone this repository to your local machine.
2. Create and switch to the new git branch named as ```<your first name>-<your last name>```. For example ```zafar-saidov```
3. Create directories in this project's root path: ```playbooks```, ```roles```, ```inventory```
4. Create a file ```ansible.cfg``` in this project's root path. Write the following ansible configurations as a ```defaults``` configuration:
    * default host list (inventory): ```/builds/zafarsaidov/week5_ansible/inventory```
    * default roles path: ```/builds/zafarsaidov/week5_ansible/roles```
    * interpreter python: ```/usr/bin/python3```
    * default strategy: ```linear```
    * Host key verification: ```False```
5. Create a file ```inventory/hosts``` and describe a host:
    * name: ```runner```
    * ansible connection type: ```local```
6. Initialize a role named ```condition``` inside the folder ```roles``` with the command ```ansible-galaxy```
    * define default variables for role:
        * ```condition_boolean``` - default value is ```true```
        * ```condition_string``` - default value is ```'developer'```
        * ```condition_number``` - default value is ```90```
    * Write following tasks inside the role ```condition``` (ansible module ```debug``` is enough for completing this tasks):
        * Show the message ```Boolean is true``` if the value of variable ```condition_boolean``` is ```true```. If the value of variable ```condition_boolean``` is not ```true``` then ansible must skip this task.
        * Show the message ```There is devops word inside the string``` if the value of variable ```condition_string``` contains string ```devops```. If the value of variable ```condition_string``` doesn't contain string ```devops``` then ansible must skip this task.
        * Show the message ```Number is more than ten``` if the value of variable ```condition_number``` more than ```10```. If the value of variable ```condition_number``` equal or less than ```10``` then ansible must skip this task.
7. Initialize a role named ```loop``` inside the folder ```roles``` with the command ```ansible-galaxy```
    * define default variables for role:
        * ```loop_number``` - default value is ```7```
    * Write following task inside the role ```loop``` (ansible module ```debug``` is enough for completing this task):
        * Show the message ```This is an iteration``` in loop. Count of loop's iterations must equal to the value of variable ```loop_number```
8. Create playbook files inside the directory ```playbooks```:
    * File: ```condition.yml```:
        * Hosts: ```runner```
        * Playbook must include role ```condition```
    * File: ```loop.yml```:
        * Hosts: ```runner```
        * Playbook must include role ```loop```
9. <span style='color:red'><b>EXTRA: </b></span>Add new host to a hosts file ```inventory/hosts```:
    * name: ```app-server```
    * ansible connection type: ```ssh```
    * private key file path: ```/scripts/id_rsa```
    * Configure other necessary host variables (user, ip, ssh port, sudo password) so that runner can connect for running ansible tasks 
    * Copy id-rsa.pub file content and add this key to server user as a public key (~/.ssh/authorized_keys). User must be the same as ansible user for app-server host.
10. <span style='color:red'><b>EXTRA: </b></span>Install packages in host ```app-server```:
    * Initialize a role named ```package``` inside the folder ```roles``` with the command ```ansible-galaxy```:
    * Define default variable ```package_list``` with value ```["nginx", "net-tools", "htop"]```
    * Write task which installs all packages in array ```package_list```, enable ```update_cache```. Use module ```apt``` or ```yum``` depending your server's OS. State of packages must be taken from variable ```package_state```. Set default filter (if variable ```package_state``` doesn't exists, value for this parameter must be equal to ```present```)
    * Create playbook file inside the directory ```playbooks```:
        * File: ```package.yml```:
        * Hosts: ```app-server```
        * Playbook must include role ```package```
11. <span style='color:red'><b>EXTRA: </b></span>Manage entries in sysctl.conf:
    * Initialize a role named ```sysctl``` inside the folder ```roles``` with the command ```ansible-galaxy```:
    * Define default variable ```sysctl_conf``` with value ```{net.ipv4.ip_forward: '1', vm.swappiness: '5'}```
    * Write task which configures sysctl (linux kernel) parameters. Use ```sysctl_conf``` variable, iterate over keys, use key as a parameter name and value as a parameter value. Reload parameter must be false. 
    * Create playbook file inside the directory ```playbooks```:
        * File: ```sysctl.yml```:
        * Hosts: ```app-server```
        * Playbook must include role ```sysctl```
12. <span style='color:red'><b>EXTRA: </b></span>Create Linux user:
    * Initialize a role named ```user``` inside the folder ```roles``` with the command ```ansible-galaxy```:
    * Define default variables:
        * ```user_name``` --> default value is ```devops```
    * Write task which creates user in OS Linux. Use correct ansible modules with the following parameters:
        * user name: Get from variable ```user_name```
        * user primary group: Get from variable ```user_group```. Set default filter (if variable ```user_group``` doesn't exists, value for this parameter must be taken from variable ```user_name```)
        * user state: Value of this parameter must be taken from variable ```user_state```. Set default filter (if variable ```user_state``` doesn't exists, value for this parameter must be equal to ```present```)
    * Create playbook file inside the directory ```playbooks```:
        * File: ```user.yml```:
        * Hosts: ```app-server```
        * Playbook must include role ```user```
13. <span style='color:red'><b>EXTRA: </b></span>Configure hostname of server:
    * Initialize a role named ```hostname``` inside the folder ```roles``` with the command ```ansible-galaxy```:
    * Define default variable ```hostname_set``` with value ```app-server```
    * Write task which changes hostname of server to value of variable ```hostname_set```. 
    * Create playbook file inside the directory ```playbooks```:
        * File: ```hostname.yml```:
        * Hosts: ```app-server```
        * Playbook must include role ```hostname```

### Important
When you write playbooks for extra tasks, enable privilege escalation 
### Important
When you use variable type apart from string inside ansible tasks, you need to use specific filters to define variable type in order to avoid type mismatching 

14. Commit your changes and push your commits to gitlab (branch: name-surname)



## Assesment
1. ```playbooks```, ```roles```, ```inventory``` folders are created.
2. ```ansible.cfg``` file is created and configured properly.
3. ```inventory/hosts``` file is created and host is added
4. ```condition``` role and ```playbooks/condition.yml``` playbook file are created. Playbook includes necessary role, tasks defined correctly, play runs without error and show correct output.
5. ```loop``` role and ```playbooks/loop.yml``` playbook file are created. Playbook includes necessary role, tasks defined correctly, play runs without error and show correct output.
6. <span style='color:red'><b>EXTRA: </b></span> Host which is included inventory file as ```app-server``` is reachable via ssh connection.
7. <span style='color:red'><b>EXTRA: </b></span> Packages, which are defined by variable ```package_list```, can be installed by running playbook ```playbooks/package.yml```.
8. <span style='color:red'><b>EXTRA: </b></span> Kernel parameters, which are defined by variable ```sysctl_conf```, can be configured by running playbook ```playbooks/sysctl.yml```.
9. <span style='color:red'><b>EXTRA: </b></span> User, whose username is defined by variable ```user_name```, can be created by running playbook ```playbooks/user.yml```. If variables ```user_group``` and/or ```user_homedir``` are/is defined, than playbook must use them/it, otherwise default values must be used.
10. <span style='color:red'><b>EXTRA: </b></span> Hostname, which are defined by variable ```hostname_set```, can be set by running playbook ```playbooks/hostname.yml```


