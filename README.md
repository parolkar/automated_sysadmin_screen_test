##Automated SysAdmin Screen Test 
Toolkit to help you screen sysadmin/devops candidates based on Rspec + Puppet

---------------------------------------------------------


Are you hiring Administrators/Devops in your Ops team? Do you need a better way to shortlist applicants remotely and automatically? and you want to present realworld problems to applicant and not just theoretical questions? 

**Automated SysAdmin Screen Test Toolkit (ASASTT)** allows you to write your interview test in **Rspec** and provision a problem environment using **Puppet** on your choice of hosting (local or AWS EC2). 

### How does it work?

* You formulate a creative sysadmin problem with puppet & rspec (something that can be solved in short time frame (like 15 min))
* The rspec tests describes the check for when problem is successfully solved
* You provision the server which also transfers encrypted rspec tests 
* Candidate logs-in, finds the instructions and finishes the problem or the time expires
* You run the test (which decrypts it) and provide you result on how many rspec examples passed and failed.


### Using the toolkit
There are two components in this toolkit
 
* **Supervillain** : This is the puppet part of the toolkit which allows you to provision target server but does some nasty modifications to the environment to make problem challenging
* **Litmus** : This is the rspec test suite which helps you perform the checks

### What kinda screening test can you create here?

Just look at the example [puppet manifest](https://github.com/parolkar/automated_sysadmin_screen_test/blob/master/supervillain/puppet/modules/destructor/manifests/test_1.pp)   & [rspec tests](https://github.com/parolkar/automated_sysadmin_screen_test/blob/master/litmus/spec/problem_1_spec.rb). That will give you an idea about sort of challenges that can be provisioned.

### Want to give it a try?

First thing you need to use this toolkit is [Vagrant 1.1+](http://www.vagrantup.com/) with [AWS provider](https://github.com/mitchellh/vagrant-aws). Once you have that installed

* Clone the repo 
<pre>
  $ git clone git@github.com:parolkar/automated_sysadmin_screen_test.git asastt
  $ cd asastt
</pre>  
* Add Vagrant vbox for AWS
<pre>
  $ vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
</pre> 

* Check what's in the supervilian's puppet manifests to [describe the challenge](https://github.com/parolkar/automated_sysadmin_screen_test/blob/master/supervillain/puppet/modules/destructor/manifests/test_1.pp)  
  
* Check what's in the [litmus/spec](https://github.com/parolkar/automated_sysadmin_screen_test/blob/master/litmus/spec/problem_1_spec.rb). You should have rspec tests corresponding to challenges described in supervilian. Perform spec packaging by supplying the password (which will be used when you run the test)
<pre>
  $ cd litmus
  $ ./package.sh
  Litmus packaging password: *****
</pre>  
  
* Create/modify configuration to supply your aws credentials before you can provision the test enviroment
<pre>  
  $ cd supervillain
  $ cp config/aws.rb.sample config/aws.rb
</pre>

* Provisioning is simple 
<pre> 
  $ cd supervillain
  $ vagrant up --provider=aws
    Bringing machine 'default' up with 'aws' provider...
    [default] Warning! The AWS provider doesn't support any of the Vagrant
    high-level network configurations (`config.vm.network`). They
    will be silently ignored.
    [default] Launching an instance with the following settings...
    [default]  -- Type: m1.small
    [default]  -- AMI: ami-7a4c2c13
    [default]  -- Region: us-east-1
    [default]  -- Keypair: screentest-keypair
    [default] Waiting for instance to become "ready"...
    [default] Waiting for SSH to become available...
    [default] Machine is booted and ready for use!
    [default] Rsyncing folder: /Users/star/workspace/automated_sysadmin_screentest/supervillain/ => /vagrant
    .
    .
    .
    
  $ vagrant ssh

    

               _   _              _   _            _
              | | | |            | | | |          | |
              | |_| | ___ _   _  | |_| | __ _  ___| | _____ _ __
              |  _  |/ _ \ | | | |  _  |/ _` |/ __| |/ / _ \ '__|
              | | | |  __/ |_| | | | | | (_| | (__|   <  __/ |
              \_| |_/\___|\__, | \_| |_/\__,_|\___|_|\_\___|_|
                           __/ |
                          |___/
               You can find the problems in /challenges directory
               You have full power on this machine, you are sudoer
                             Good luck :)


    Last login: Mon Apr 22 01:50:16 2013 from Hacker
    $
    
</pre>

That's about it, you can now share the instance detail with the candidate and let her finish the task, once done you could log in to the server & run the test like this

<pre>
  # cd /litmus
  # ./run_litmus_test.sh
  (This will ask for the password)
   Problem 1:
    http://superstar.admin.com should return 200 status
    networking
      should not allow traffic from blocked IP addresses (165.4.45.3) (FAILED - 1)
   . . .
   Finished in 1.1 seconds
   200 examples, 198 failures
  
</pre>

This will decide if the candidate has passed the test or not



<br/>
<br/>

<sub>***************************************</sub>
<br\>

<sub><font size='1'>
Copyright (c) 2013 Abhishek Parolkar [abhishek[at]parolkar[dot]com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</font></sub>

