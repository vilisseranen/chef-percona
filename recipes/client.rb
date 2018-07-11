#
# Cookbook Name:: percona
# Recipe:: client
#

include_recipe "percona::package_repo"

version = value_for_platform_family(
  "debian" => node["percona"]["version"],
  "rhel" => node["percona"]["version"].tr(".", "")
)

case node["platform_family"]
when "debian"
  abi_version = case version
                when "5.5" then "18"
                when "5.6" then "18.1"
                when "5.7" then "20"
                else "20"
                end

  if Array(node["percona"]["server"]["role"]).include?("cluster")
    node.default["percona"]["client"]["packages"] = %W[
      percona-xtradb-cluster-client-#{version}
    ]
  else
    node.default["percona"]["client"]["packages"] = %W[
      libperconaserverclient#{abi_version}-dev percona-server-client-#{version}
    ]
  end
when "rhel"
  if Array(node["percona"]["server"]["role"]).include?("cluster")
    node.default["percona"]["client"]["packages"] = %W[
      Percona-XtraDB-Cluster-devel-#{version} Percona-XtraDB-Cluster-client-#{version}
    ]
  else
    node.default["percona"]["client"]["packages"] = %W[
      Percona-Server-devel-#{version} Percona-Server-client-#{version}
    ]
  end
end

node["percona"]["client"]["packages"].each do |percona_client_pkg|
  package percona_client_pkg do
    action node["percona"]["client"]["package_action"].to_sym
  end
end
