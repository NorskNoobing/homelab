proxmox_api_url = "https://<PROXMOX_NODE_IP>:8006/api2/json" # I.e. https://192.168.0.2:8006/api2/json
proxmox_api_token_id = "" # i.e. "root@pam!terraform"
proxmox_api_token_secret = "" # xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ssh_pubkey = "" # Instert you SSH pubkey that you want to use for the VMs here.
ciuser = "" # Set the default cloudinit username for the VMs here.
cipassword = "" # Set the default cloudinit password for the VMs here.
nameserver = "" # DNS server IP for the VMs.
gateway = "" # Gateway IP for the VMs.
ssh_private_key_path = "" # Path to the private SSH key used for accessing the VMs.

vms = {
	"RKE2_01" = {
		node      = "" # Proxmox node hostname where the VM should be created.
		ip        = "" # I.e. "192.168.0.10/24". Keep in mind to use the CIDR notation for the ip.
		id        = "" # VM ID for the VM. Make sure it's unique and not in use.
		hostname  = "RKE2_01" # Hostname for the VM.
	}
	"RKE2_02" = {
		# Same as above for each VM you want to create.
	}
}