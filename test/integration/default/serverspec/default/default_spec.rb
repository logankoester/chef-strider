require 'spec_helper'

describe user('strider') do
  it { should exist }
  it { should have_home_directory '/usr/lib/node_modules/strider' }
end

describe package('nodejs') do
  it { should be_installed }
end

describe command('npm root -g') do
  its(:stdout) { should eq "/usr/lib/node_modules\n" }
end

describe file('/usr/lib/node_modules/strider') do
  it { should be_directory }
  it { should be_owned_by 'strider' }
  it { should be_grouped_into 'strider' }
  it { should be_mode 775 }
end
