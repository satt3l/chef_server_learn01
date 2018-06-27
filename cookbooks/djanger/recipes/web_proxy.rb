include_recipe 'nginx'

nginx_site 'djanger' do
  template "djanger-app"
  enable true
  variables(
    server_name: node['djanger']['server_name']
    uwsgi: true
    path_to_app_sock: node['djanger']['uwsgi']['path_to_sock']
    path_to_uwsgi_params: node['djanger']['uwsgi']['path_to_params']
  )
end
