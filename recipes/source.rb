file_name       = "v#{node[:beanstalk][:github_version]}.tar.gz"
remote_location = "https://github.com/kr/beanstalkd/archive/"

remote_file "#{Chef::Config[:file_cache_path]}/#{file_name}" do
    source "#{remote_location}#{file_name}"
    checksum node[:beanstalk][:github_checksum]
    notifies :run, "bash[install_program]", :immediately
end

bash "install_program" do
    user "root"
    cwd "#{Chef::Config[:file_cache_path]}/"
    code <<-EOH
      tar -zxf #{file_name}
      (cd beanstalkd-#{node[:beanstalk][:github_version]}/ && make && make install)
    EOH
    action :nothing
end
