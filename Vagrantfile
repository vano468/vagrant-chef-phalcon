# encoding: utf-8
# -*- mode: ruby -*-

Vagrant.configure '2' do |config|

  config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"
  config.ssh.forward_agent = true
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder "www" , "/var/www/", mount_options: ["dmode=777", "fmode=666"]

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'vagrant/cookbooks']
    chef.add_recipe 'apt'
    chef.add_recipe 'git'
    chef.add_recipe 'apache2'
    chef.add_recipe 'php'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'php::module_pgsql'
    chef.add_recipe 'apache2::mod_php5'
    chef.add_recipe 'apache2::mod_rewrite'
    chef.add_recipe 'configure'
    chef.json = {
      apache: {
        default_site_enabled: 'true',
        docroot_dir: "/var/www/public",
        user: 'vagrant',
        group: 'vagrant'
      },
      postgresql: {
        password: {
          postgres: 'root'
        }
      },
      configure: {
        database: 'test_db',
        script_paths: [
          'www/migrations/v0.initial_structure.sql',
          'www/migrations/v1.add_some_data.sql'
        ]
      }
    }
  end
  
  config.vm.provision :shell, inline: 'apt-get update'
  config.vm.provision :shell, inline: 'apt-get -y install libpcre3-dev'
  config.vm.provision :shell, path: 'vagrant/shell/install_phalcon.sh'
end