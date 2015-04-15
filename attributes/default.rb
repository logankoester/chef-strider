default['strider'] = {
  from: 'package', # or 'npm'
  version: '1.6.6',
  supervisor: false, # use supervisor instead of systemd
  user: {
    username: 'strider',
    home: '/var/lib/strider'
  },
  environment: {
  }
}
