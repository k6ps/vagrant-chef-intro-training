require  'chefspec'
require 'chefspec/berkshelf'

test_tomcat_conf_folder = '/some/test/folder'
test_tomcat_admin_username = 'tester'
test_tomcat_admin_password = 'testpasswd'
test_tomcat_users_conf_file = "#{test_tomcat_conf_folder}/tomcat-users.xml"

describe 'samplewebapp::default' do
    
     let(:chef_run) do
         ChefSpec::SoloRunner.new do |node|
             node.set['tomcat']['config_folder'] = test_tomcat_conf_folder
             node.set['tomcat']['admin_username'] = test_tomcat_admin_username
             node.set['tomcat']['admin_password'] = test_tomcat_admin_password
         end.converge(described_recipe)
     end
    
    it 'installs tomcat' do
        expect(chef_run).to install_package('tomcat7')
    end

    it 'installs tomcat admin' do
        expect(chef_run).to install_package('tomcat7-admin')
    end
    
    it 'creates tomcat-users.xml file with correct admin user and roles' do
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<role.*rolename=\"manager-gui\"/)
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<role.*rolename=\"manager-script\"/)
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<role.*rolename=\"manager-status\"/)
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<user.*username=\"#{test_tomcat_admin_username}\"/)
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<user.*password=\"#{test_tomcat_admin_password}\"/)
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<user.*username=\"#{test_tomcat_admin_username}\".*roles=.*manager-gui/)
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<user.*username=\"#{test_tomcat_admin_username}\".*roles=.*manager-script/)
        expect(chef_run).to render_file(test_tomcat_users_conf_file).with_content(/<user.*username=\"#{test_tomcat_admin_username}\".*roles=.*manager-status/)
    end
    
    it 'restarts application server immediately when tomcat-users.xml is modified' do
        expect(chef_run.template(test_tomcat_users_conf_file)).to notify('service[tomcat7]').to(:restart).immediately
    end

    it 'runs java installation recipe' do
        expect(chef_run).to include_recipe('java::default')
    end

end
