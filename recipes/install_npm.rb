# Install strider globally via npm

package('nodejs') { action :install }
package('npm') { action :install }
package('python2') { action :install }

execute 'set_python' do
  command 'npm config set python $(which python2.7)'
  action :run
end

nodejs_npm 'strider' do
  node['strider']['version']
  options ['--production']
end
