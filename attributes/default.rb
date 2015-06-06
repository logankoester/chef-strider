default['strider'] = {
  from: 'package', # or 'npm'
  version: '1.6.6',
  supervisor: false, # use supervisor instead of systemd?
  user: {
    username: 'strider',
    home: '/usr/lib/node_modules/strider'
  },
  environment: {
    'NPM_CONFIG_CACHE': '/usr/lib/node_modules/.npm'
  }
}
