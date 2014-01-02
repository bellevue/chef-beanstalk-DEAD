file_name       = "#{node[:beanstalk][:github_tag]}.tar.gz"
remote_location = "https://github.com/kr/beanstalkd/archive/"
local_location  = "#{Chef::Config[:file_cache_path]}/tmp/"

remote_file "#{local_location}#{file_name}" do
    source "#{remote_location}#{file_name}"
    checksum node[:beanstalk][:github_checksum]
    notifies :run, "bash[install_program]", :immediately
end

bash "install_program" do
    user "root"
    cwd "#{Chef::Config[:file_cache_path]}/tmp/"
    code <<-EOH
      tar -zxf #{file_name}
      (cd #{node[:beanstalk][:github_tag]}/ && make && make install)
    EOH
    action :nothing
end
