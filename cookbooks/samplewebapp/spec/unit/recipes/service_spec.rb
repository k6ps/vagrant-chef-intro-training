require 'chefspec'
require 'chefspec/berkshelf'

describe 'samplewebapp::service' do
    
     let(:chef_run) do
         ChefSpec::SoloRunner.new do |node|
         end.converge(described_recipe)
     end
    
    it 'runs tomcat installation recipe' do
        expect(chef_run).to include_recipe('samplewebapp::default')
    end
    
    it 'runs mongodb installation recipe' do
        expect(chef_run).to include_recipe('mongodb::default')
    end

end
