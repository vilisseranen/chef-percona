#
# Cookbook Name:: percona
# Recipe:: backup
#

node.default["percona"]["backup"]["configure"] = true

include_recipe "percona::package_repo"

package "xtrabackup" do
  case node['percona']['version']
  when '5.7'
    package_name 'percona-xtrabackup-24'
  else
    package_name 'percona-xtrabackup'
  end
  options "--force-yes" unless node['platform_family']['rhel']
end

# access grants
include_recipe "percona::access_grants" unless node["percona"]["skip_passwords"]
