# Changing the APT sources.list to kambing.ui.ac.id
sudo cp '/vagrant/configuration/sources.list' '/etc/apt/sources.list'

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y

# Updating the repo with the new sources
sudo apt-get update -y

sudo apt install nginx php7.2-fpm php7.2-common php7.2-mbstring php7.2-xmlrpc php7.2-soap php7.2-gd php7.2-xml php7.2-intl php7.2-mysql php7.2-cli php7.2-zip php7.2-curl -y

sudo cp /vagrant/webserver_config/default /etc/nginx/sites-available/default -f

cd /tmp
wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
sudo mv composer.phar /usr/local/bin/composer

cd ~
git clone https://github.com/jonathan-lewerissa/web-pmk-its.git
cd ~/web-pmk-its
cp /vagrant/webserver_config/.env.deploy /home/vagrant/web-pmk-its/.env
composer install

php artisan key:generate

sudo chown -R $USER:www-data storage
sudo chown $USER:www-data storage/logs/laravel.log
sudo chown -R $USER:www-data bootstrap/cache

sudo chmod -R 775 storage
sudo chmod 775 storage/logs/laravel.log
sudo chmod -R 775 bootstrap/cache

