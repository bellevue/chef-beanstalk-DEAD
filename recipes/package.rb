case node['platform']
    when 'centos'
        include_recipe 'yum::epel'
        package_name = 'beanstalkd'
    when 'ubuntu'
        package_name = 'beanstalkd'
end

package package_name
