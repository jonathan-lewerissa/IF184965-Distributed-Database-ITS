CREATE USER 'monitor'@'%' IDENTIFIED BY 'monitorpassword';
GRANT SELECT on sys.* to 'monitor'@'%';
FLUSH PRIVILEGES;

CREATE USER 'reservasiuser'@'%' IDENTIFIED BY 'reservasipassword';
GRANT ALL PRIVILEGES on reservasi.* to 'reservasiuser'@'%';
FLUSH PRIVILEGES;