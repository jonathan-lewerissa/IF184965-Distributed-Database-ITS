# ETS - Basis Data Terdistribusi
by: Jonathan Rehuel Lewerissa - 05111640000105

1. Desain dan Implementasi Infrastruktur
  * Desain Infrastruktur Basis Data Terdistribusi
  ![Skema Desain Infrastruktur](/ETS/img/schema.jpg "Gambar Desain")
    * Spesifikasi server
      * Server Database - 3 unit
        * (192.168.16.105, 192.168.16.106, 192.168.16.107 )
        * OS: Ubuntu 16.04 (provisioning using bento/ubuntu-16.04)
        * RAM 512 MB
        * Database: MySQL
      * Load-balancer - 1 unit
        * 192.168.16.108
        * OS: Ubuntu 16.04 (provisioning using bento/ubuntu-16.04)
        * RAM 512 MB
        * Database: MySQL with ProxySQL
      * Webserver - 1 unit
        * 192.168.16.109
        * OS: Ubuntu 16.04 (provisioning using bento/ubuntu-16.04)
        * RAM 512 MB
        * Webserver: NGINX

2. Penggunaan basis data terdistribusi dalam aplikasi


3. Simulasi Fail-over
