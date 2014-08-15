# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME   = ENV['BOX_NAME'] || "ubuntu/trusty64" # 14.04
AWS_REGION = ENV['AWS_REGION']
AWS_AMI    = ENV['AWS_AMI']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BOX_NAME
  config.vm.box_check_update = true
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
    aws.keypair_name = ENV["AWS_KEYPAIR_NAME"]
    override.ssh.private_key_path = ENV["AWS_SSH_PRIVKEY"]
    override.ssh.username = "ubuntu"
    aws.region = AWS_REGION
    aws.ami    = AWS_AMI
    aws.instance_type = "m1.xlarge"
  end

  config.vm.provider :virtualbox do |vb|
    config.vm.box = BOX_NAME
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "docker" do |d|
    d.pull_images "ubuntu:14.04"

    Dir['images/*'].each do |image|
      basename = File.basename(image)
      name = "crowdtap/#{basename}"
      d.pull_images name
      d.run name, args: "-v '/var/log/#{basename}:/logs/#{basename}'"
    end
  end

  config.vm.post_up_message = [
    'Your development environment is now ready!',
    '',
    'Port 80 has been forwarded into the VM, so you can access it via http://localhost:8080.'
  ].join("\n")
end
