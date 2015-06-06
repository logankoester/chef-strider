# Install strider via system package

execute 'sync_packages' do
  command 'pacman -Sy'
  action :run
end

package('strider') { action :install }
