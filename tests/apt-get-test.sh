describe "apt-get"

it_displays_description() {
	./.travis/scripts/apt-get.sh | grep "Starting" | grep "packets installation"
}

it_displays_default_packets_list_when_no_arg() {
	./.travis/scripts/apt-get.sh | grep "Packets to install" | grep "apache2 libapache2-mod-php5 php5-mysql"
}

it_displays_packets_list() {
	./.travis/scripts/apt-get.sh "foo bar" | grep "Packets to install" | grep "apache2 libapache2-mod-php5 php5-mysql foo bar"
}
