case node['platform']
    when 'centos'
        include_recipe 'yum::epel'
        package_name = 'beanstalkd'
        service_name = 'beanstalkd'
    when 'ubuntu'
        package_name = 'beanstalkd'
        service_name = 'beanstalkd'
end

package package_name

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
