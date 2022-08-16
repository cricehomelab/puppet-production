#! bash.sh
add-apt-repository universe
curl -fsSL https://repo.jellyfin.org/ubuntu/jellyfin_team.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/debian-jellyfin.gpg
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/ubuntu $( lsb_release -c -s ) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
apt update