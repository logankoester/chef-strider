default['strider'] = {
  from: 'package', # or 'npm'
  version: '1.7.5',
  supervisor: false, # use supervisor instead of systemd?
  user: {
    username: 'strider',
    home: '/usr/lib/node_modules/strider'
  },
  environment: {}
}
