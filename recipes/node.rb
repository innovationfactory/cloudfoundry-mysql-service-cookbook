#
# Cookbook Name:: cloudfoundry-mysql-service
# Recipe:: node
#
# Copyright 2012, Innovation Factory
# Copyright 2012, Trotter Cashion
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['cloudfoundry_mysql_service']['node']['base_dir'] = File.join(node['cloudfoundry_common']['services_dir'], "mysql")
node.default['cloudfoundry_mysql_service']['node']['db_logs_dir'] = File.join(node['cloudfoundry_common']['log_dir'], "mysql")
node.default['cloudfoundry_mysql_service']['node']['instances_dir'] = File.join(node['cloudfoundry_mysql_service']['node']['base_dir'], "instances")

node.override['mysql']['bind_address'] = node['ipaddress']
node.override['mysql']['ec2_path'] = node['cloudfoundry_mysql_service']['node']['instances_dir']

include_recipe "mysql::server"
include_recipe "mysql::server_ec2"

%w[libcurl3 libcurl3-gnutls libcurl4-openssl-dev sqlite3 libsqlite3-ruby libsqlite3-dev].each do |p|
  package p
end

%w[base_dir db_logs_dir instances_dir].each do |d|
  directory node['cloudfoundry_mysql_service']['node'][d] do
    owner node['cloudfoundry_common']['user']
    mode  "0755"
  end
end

cloudfoundry_service_component "mysql_node" do
  service_name "mysql"
  action       [:create, :enable]
end


