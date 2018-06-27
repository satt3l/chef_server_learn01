default['djanger']['app_to_install'] = [
  { name: 'git', action: 'upgrade' },
  { name: 'wget' },
  { name: 'curl' }
]

default['djanger']['server_name'] = '_'
default['djanger']['uwsgi'] = {
  'path_to_sock': '/opt/app/djanger.sock',
  'path_to_params': '/opt/app/uwsgi_params'
}
