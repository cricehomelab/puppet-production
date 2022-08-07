#! bash.sh

# puppet installation script.
git clone --depth 1 https://github.com/pi-hole/pi-hole.git Pi-hole
cd "Pi-hole/automated install/"
bash basic-install.sh