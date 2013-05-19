vagrant-puppet-boilerplate
==========================

An initial draft for some vagrant puppet provisioning boilerplate

###Notes:
* The modules are segregated into two areas: 'core' & 'site'.
* 'core' is meant for modules that won't change very much, i.e., an apache packge module.
* 'site' is meant for modules that will change and are directly related to the site you are building, i.e., a list of python packages required by your project.
* This particular set up uses the Stages feature in Puppet to ensure some things run before others
    * see: http://docs.puppetlabs.com/guides/language_guide.html (scroll down to "Run Stages")
* What runs in the 'first' and 'last' stages is managed by the site/manifests/init.pp
    * Follow the code thats already there for examples. 
* Not everything EVER is in here, but it's been compiled from a group of projects using vagrant, feel free to fork / pull reqeust if you would like to add your own modules.

###Core Modules:
* Packages:
    * apache2
    * git
    * mysql5
    * php5
    * python
    * ruby
    * vim
    * curl
    * compass (ruby gem)
    * jpegtran
    * optipng
    * yeoman.io
    * nodejs

###Disclaimer:
* These modules have only been tested on an Ubuntu vagrant virtual machine. As the finer details of Linux environments vary you may encounter unexpected error when using something other than Ubuntu. I intend to add more support later but this is what you get for now. Again fork / pull requset if you find time to do it yourself! Thanks!

###TODO:
1. Update README / Documentation
2. Yeoman.io + PhantomJS provisioning successfully installs PhantomJS, however running PhantomJS still has an issue with a shared lib. Docs reccommend building it from source, I need to try this to see if it fixes my issue.