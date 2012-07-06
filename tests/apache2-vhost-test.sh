describe "apache2-vhost"

it_displays_description() {
	./.travis/scripts/apache2-vhost.sh | grep "Starting" | grep "virtual host creation"
}

it_displays_working_directory() {
	./.travis/scripts/apache2-vhost.sh | grep "Working directory" | grep "/travisci-helper/.travis"
}

it_displays_root_directory() {
        ./.travis/scripts/apache2-vhost.sh | grep "Root directory" | grep "/travisci-helper"
}

it_displays_default_vhost_when_no_arg() {
        ./.travis/scripts/apache2-vhost.sh | grep "Virtualhost name" | grep "virtualhost.local"
}

it_displays_given_vhost() {
        ./.travis/scripts/apache2-vhost.sh "foobar.local" | grep "Virtualhost name" | grep "foobar.local"
}

it_displays_default_document_root_when_no_arg() {
        ./.travis/scripts/apache2-vhost.sh | grep "Document root" | grep "/travisci-helper"
}

it_displays_given_document_root() {
        ./.travis/scripts/apache2-vhost.sh "" "/var/www/foo/bar" | grep "Document root" | grep "/var/www/foo/bar"
}

it_creates_default_vhost_config_file() {
	./.travis/scripts/apache2-vhost.sh

	test -f /etc/apache2/sites-available/virtualhost.local

	cat /etc/apache2/sites-available/virtualhost.local | grep "ServerName" | grep "virtualhost.local"
}

it_creates_given_vhost_config_file() {
	./.travis/scripts/apache2-vhost.sh foobar.local

	test -f /etc/apache2/sites-available/foobar.local

	cat /etc/apache2/sites-available/foobar.local | grep "ServerName" | grep "foobar.local"
}

it_sets_default_document_root() {
    ./.travis/scripts/apache2-vhost.sh

	test -f /etc/apache2/sites-available/virtualhost.local

	cat /etc/apache2/sites-available/foobar.local | grep "DocumentRoot" | grep "/travisci-helper"
}

it_sets_given_document_root() {
    ./.travis/scripts/apache2-vhost.sh "" "/var/www/foo/bar"

	test -f /etc/apache2/sites-available/virtualhost.local

	cat /etc/apache2/sites-available/virtualhost.local | grep "DocumentRoot" | grep "/var/www/foo/bar"
}

it_adds_default_vhost_to_hosts() {
    ./.travis/scripts/apache2-vhost.sh

	test -f /etc/hosts

	cat /etc/hosts | grep "127.0.0.1    virtualhost.local"
}

it_adds_given_vhost_to_hosts() {
    ./.travis/scripts/apache2-vhost.sh foobar.local

	test -f /etc/hosts

	cat /etc/hosts | grep "127.0.0.1    foobar.local"
}