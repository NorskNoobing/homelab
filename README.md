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
# Running scripts
All of the initializer scripts are the `scripts` folder. You only have to go through the files in this folder, in order to execute commands, playbooks, etc.

# Secrets and templates
The files that are deemed secret with private info are `.gitignore`'d in this repo. Therefore I've added the `.templates` folder that have example templates of all these secret files.
The `.templates` folder is structured from the root of the repo, so the template files could easily be merged to fill in and create the secret files from scratch.