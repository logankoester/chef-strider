strider_user = node['strider']['user']
supervisor = node['strider']['supervisor']

node.normal['strider']['environment']['NPM_CONFIG_CACHE'] =
  File.join(strider_user['home'], '.npm')

# Install prerequisites if missing
package('git') { action :install }
package('openssh') { action :install }

# Create user account
user strider_user['username'] do
  home strider_user['home']
  system true
  action :create
end

# Install Strider with chosen strategy
if node['strider']['from'] == 'npm'
  include_recipe 'strider::install_npm'
elsif node['strider']['from'] == 'package'
  include_recipe 'strider::install_package'
end

directory strider_user['home'] do
  owner 'strider'
  group 'strider'
  mode '0775'
  recursive true
end

# Start and enable systemd or supervisor service
if supervisor
  supervisor_service 'strider' do
    action [:enable]
    user strider_user['username']
    directory strider_user['home']
    command '/usr/bin/strider'
    environment node['strider']['environment']
  end
else
  execute 'systemctl-daemon-reload' do
    command '/bin/systemctl --system daemon-reload'
    action :nothing
  end

  template '/etc/systemd/system/strider.service' do
    source 'strider.service.erb'
    action :create
    owner 'root'
    group 'root'
    mode '0644'
    notifies :run, 'execute[systemctl-daemon-reload]', :immediately
    notifies :restart, 'service[strider]', :immediately
  end

  service 'strider' do
    provider Chef::Provider::Service::Systemd
    supports status: true, restart: true, reload: true
    action [:start, :enable]
  end

  template File.join(strider_user['home'], 'env') do
    source 'env.erb'
    owner strider_user['username']
    action :create
    mode '0644'
    notifies :restart, 'service[strider]', :immediately
  end
end
