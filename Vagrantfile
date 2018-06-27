$chef_server_prov = <<-EOF
sudo yum install -y wget
cd /tmp
wget https://packages.chef.io/stable/el/7/chef-server-core-12.10.0-1.el7.x86_64.rpm
rpm -ivh chef-server-core-*.rpm
chef-server-ctl reconfigure
chef-server-ctl user-create trusyak Timofei Rusyak trusyak@aligntech.com Aligner5 -f /srv/data/trusyak.pem
chef-server-ctl org-create olign "Olign, Inc" --association_user trusyak -f /srv/data/olign-validator.pem
EOF
$client_prov = <<-EOF
echo "172.28.128.200 chef.olign.com" >> /etc/hosts
ip a
EOF
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.define "chef_server" do |server|
    server.vm.synced_folder "./data/", "/srv/data/"
    server.vm.network "private_network", ip: "172.28.128.200"
    server.vm.provision "shell", inline: $chef_server_prov
  end
  config.vm.define "chef_node" do |node|
    node.vm.synced_folder "./data/", "/srv/data/"
    node.vm.network "private_network", type: "dhcp"
    node.vm.provision "shell", inline: $client_prov
  end
end
