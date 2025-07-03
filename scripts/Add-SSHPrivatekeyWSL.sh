#######################################################################
#
# This script has to be ran in WSL, as it copies the SSH-key from
# the userprofile on the Windows host OS to the WSL userprofile.
#
#######################################################################
USERPROFILE_WSL=$(cmd.exe /c "echo %USERPROFILE%" | tr -d '\r' | sed 's#\\#/#g' | sed 's#C:#/mnt/c#')
SSH_PRIVATE_KEY_PATH=$USERPROFILE_WSL/.ssh/id_ed25519

# Copy private sshkey file
cp $USERPROFILE_WSL/.ssh/id_ed25519 ~/.ssh

# Restrict permissions to the sshkey file
chmod 600 ~/.ssh/id_ed25519

#todo: create ansible sshkey check and download/import script to all scripts that need the sshkey to be present. This would currently be Create-ProxmoxCloudinitTemplate and Invoke-KubeTerraformTemplate