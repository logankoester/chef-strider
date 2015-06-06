require 'spec_helper'

describe 'strider::default' do
  before do
    # Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    # end
    # stub_data_bag('some_data_bag').and_return(['some_item'])
    # stub_data_bag_item_from_file 'some_data_bag', 'some_item'
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new do # |node|
      # node.set['some_attribute'] = {}
    end.converge(described_recipe)
  end

  it 'should create user' do
    expect(chef_run).to create_user 'strider'
  end

  describe 'templates' do
    it 'should create the "strider.service" unit' do
      expect(chef_run).to render_file('/etc/systemd/system/strider.service')
    end

    it 'should create the "env" configuration file' do
      expect(chef_run).to render_file('/var/lib/strider/env')
    end
  end
end
