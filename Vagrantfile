
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

### Configuration parameters ###
# Virtual machine name
VM_NAME = "test-figlet-fonts"
# Virtual machine memory (MB)
VM_MEMORY_MB = "1024"
################################

Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box.
  config.vm.box = "generic/alpine317"
  # This is the name vagrant outputs on the console and logs.
  config.vm.define VM_NAME
  # This is the hostname inside the VM.
  config.vm.hostname = VM_NAME

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  #config.vm.network "forwarded_port", guest: XXXX, host: XXXX

  # Force the creation of the synced folder in Alpine.
  config.vm.synced_folder ".", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # This is the name VirtualBox uses for the VM.
    vb.name = VM_NAME
    # VM memory.
    vb.memory = VM_MEMORY_MB
  end

  # Execute configuration shell scripts.
  config.vm.provision "shell", name: "Configure ~/.profile file",   path: "scripts/vagrant/configure-profile-file.sh"
  config.vm.provision "shell", name: "Install tools",               path: "scripts/vagrant/install-tools.sh"

end
