# Where to write the mysql service gateway's pid.
default[:cloudfoundry_mysql_service][:gateway][:pid_file] = File.join(node.cloudfoundry_common.pid_dir, "mysql_gateway.pid")

# Where to write the mysql service gateway's logs.
default[:cloudfoundry_mysql_service][:gateway][:log_file] = File.join(node.cloudfoundry_common.log_dir, "mysql_gateway.log")

# TODO (trotter): Find out what this does.
default[:cloudfoundry_mysql_service][:gateway][:timeout] = 30

# Log level for the msyql service gateway.
default[:cloudfoundry_mysql_service][:gateway][:log_level] = "info"

# TODO (trotter): Find out what this does.
default[:cloudfoundry_mysql_service][:gateway][:node_timeout] = 30

