#
# Cookbook Name:: test_service
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
#
include_recipe 'python'
project_name = node['test_service']['project_name']
bash 'run super site' do
  code <<-EOH
    cd /srv/code/#{project_name}
    pip install -r requirements.txt
    python manage.py runserver 0.0.0.0:8080 &
    touch .started
  EOH
  not_if {::File.exists?("/srv/code/#{project_name}/.started")}
end
