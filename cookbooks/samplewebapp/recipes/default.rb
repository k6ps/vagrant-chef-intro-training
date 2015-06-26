tomcat_users_config_file = "#{node['tomcat']['config_folder']}/tomcat-users.xml"

package "tomcat7" do
    action :install
end

package "tomcat7-admin" do
    action :install
end

include_recipe 'java'

service "tomcat7" do
  subscribes :restart, "template[#{tomcat_users_config_file}]", :immediately
end

template tomcat_users_config_file do
    source "tomcat-users.xml.erb"
end
