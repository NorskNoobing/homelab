#######################################################################
#
# This script has to be ran in WSL, as it uses the repo path from
# the userprofile on the Windows host OS, and then runs the ansible
# playbook.
#
# Enter the hostname of the Proxmox node where you want the template
# to get created on.
#
#######################################################################
USERPROFILE_WSL=$(cmd.exe /c "echo %USERPROFILE%" | tr -d '\r' | sed 's#\\#/#g' | sed 's#C:#/mnt/c#')

# Prompt for ssh-key passphrase
eval $(ssh-agent)
ssh-add ~/.ssh/id_ed25519

cd $USERPROFILE_WSL/repos/homelab/ansible/cloudinit_template
ansible-playbook create_proxmox_cloudinit_template.yml -i inventory/inventory.ini -e target_node=PROXMOX_NODE_HOSTNAME