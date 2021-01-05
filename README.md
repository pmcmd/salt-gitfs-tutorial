# Why did I create this tutorial ? 
Well if you look at: https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html "SIMPLE CONFIGURATION" is quite convoluted and it tells you you only need to change 2 things. Well this is simply not the case.

Example of people getting confused:
https://github.com/saltstack-formulas/salt-formula/issues/18
https://github.com/saltstack/salt/issues/9608
https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#adding-a-formula-as-a-gitfs-remote
https://serverfault.com/questions/817345/salt-top-sls-does-not-update-on-salt-run-fileserver-update-with-gitfs
https://freenode.logbot.info/salt/20201231

Clearly saltstack docs need an update or they should add more to a statement like "SIMPLE CONFIGURATION".
Furthermore this type of configuration is not so simple if you start from scratch. So behold, a working sample of "SIMPLE CONFIGURATION".

## What do I need
1. An updated copy of hashicorp vagrant
2. An updated vbox software on your machine
3. Intermediate-Advanced or a reasonable amount of bash knowledge and distributed systems
4. Some saltstack experience

In my case I have run this on my mac

## What you will expect
1. You will expect 2 vagrant instances running with the ip addresses: master/192.168.33.69 minion/192.168.33.70
2. You should be able to see a webpage on http://192.168.33.70 when you have completed the steps



# How to use this tutorial (START HERE)
1. Copy and rename the vagrant/*-Vagrantfile to your localmachine each in separate directories from this repo
2. Launch the master `vagrant up` first and let it finish
3. Launch the slave `vagrant up` and let it finish
4. Check if it worked, navigate to http://192.168.33.70
5. If you like what happened, feel free to fork the repo and reconfigure it to whatever you desire


## Some useful commands while you are debugging and reconfiguring it for yourself:
1. (agressive) Flush cache and hard restart master and apply to slave `rm -rf /var/cache/salt/master/gitfs/* ; service salt-master restart ;  sleep 1; salt-run fileserver.update ; sleep 10;  salt '*' state.highstate -l debug;`
2. After you update your forked repo you can trigger a git pull and state run via `salt-run fileserver.update && salt '*' state.highstate`

## NOTE
- My repo defaults to "main" branch, if yours is master, you will need to adjust the master, minion, pillartop and salttop configs, I have included some comments in those files



