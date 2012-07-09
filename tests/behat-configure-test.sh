describe "apt-get"

it_displays_description() {
	./.travis/scripts/behat-configure.sh | grep "Starting" | grep "Behat configuration"
}

it_displays_default_informations_when_no_arg() {
    ./.travis/scripts/behat-configure.sh | grep "Virtualhost name" | grep "virtualhost.local"
    ./.travis/scripts/behat-configure.sh | grep "Browser name" | grep "phantomjs"
    ./.travis/scripts/behat-configure.sh | grep "Features path" | grep "/features"
    ./.travis/scripts/behat-configure.sh | grep "Bootstrap path" | grep "/features/Context"
}

it_displays_given_virtual_host() {
	./.travis/scripts/behat-configure.sh "foobar.local" | grep "Virtualhost name" | grep "foobar.local"
}

it_displays_given_browser_name() {
	./.travis/scripts/behat-configure.sh "" "firefox" | grep "Browser name" | grep "firefox"
}

it_displays_given_features_and_bootstrap_path() {
	./.travis/scripts/behat-configure.sh "" "" "/foo/bar" | grep "Features path" | grep "/foo/bar"
	./.travis/scripts/behat-configure.sh "" "" "/foo/bar" | grep "Bootstrap path" | grep "/foo/bar/Context"
}

it_displays_bootstrap_path() {
	./.travis/scripts/behat-configure.sh "" "" "" "/foo/bar" | grep "Bootstrap path" | grep "/foo/bar"
}

it_creates_default_behat_config_file() {
	./.travis/scripts/behat-configure.sh

	test -f behat.yml

	cat behat.yml | grep "base_url" | grep "virtualhost.local"
	cat behat.yml | grep "browser_name" | grep "phantomjs"
	cat behat.yml | grep "features" | grep "/features"
	cat behat.yml | grep "bootstrap" | grep "/features/Context"
}
