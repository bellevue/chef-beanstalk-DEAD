# 0- Validate
supported_platforms = [ 'ubuntu', 'centos' ]
if not supported_platforms.include? node[:platform]
    Chef::Log.info("#{node[:platform]} is not yet supported :(")
    exit(1)
end

# 1- Install
include_recipe "beanstalk::#{node['beanstalk']['install_type']}"

case node['platform']
    when 'centos'
        include_recipe 'yum::epel'
        package_name = 'beanstalkd'
    when 'ubuntu'
        package_name = 'beanstalkd'
end

if node['platform'] == 'ubuntu'
    template "/etc/default/beanstalkd" do
        source "beanstalkd.erb"
        mode 0644
        owner "root"
        group "root"
    end
end

service service_name do
    action :restart
end
