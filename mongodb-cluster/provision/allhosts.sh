# Add hostname
sudo bash -c \\"echo '192.168.33.11 mongo-config-1' >> /etc/hosts\\"
sudo bash -c \\"echo '192.168.33.12 mongo-config-2' >> /etc/hosts\\"
sudo bash -c \\"echo '192.168.33.21 mongo-query-router' >> /etc/hosts\\"
sudo bash -c \\"echo '192.168.33.31 mongo-shard-1' >> /etc/hosts\\"
sudo bash -c \\"echo '192.168.33.32 mongo-shard-2' >> /etc/hosts\\"
sudo bash -c \\"echo '192.168.33.33 mongo-shard-3' >> /etc/hosts\\"

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

# Start MongoDB
sudo service mongod start

# Create master user for MongoDB
if [[ $(hostname) == "mongo-config-1" ]]; then
    cat /vagrant/provision/create-admin.sh | mongo
fi

if [[ $(hostname) != "mongo-query-router" ]]; then
    sudo mkdir /opt/mongo
    sudo cp /vagrant/sources/mongo-keyfile /opt/mongo
    sudo chmod 400 /opt/mongo/mongo-keyfile
    sudo chown mongodb:mongodb /opt/mongo/mongo-keyfile
fi