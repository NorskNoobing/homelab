resource "proxmox_vm_qemu" "cloned_vms" {
	for_each = var.vms

	name        = each.value.hostname
	target_node = each.value.node
	vmid        = each.value.id
	clone_id    = 9000 # VMID of the template to clone
	full_clone  = true

	os_type     = "cloud-init"
	cpu_type    = "host"
	sockets     = 1 # Amount of physical CPUs to assign to the VM
	cores       = 4 # Amount of threads
	balloon     = 4096 # Min memory
	memory      = 8192 # Max memory
	onboot      = true # Start VM on boot of Proxmox node
	scsihw      = "virtio-scsi-pci"
	agent  		= 1 # Enable qemu guest agent
	kvm    		= true

	# Most cloud-init images require a serial device for their display
    # ------------------------------------------------------------------------
    # Serial interface of type socket is used by xterm.js
    # You will need to configure your guest system before being able to use it
	serial {
		id = 0
		type = "socket"
	}
	
	# Enable UEFI BIOS
	bios        = "ovmf"
	machine     = "q35"

	disks {
        scsi {
			# Resize template OS disk (scsi0)
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = 300
                }
            }
        }
        ide {
			# Cloud-Init disk (ide2)
            ide2 {
                cloudinit {
                    storage = "local-lvm"
                }
            }
        }
    }

	network {
		id    	 = 0
		model  	 = "virtio"
		bridge 	 = "vmbr0"
		firewall = true
	}
	
	# Setup the ip address using cloud-init.
    # Keep in mind to use the CIDR notation for the ip.
	ipconfig0  = "ip=${each.value.ip},gw=${var.gateway}"
	nameserver = "${var.nameserver}"

	sshkeys    = var.ssh_pubkey
	ciuser     = var.ciuser
	cipassword = var.cipassword
	ciupgrade  = true

	lifecycle {
		ignore_changes = [
			sshkeys,
			ciuser,
			cipassword,
			ipconfig0
		]
	}
}