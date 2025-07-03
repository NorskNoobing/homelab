# Initial setup
## Option 1: WSL
1. Ensure that you have WSL installed by running the following script:
```powershell
GITHUB_REPO_PATH/scripts/bootstrap/Install-WSL.ps1
```
2. Launch the WSL CLI by running the `bash` command in pwsh.
3. After entering WSL, install OpenTofu and Ansible by running the scripts:
```powershell
GITHUB_REPO_PATH/scripts/bootstrap/Install-OpenTofu.ps1
GITHUB_REPO_PATH/scripts/bootstrap/Install-Ansible.ps1
```
4. Import the SSH private key by running the following script:
```bash
GITHUB_REPO_PATH/scripts/bootstrap/Add-SSHPrivatekeyWSL.sh
```
5. Create the CloudInit template via Ansible by running the script below. Make
sure to have the `inventory.ini` file properly set up with info for the Proxmox
node you want to install the template on.
```bash
GITHUB_REPO_PATH/scripts/Create-ProxmoxCloudinitTemplate.sh
```
6. Create the VMs via OpenTofu by running the following script. Make sure to
populate the `.auto.tfvars` file with the required values.
```bash
GITHUB_REPO_PATH/scripts/Invoke-KubeTerraformTemplate.sh
```