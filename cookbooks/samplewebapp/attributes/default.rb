default['tomcat']['config_folder'] = "/etc/tomcat7"
default['tomcat']['admin_username'] = "admin"
default['tomcat']['admin_password'] = "password"

override['java']['install_flavor'] = 'oracle'
override['java']['jdk_version'] = '8'
override['java']['oracle']['accept_oracle_download_terms'] = true
