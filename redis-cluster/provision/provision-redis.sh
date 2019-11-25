# Add hostname
sudo cp /vagrant/sources/hosts /etc/hosts

# Copy APT sources list
sudo cp /vagrant/sources/sources.list /etc/apt/

# Update Repository
sudo apt-get update
sudo apt-get install build-essential tcl libjemalloc-dev -y
# sudo apt-get upgrade -y

# Create user for Redis
sudo adduser --system --group --no-create-home redis
sudo mkdir /var/lib/redis
sudo chown redis:redis /var/lib/redis
sudo chmod 770 /var/lib/redis

# Install Redis
sudo cp /vagrant/sources/redis-stable.tar.gz /home/vagrant
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo make install

sudo cp /vagrant/service/redis.service /lib/systemd/system
sudo cp /vagrant/service/sentinel.service /lib/systemd/system

sudo systemctl enable redis.service
sudo systemctl enable sentinel.service

sudo mkdir /etc/redis

if [[ $(hostname) == "redis-1" ]]; then
    sudo cp /vagrant/configuration/redis-master.conf /etc/redis/redis.conf
else
    sudo cp /vagrant/configuration/redis-slave.conf /etc/redis/redis.conf
fi

sudo cp /vagrant/configuration/sentinel.conf /etc/redis/

sudo chown redis:redis /etc/redis/ -R
sudo chmod 775 /etc/redis/

sudo mkdir /opt/redis
sudo mkdir /opt/redis/redis-stable
sudo chmod 775 /opt/redis/redis-stable -R
sudo chown redis:redis /opt/redis/redis-stable -R