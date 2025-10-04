######################################################################
#
# This script has to be ran in WSL, as it uses the repo path from
# the userprofile on the Windows host OS, and then runs the ansible
# playbook.
#
######################################################################
USERPROFILE_WSL=$(cmd.exe /c "echo %USERPROFILE%" | tr -d '\r' | sed 's#\\#/#g' | sed 's#C:#/mnt/c#')

# Prompt for ssh-key passphrase
eval $(ssh-agent)
ssh-add ~/.ssh/id_ed25519

cd $USERPROFILE_WSL/repos/homelab/RKE2
ansible-playbook site.yaml -i inventory/hosts.ini