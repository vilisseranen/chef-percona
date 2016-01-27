name              "percona"
maintainer        "Phil Cohen"
maintainer_email  "github@phlippers.net"
license           "MIT"
description       "Installs Percona MySQL client and server"
long_description  "Please refer to README.md"
version           "0.16.2"

recipe "percona",                "Includes the client recipe to configure a client"
recipe "percona::package_repo",  "Sets up the package repository and installs dependent packages"
recipe "percona::client",        "Installs client libraries"
recipe "percona::server",        "Installs the server daemon"
recipe "percona::backup",        "Installs the XtraBackup hot backup software"
recipe "percona::toolkit",       "Installs the Percona Toolkit software"
recipe "percona::cluster",       "Installs the Percona XtraDB Cluster server components"
recipe "percona::configure_server", "Used internally to manage the server configuration."
recipe "percona::replication",   "Used internally to grant permissions for replication."
recipe "percona::access_grants", "Used internally to grant permissions for recipes"
recipe "percona::monitoring", "Installs Percona monitoring plugins for Nagios"

depends "apt", ">= 2.7.0"
depends "build-essential"
depends "openssl"
depends "yum", ">= 3.0"
depends "yum-epel"
depends "chef-vault"

supports "debian"
supports "ubuntu"
supports "centos"
supports "amazon"
supports "scientific"
supports "fedora"
supports "redhat"
