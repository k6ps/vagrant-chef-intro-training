require 'serverspec'

set :backend, :exec

describe 'SampleWebApp application server setup' do
    
    describe command('java -version 2>&1') do
        its(:stdout) { should match /Java HotSpot/ }
        its(:stdout) { should match /build 1\.8/ }
        its(:exit_status) { should eq 0 }
    end
    
    describe service("tomcat7") do
        it { should be_enabled }
        it { should be_running }
    end

    describe port(8080) do
        it { should be_listening }
    end

    describe command("curl http://localhost:8080") do
        its(:stdout) { should match /.*It works.*/ }
        its(:exit_status) { should eq 0 }
    end
    
end
