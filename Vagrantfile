Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  # Network setting for Vagrant >= 0.90
  # From drupal vagrant project
  config.vm.network :hostonly, "33.33.33.10"
  # Puppet
  config.vm.provision :puppet
end