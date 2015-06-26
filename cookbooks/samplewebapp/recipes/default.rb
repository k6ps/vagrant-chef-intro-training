package "tomcat7" do
    action :install
end

package "tomcat7-admin" do
    action :install
end

service "tomcat7" do
  subscribes :restart, "template[/etc/tomcat7/tomcat-users.xml]", :immediately
end

template "/etc/tomcat7/tomcat-users.xml" do
    source "tomcat-users.xml.erb"
end
