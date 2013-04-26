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
    cookbook_file '/etc/default/beanstalkd'
end

service service_name do
    action :start
end