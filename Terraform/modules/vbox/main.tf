terraform{
    required_providers {
 virtualbox = {
  source = "terra-farm/virtualbox"
  version = "0.2.2-alpha.1"
    }
  }
}
resource "virtualbox_vm" "node" {
  count  = 2
  name   = "apline ${count.index + 1} "
  image  = "https://app.vagrantup.com/generic/boxes/alpine318/versions/4.3.12/providers/docker/amd64/vagrant.box"
  cpus   = 1
  memory = "2048 mib"

  network_adapter {
    type           = "hostonly"
    device         = "IntelPro1000MTDesktop"
    host_interface = "vboxnet1"


}
  }
output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

output "IPAddr_2" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}