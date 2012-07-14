# travisci-behat
### A set of scripts to ease the configuration of your Travis CI test environment

[![Build Status](https://secure.travis-ci.org/jubianchi/travisci-helper.png?branch=master)](http://travis-ci.org/jubianchi/travisci-helper)

## How to use

To start using travis-ci helper, just put the contents of the repository in the root directory of your project. You will then have to do some little tweaks
in the ```.travis.yml``` and ```travisci-helper.sh``` files.

In both files, you will have to replace some variables (variables are inside brackets) :
* HOST : the domain name you want to use to test your web app.
* DATABASE : the database name you want to use to test your web app.
* BROWSER : the browser you want to use to test your web app. On TravisCI, this should always be ```phantomjs`` unless you choose to install another one.

When your are done with this (editing both ```.travis.yml``` and ```travisci-helper.sh```) you should launch the ```travisci-helper.sh``` to test your configuration : this script was written to test your configuration locally, so be carefull, it will install some packages and also create an Apache virtual host.

If you don't want to run some steps (for example, you don't want to run Behat tests, simply remove or comment out the steps used to configure and launch them).

Once everything is OK, you can commit your changes and enable Travis CI on your repository. On each push, you should see a build starting.

## How does it work ?

Travis CI Helper is simply a set of scripts that will configure your environment. It simply calls every script declared in the configuration file with the option you set.

Some scripts have parameters to let you customize the steps :
* ```apt-get.sh <EXTRA_PACKETS>``` : This script will install packets (or packages) required for your project. It will always install the following packages : ```apache2 libapache2-mod-php5 php5-mysql```. You can extend this list using the ```EXTRA_PACKETS``` parameter.
* ```apache2-vhost.sh <VHOSTNAME>``` : This script will create a new Apache virtual host. You can change the name of this vhost with the script's first parameter (defaults to ```virtualhost.local```).
* ```apache2-configure.sh <VHOSTNAME>``` : This script will only enable some Apache module and activate the virtual host created by the previous script. You will have to pass the vhost name using the ```VHOSTNAME``` parameter (defaults to ```virtualhost.local```).
* ```mysql.sh <DBNAME>``` : This script will only create a new MySQL database for which you can choose a name using the ```DBNAME``` parameter (defaults to ```myapp_test```).
* ```sf2-configure.sh <DBNAME>``` : This script will configure your Symfony2 project. You just have to pass the name of the database to use with the ```DBNAME``` parameter (defaults to ```myapp_test```).



