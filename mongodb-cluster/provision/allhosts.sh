# Add hostname
sudo cp /vagrant/sources/hosts /etc/hosts

# Copy APT sources list
sudo cp /vagrant/sources/sources.list /etc/apt/
sudo cp /vagrant/sources/mongodb-org-4.2.list /etc/apt/sources.list.d/

# Add MongoDB repo key
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

# Update Repository
sudo apt-get update
# sudo apt-get upgrade -y

# Install MongoDB
sudo apt-get install -y mongodb-org

sudo mkdir /opt/mongo
sudo cp /vagrant/sources/mongo-keyfile /opt/mongo
sudo chmod 400 /opt/mongo/mongo-keyfile
sudo chown mongodb:mongodb /opt/mongo/mongo-keyfile

# Start MongoDB
sudo service mongod start

if [[ $(hostname) == "mongo-config-1" ]]; then
    sudo cp /vagrant/config/mongod-config-1.conf /etc/mongod.conf
    sudo service mongod restart
fi

if [[ $(hostname) == "mongo-config-2" ]]; then
    sudo cp /vagrant/config/mongod-config-2.conf /etc/mongod.conf
    sudo service mongod restart

    # mongo mongo-config-2:27019 < /vagrant/provision/mongo-config.sh
fi

if [[ $(hostname) == "mongo-query-router" ]]; then
    sudo service mongod stop

    sudo cp /vagrant/config/mongos-query-router.conf /etc/mongos.conf
    sudo cp /vagrant/sources/mongos.service /lib/systemd/system/mongos.service

    sudo systemctl enable mongos.service
    sudo systemctl stop mongos
fi

if [[ $(hostname) == "mongo-shard-1" ]]; then
    sudo cp /vagrant/config/mongo-shard-1.conf /etc/mongod.conf
    sudo service mongod restart
fi

if [[ $(hostname) == "mongo-shard-2" ]]; then
    sudo cp /vagrant/config/mongo-shard-2.conf /etc/mongod.conf
    sudo service mongod restart
fi

if [[ $(hostname) == "mongo-shard-3" ]]; then
    sudo cp /vagrant/config/mongo-shard-3.conf /etc/mongod.conf
    sudo service mongod restart

    # mongo mongo-query-router:27017 -u mongo-admin -p password --authenticationDatabase admin < /vagrant/provision/register-shard.sh
fi