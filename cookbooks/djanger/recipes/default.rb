#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright (C) 2018 Anatoly Turubar
#
# All rights reserved - Do Not Redistribute
#
#
include_recipe 'setup_packages'
include_recipe 'djanger'
include_recipe 'web_proxy'
