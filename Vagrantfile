#!/usr/bin/env ruby

require 'berkshelf/vagrant'

Vagrant::Config.run do |config|

  images = {
    precise:  'http://files.vagrantup.com/precise64.box',
    cent6:    'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box'
  }

  images.each do |image, url|
    config.vm.define image do |box|

      box.vm.box = image.to_s
      box.vm.box_url = url

      box.ssh.forward_agent = true
      box.berkshelf.berksfile_path = File.expand_path("../Berksfile.dev", __FILE__)

      box.vm.provision :chef_solo do |chef|
        chef.add_recipe 'beanstalk'
      end

    end
  end

end
