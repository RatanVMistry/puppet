node default {

}

node 'ip-172-31-32-59.us-west-2.compute.internal' {
        include role::web
}

node /^web\d+\.iono\.com$/ {
	include role::web
}
