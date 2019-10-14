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
        * Webserver: NGINX dengan PHP


  * Implementasi infrastruktur basis data terdistribusi
    * Proses instalasi
      
      Sebelum melakukan instalasi, kita perlu melakukan instalasi [Vagrant](https://www.vagrantup.com/) terlebih dahulu untuk membantu kita melakukan *provisioning*.

      Untuk melakukan proses instalasi dan konfigurasi basis data terdistribusi, terdapat beberapa tahapan yang mencakup instalasi basis data MySQL, instalasi ProxySQL, serta instalasi aplikasi web. [Konfigurasi dasar](https://drive.google.com/file/d/139l-L86LrEh45PBPchKuQGPNVMKYNYM1/view) telah diberikan oleh dosen pengajar, sehingga hanya perlu mengubah dari konfigurasi tersebut. 

      1. Instalasi dan konfigurasi basis data terdistribusi

          Pertama kita perlu melakukan instalasi melalui vagrant.

      2. Instalasi dan konfigurasi ProxySQL
      3. Instalasi dan konfigurasi Webserver

2. Penggunaan basis data terdistribusi dalam aplikasi
  * Instalasi aplikasi
  * Konfigurasi aplikasi
  * Deskripsi Aplikasi
  * Konfigurasi aplikasi berkaitan dengan database   

3. Simulasi Fail-over
