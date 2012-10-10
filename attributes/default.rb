include_attribute "cloudfoundry-common"

default['cloudfoundry_mysql_service']['supported_versions'] = {
        "5.1" => "5.1.63"
}
default['cloudfoundry_mysql_service']['version_aliases'] = {
        "current" => "5.1"
}
default['cloudfoundry_mysql_service']['default_version'] = "5.1"



