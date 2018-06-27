#
# Cookbook Name:: olign_handlers
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.
#
package 'cowsay'

Chef.event_handler do
  on :run_completed do
    exec("\$(which cowsay) #{Chef.run_context.node['olign']['what_cowsay']}")
  end
end
