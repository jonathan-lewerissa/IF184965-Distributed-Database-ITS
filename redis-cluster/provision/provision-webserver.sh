# Copy APT sources list
sudo cp /vagrant/sources/sources.list /etc/apt/

sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y

# Updating the repo with the new sources
sudo apt update -y

sudo apt install nginx php7.2-fpm php7.2-common php7.2-mbstring php7.2-xmlrpc php7.2-soap php7.2-gd php7.2-xml php7.2-intl php7.2-mysql php7.2-cli php7.2-zip php7.2-curl -y

sudo cp /vagrant/webserver_config/default /etc/nginx/sites-available/default -f

cd /tmp
wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
sudo mv composer.phar /usr/local/bin/composer


