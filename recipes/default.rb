#
# Cookbook Name:: beanstalk
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

# 0- Validate
supported_platforms = [ 'ubuntu', 'centos' ]
if not supported_platforms.include? node[:platform]
  Chef::Log.info("#{node[:platform]} is not yet supported :(")
  exit(1)
end

# 1- Install
include_recipe "beanstalk::#{node['beanstalk']['install_type']}"