# Install Python pip and Ansible inside WSL
wsl sudo apt update
wsl sudo apt install -y pipx
wsl pipx ensurepath
wsl -t Ubuntu # Restart WSL to apply bashrc changes 
wsl pipx install --include-deps ansible