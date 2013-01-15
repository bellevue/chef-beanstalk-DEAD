
case node['beanstalk']['install_type']
when 'package'
  
  include_recipe 'yum::epel'

  package 'beanstalkd'

  service 'beanstalkd' do
    action :start
  end

when 'source'

  include_recipe 'beanstalk::source'

else
  Chef::Log.error("install_type must be package or source")
  exit(1)
end