ip=$(hostname -I | awk '{print $3}')

ipres='s/{IP}/'
ipres.=$ip.'/'

sed $ipres mongod-config.conf > test.conf
