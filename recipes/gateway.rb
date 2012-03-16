cloudfoundry_component "mysql_gateway" do
  install_path File.join(node.cloudfoundry_common.vcap.install_path, "services", "mysql")
  bin_file     File.join(node.cloudfoundry_common.vcap.install_path, "bin", "services", "mysql_gateway")
  pid_file     node.cloudfoundry_mysql_service.gateway.pid_file
end
