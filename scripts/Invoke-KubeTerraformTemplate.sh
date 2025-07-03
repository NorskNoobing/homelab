######################################################################
#
# This script has to be ran in WSL, as it uses the userprofile
# and the ~/repos/homelab/terraform folder from the Windows host OS.
# Then you can copy each command one-by-one to check for errors,
# and apply the tofu changes.
#
######################################################################
USERPROFILE_WSL=$(cmd.exe /c "echo %USERPROFILE%" | tr -d '\r' | sed 's#\\#/#g' | sed 's#C:#/mnt/c#')

# Prompt for ssh-key passphrase
eval $(ssh-agent)
ssh-add ~/.ssh/id_ed25519

cd $USERPROFILE_WSL/repos/homelab/terraform
tofu init
tofu validate
tofu plan
tofu apply