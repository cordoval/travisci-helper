describe "apache2-configure"

it_displays_description() {
	./.travis/scripts/apache2-configure.sh | grep "Applying" | grep "apache2 configuration"
}

it_enables_default_vhost_when_no_arg() {
	./.travis/scripts/apache2-configure.sh | grep "Enabling virtual host" | grep "virtualhost.local"
}

it_enables_given_vhost() {
	./.travis/scripts/apache2-configure.sh "foobar.local" | grep "Enabling virtual host" | grep "foobar.local"
}

it_warns_on_apache2_restart() {
	./.travis/scripts/apache2-configure.sh | grep "Restarting"
}
