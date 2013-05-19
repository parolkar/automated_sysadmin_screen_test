##Automated SysAdmin Screen Test 
Toolkit to help you screen sysadmin/devops candidates

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


---------------------------------------------------------------
<sub><font size='1'>
Copyright (c) 2013 Abhishek Parolkar [abhishek[at]parolkar[dot]com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</font></sub>

