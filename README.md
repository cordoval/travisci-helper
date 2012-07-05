# travisci-behat
### A set of scripts to ease the configuration of your Travis CI test environment

## How to use

To start using travis-ci helper, just put the content of the repository in the root of your project. You will then have to do some little tweaks
in the ```.travis.yml``` and ```travisci-helper.sh``` files.

In oth files, you will have to replace some variables (variables are inside brackets) :
* [myapp] : the domain name you want to use to test your web app. 
* [mydatabase] : the database name you want to use to test your web app.
* [mybrowser] : the browser you want to use to test your web app. On TravisCI, this should always be ```phantomjs`` unless you choose to install another one.

When your are done with this (editing bot ```.travis.yml``` and ```travisci-helper.sh```) you should launch the ```travisci-helper.sh``` to test your configuration : this script is made to test your configuration locally, so be carefull, it will install some packages and also create an Apache virtual host.

If you don't want to run some steps (for example, you don't want to run Behat tests, simply remove or comment the steps used to configure and launch them).

Once everything is OK, you can commit your change and enable Travis CI on your repository. On each push, you should see a build starting.

## How does it work ?

Travis CI Helper is simply a set of script that will configure your environment. It simply calls every scripts declared in the configuration file with the option you set.

Some scripts have parameters to let you customize the steps :
* ```apt-get.sh <EXTRA_PACKETS>``` : This script will install packets required for your project. It will always install the following packages : ```apache2 libapache2-mod-php5 php5-mysql```. You can extend this list using the ```EXTRA_PACKETS``` parameter.
* ```apache2-vhost.sh <VHOSTNAME>``` : This script will create a new Apache virtual host. You can change the name of this vhost with the first script's parameter (defaults to ```virtualhost.local```).
* ```apache2-configure.sh <VHOSTNAME>``` : This script will only enable some Apache module and activate the virtual host created by previous script. You will have to give it the vhost name using the ```VHOSTNAME``` parameter (defaults to ```virtualhost.local```).
* ```mysql.sh <DBNAME>``` : This script wiill only create a new MySQL database for which you can choose a name using the ```DBNAME``` parameter (defaults to ```myapp_test```).
* ```sf2-configure.sh <DBNAME>``` : This script wiill configure your Symfony2 project. You just have to give it the name of the database to use with the ```DBNAME``` parameter (defaults to ```myapp_test```).



