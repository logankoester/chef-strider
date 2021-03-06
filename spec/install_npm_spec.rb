require 'spec_helper'

describe 'strider::install_npm' do
  before do
    # Fauxhai.mock(path: 'spec/fixtures/arch.json') do
    # end
    # stub_data_bag('some_data_bag').and_return(['some_item'])
    # stub_data_bag_item_from_file 'some_data_bag', 'some_item'
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new do
      # node.set['some_attribute'] = {}
    end.converge(described_recipe)
  end

  describe 'python2' do
    it 'should be installed from package' do
      expect(chef_run).to install_package 'python2'
    end
  end

  describe 'nodejs' do
    it 'should be installed from package' do
      expect(chef_run).to install_package 'nodejs'
    end
  end

  describe 'nodejs' do
    it 'should be installed from package' do
      expect(chef_run).to install_package 'npm'
    end
  end
end
