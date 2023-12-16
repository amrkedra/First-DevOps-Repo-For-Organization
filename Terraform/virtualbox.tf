# provider "virtualbox" {

# }

# resource "virtualbox_vm" "ubuntu-server" {
#   count  = 4
#   name   = "ubuntu-server ${count.index + 1} "
#   image  = "/home/amrkedra/ubuntu-image-for-VB.box"
#   cpus   = 2
#   memory = "2048 mib"

#   network_adapter {
#     type           = "hostonly"
#     device         = "IntelPro1000MTDesktop"
#     host_interface = "vboxnet1"


#   }
# }
