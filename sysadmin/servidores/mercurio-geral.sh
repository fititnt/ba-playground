
# Criado Swap
##https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04

sudo fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s # Checar se esta habilitada
sudo vi /etc/fstab

# Adicionar linha abaixo ao final do arquivo
/swapfile   none    swap    sw    0   0

# Checar swapness
cat /proc/sys/vm/swappiness
sysctl vm.swappiness=10 # Swapness (agora) 10

sudo vi /etc/sysctl.conf
# Adicionar ao final
vm.swappiness=10

cat /proc/sys/vm/vfs_cache_pressure
sysctl vm.vfs_cache_pressure=50
sudo vi /etc/sysctl.conf
# Adicionar ao final
vm.vfs_cache_pressure = 50




#
apt-get install make g++
apt-get install openssl-dev  libssl-dev

apt-get install ruby
apt-get install ruby-dev
gem install eventmachine

gem install twitter_to_csv