Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  # Network setting for Vagrant >= 0.90
  # From drupal vagrant project
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.share_folder("drupal-project", "/vagrant/drupal-project", "./drupal-project", :owner => "www-data", :group => "www-data")
  # Puppet
  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
    puppet.manifests_path = "puppet/manifests"
  end
end