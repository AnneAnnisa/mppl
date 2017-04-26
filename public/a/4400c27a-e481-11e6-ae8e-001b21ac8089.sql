-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dikirim`
--

DROP TABLE IF EXISTS `dikirim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dikirim` (
  `id_surat` varchar(200) NOT NULL,
  `id_magang` varchar(200) NOT NULL,
  PRIMARY KEY (`id_surat`,`id_magang`),
  KEY `fk_dikirim2` (`id_magang`),
  CONSTRAINT `fk_dikirim` FOREIGN KEY (`id_surat`) REFERENCES `surat` (`id_surat`),
  CONSTRAINT `fk_dikirim2` FOREIGN KEY (`id_magang`) REFERENCES `magang` (`id_magang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dikirim`
--

LOCK TABLES `dikirim` WRITE;
/*!40000 ALTER TABLE `dikirim` DISABLE KEYS */;
/*!40000 ALTER TABLE `dikirim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jabatan` (
  `id_jabatan` varchar(200) NOT NULL,
  `nama_jabatan` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jabatan`
--

LOCK TABLES `jabatan` WRITE;
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
REPLACE INTO `jabatan` VALUES ('1','Analis'),('2','Analis Senior');
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_surat`
--

DROP TABLE IF EXISTS `jenis_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_surat` (
  `id_jenis_surat` varchar(200) NOT NULL,
  `nama_jenis_surat` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_jenis_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_surat`
--

LOCK TABLES `jenis_surat` WRITE;
/*!40000 ALTER TABLE `jenis_surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `jenis_surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magang`
--

DROP TABLE IF EXISTS `magang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magang` (
  `id_magang` varchar(200) NOT NULL,
  `id` varchar(200) DEFAULT NULL,
  `id_pelamar` varchar(200) DEFAULT NULL,
  `id_tempat` varchar(200) DEFAULT NULL,
  `tanggal_terima` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `nilai` varchar(20) DEFAULT NULL,
  `tgl_konfirmasi_magang` date DEFAULT NULL,
  PRIMARY KEY (`id_magang`),
  KEY `fk_ditempatkan` (`id_tempat`),
  KEY `fk_diterima2` (`id_pelamar`),
  KEY `fk_memiliki2` (`id`),
  CONSTRAINT `fk_ditempatkan` FOREIGN KEY (`id_tempat`) REFERENCES `penempatan` (`id_tempat`),
  CONSTRAINT `fk_diterima2` FOREIGN KEY (`id_pelamar`) REFERENCES `pelamar` (`id_pelamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_memiliki2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magang`
--

LOCK TABLES `magang` WRITE;
/*!40000 ALTER TABLE `magang` DISABLE KEYS */;
/*!40000 ALTER TABLE `magang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pangkat`
--

DROP TABLE IF EXISTS `pangkat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pangkat` (
  `id_pangkat` varchar(200) NOT NULL,
  `nama_pangkat` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_pangkat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pangkat`
--

LOCK TABLES `pangkat` WRITE;
/*!40000 ALTER TABLE `pangkat` DISABLE KEYS */;
REPLACE INTO `pangkat` VALUES ('1','Manager'),('2','Kepala Divisi');
/*!40000 ALTER TABLE `pangkat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `nip` varchar(50) NOT NULL,
  `nama_pegawai` varchar(255) DEFAULT NULL,
  `id_pangkat` varchar(200) NOT NULL,
  `id_jabatan` varchar(200) NOT NULL,
  `id` varchar(200) DEFAULT NULL,
  `divisi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`nip`),
  KEY `fk_berpangkat` (`id_pangkat`),
  KEY `fk_menjabat` (`id_jabatan`),
  KEY `fk_punya2` (`id`),
  KEY `divisi` (`divisi`),
  CONSTRAINT `fk_berpangkat` FOREIGN KEY (`id_pangkat`) REFERENCES `pangkat` (`id_pangkat`),
  CONSTRAINT `fk_divisi` FOREIGN KEY (`divisi`) REFERENCES `penempatan` (`id_tempat`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_menjabat` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`),
  CONSTRAINT `fk_punya2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
REPLACE INTO `pegawai` VALUES ('14832','Wihujeng Ayu Rengganis','1','1','133','1');
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelamar`
--

DROP TABLE IF EXISTS `pelamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelamar` (
  `id_pelamar` varchar(200) NOT NULL,
  `id_magang` varchar(200) DEFAULT NULL,
  `id_pelamaran` varchar(200) NOT NULL,
  `nim_pelamar` varchar(1024) DEFAULT NULL,
  `nama_pelamar` varchar(1024) DEFAULT NULL,
  `universitas_pelamar` varchar(1024) DEFAULT NULL,
  `alamat_pelamar` varchar(1024) DEFAULT NULL,
  `fakultas_pelamar` varchar(1024) DEFAULT NULL,
  `email_pelamar` varchar(1024) DEFAULT NULL,
  `tingkat_pelamar` varchar(1024) DEFAULT NULL,
  `tingkat_pelamar_pendek` varchar(1024) DEFAULT NULL,
  `jurusan_pelamar` varchar(1024) DEFAULT NULL,
  `kota_pelamar` varchar(1024) DEFAULT NULL,
  `title_pelamar` varchar(1024) DEFAULT NULL,
  `no_telp_pelamar` varchar(30) DEFAULT NULL,
  `ipk_pelamar` float DEFAULT NULL,
  `status` int(200) DEFAULT NULL,
  PRIMARY KEY (`id_pelamar`),
  KEY `fk_melamar` (`id_pelamaran`),
  KEY `fk_diterima` (`id_magang`),
  CONSTRAINT `fk_diterima` FOREIGN KEY (`id_magang`) REFERENCES `magang` (`id_magang`) ON DELETE SET NULL,
  CONSTRAINT `fk_melamar` FOREIGN KEY (`id_pelamaran`) REFERENCES `pelamaran` (`id_pelamaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelamar`
--

LOCK TABLES `pelamar` WRITE;
/*!40000 ALTER TABLE `pelamar` DISABLE KEYS */;
REPLACE INTO `pelamar` VALUES ('0b78d4e0-e46e-11e6-ae8e-001b21ac8089',NULL,'0b7327b3-e46e-11e6-ae8e-001b21ac8089','24010214120028','Ria Epelina Situmorang','Universitas Diponegoro','Jalan Prof. H. Soedarto, SH. Tembalang Semarang 50275','Fakultas Sains dan Matematika','riasitumorang7@gmail.com','Strata 1','S1','Statistika','Semarang','Sdr','082165369078',3.28,NULL),('0f8a35b6-e465-11e6-ae8e-001b21ac8089',NULL,'0f63ddf7-e465-11e6-ae8e-001b21ac8089','140221100077','Anindya Putri Satrio','Universitas Trunojoyo Madura','Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ekonomi dan Bisnis','','Strata 1','S1','Akuntansi','Madura','Sdri','085649221909',3.66,NULL),('100',NULL,'71','081311633025','Susmiandri','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','susmuandri27@gmail.com','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','083856953697',3.3,NULL),('105',NULL,'73','041311133116','Muchammad Zuhad','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','muchamadzuhad@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdr','085806138198',3.27,NULL),('106',NULL,'73','041311133023','Kurniawan Dwi Yulianto','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','kurniawandy@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdr','085731625966',3.75,NULL),('107',NULL,'74','151410613089','Hania Rizkieta Hazah','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','haniarizkietahazah@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','085668800362',3.6,NULL),('108',NULL,'74','151410613101','Nadia Vita Melinda','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','nadiavita292@yahoo.co.id','Diploma III','D3','Akuntansi','Surabaya','Sdri','082234311360',3.28,NULL),('109',NULL,'74','151410613110','Yayang Rizki Toria N','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','torianugrahani@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','085790504060',3.19,NULL),('112',NULL,'76','1312115029','Laurensius Ezra B M','Universitas Pembangunan Nasional \"Veteran\" Jawa Timur','Jl. Raya Rungkut Madya Gunung Anyar Surabaya 60294','Fakultas Ekonomi dan Bisnis','laurenzeus@gmail.com','Strata 1','S1','Manajemen','Surabaya','Sdr','085850336863',0,NULL),('113',NULL,'77','D1614088','Rena Laila Wuri','Universitas Sebelas Maret ','Jl. Ir. Sutami No. 36 A, Jebres, Surakarta 57126','Fakultas Ilmu Sosial dan Politik','renalaila@gmail.com','Diploma III','D3','Komunikasi Terapan','Surakarta','Sdri','082137991350',3.57,NULL),('21d2e26a-e467-11e6-ae8e-001b21ac8089',NULL,'21ce98ed-e467-11e6-ae8e-001b21ac8089','130231100001','Siti Muawanah','Universitas Trunojoyo Madura','Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ekonomi','yoran172@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Madura','Sdri','087849686965',0,NULL),('21d37d81-e467-11e6-ae8e-001b21ac8089',NULL,'21ce98ed-e467-11e6-ae8e-001b21ac8089','130231100017','Nur Lailil Fadhilah','Universitas Trunojoyo Madura','Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ekonomi','nurlaililfadhilah@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Madura','Sdri','085707155695',0,NULL),('238df5ef-e436-11e6-ae8e-001b21ac8089',NULL,'238b3cd1-e436-11e6-ae8e-001b21ac8089','041311133082','Deviani Henindar','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdri','082231022542',3.08,NULL),('238e9ea8-e436-11e6-ae8e-001b21ac8089',NULL,'238b3cd1-e436-11e6-ae8e-001b21ac8089','041311133148','Kholida Nur Sholika','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdri','085736845096',3.19,NULL),('28875f0f-e440-11e6-ae8e-001b21ac8089',NULL,'28843249-e440-11e6-ae8e-001b21ac8089','081411231072','Dia Kurnia Dewi','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Matematika dan Ilmu Pengetahuan Alam','diakurnia20@gmail.com','Strata 1','S1','Matematika','Surabaya','Sdri','085732387273',3.24,NULL),('288b0a8a-e440-11e6-ae8e-001b21ac8089',NULL,'28843249-e440-11e6-ae8e-001b21ac8089','081411231079','Anggi Dwi Putri','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Matematika dan Ilmu Pengetahuan Alam','anggi.putri1011@gmail.com','Strata 1','S1','Matematika','Surabaya','Sdri','085730222694',3.51,NULL),('29e16dba-e443-11e6-ae8e-001b21ac8089',NULL,'29df42ab-e443-11e6-ae8e-001b21ac8089','081411231053','Rohmatun Azizah','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','rohmatunazizah@gmail.com','Strata 1','S1','Matematika','Surabaya','Sdri','08983934152',3.6,NULL),('29e71226-e443-11e6-ae8e-001b21ac8089',NULL,'29df42ab-e443-11e6-ae8e-001b21ac8089','081411231076','Aminatus Sa\'adah','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','aminatus127@gmail.com','Strata 1','S1','Matematika','Surabaya','Sdri','085748143757',3.75,NULL),('348df9fc-e446-11e6-ae8e-001b21ac8089',NULL,'3488b425-e446-11e6-ae8e-001b21ac8089','2013310116','Harwinanda Putri Kinasih','STIE Perbanas Surabaya','','','','Strata 1','S1','','Surabaya','Sdri','',0,2),('34944c07-e446-11e6-ae8e-001b21ac8089',NULL,'3488b425-e446-11e6-ae8e-001b21ac8089','2013310747','Eri Aptiani Lestari','STIE Perbanas Surabaya','','','','Strata 1','S1','','Surabaya','Sdri','',0,2),('349c807d-e446-11e6-ae8e-001b21ac8089',NULL,'3488b425-e446-11e6-ae8e-001b21ac8089','2013310750','Dwi Yunitasari','STIE Perbanas Surabaya','','','','Strata 1','S1','','Surabaya','Sdri','',0,2),('3bfd8cad-e46c-11e6-ae8e-001b21ac8089',NULL,'3bfbd089-e46c-11e6-ae8e-001b21ac8089','140211100126','Farihatuz Zaidiyah','Universitas Trunojoyo Madura','Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ekonomi dan Bisnis','farihazaidiyah@gmail.com','Strata 1','S1','Manajemen','Madura','Sdri','085733262631',0,NULL),('3ef51483-e464-11e6-ae8e-001b21ac8089',NULL,'3eefe78c-e464-11e6-ae8e-001b21ac8089','031411131043','Ivena Tandiyono','Universitas Airlangga','Kampus B, Jalan Dharmawangsa Dalam Surabaya, 60286','Fakultas Hukum','','Strata 1','S1','Ilmu Hukum','Surabaya','Sdri','081703935793',3.86,NULL),('3ef61b8d-e464-11e6-ae8e-001b21ac8089',NULL,'3eefe78c-e464-11e6-ae8e-001b21ac8089','031411131064','Khoirunnisa\'','Universitas Airlangga','Kampus B, Jalan Dharmawangsa Dalam Surabaya, 60286','Fakultas Hukum','','Strata 1','S1','Ilmu Hukum','Surabaya','Sdri','0878751562025',3.53,NULL),('3ef7917c-e464-11e6-ae8e-001b21ac8089',NULL,'3eefe78c-e464-11e6-ae8e-001b21ac8089','031411131093','Airin','Universitas Airlangga','Kampus B, Jalan Dharmawangsa Dalam Surabaya, 60286','Fakultas Hukum','','Strata 1','S1','Ilmu Hukum','Surabaya','Sdri','089501738646',3.96,NULL),('3f010fba-e434-11e6-ae8e-001b21ac8089',NULL,'3efbf490-e434-11e6-ae8e-001b21ac8089','10114040','Gandhiano Dwi Putera','Institut Teknologi Bandung','Jl. Ganesha No. 10 Bandung 40132 Jawa Barat - Indonesia','Fakultas Matematika dan Ilmu Pengetahuan Alam','gandhianodwiputera@gmail.com','Strata 1','S1','Matematika','Bandung','Sdr','082231669964',3.79,NULL),('41af2a5f-e463-11e6-ae8e-001b21ac8089',NULL,'416a4faf-e463-11e6-ae8e-001b21ac8089','151410913007','Dyah Febe Mayangsari','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','febedyah@gmail.com','Diploma III','D3','Manajemen Perbankan','Surabaya','Sdri','083831814267',3.22,NULL),('41b00866-e463-11e6-ae8e-001b21ac8089',NULL,'416a4faf-e463-11e6-ae8e-001b21ac8089','151410913048','Ismi Roro Asih','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','ismiroro7@gmail.com','Diploma III','D3','Manajemen Perbankan','Surabaya','Sdri','085730136843',2.62,NULL),('41b0c777-e463-11e6-ae8e-001b21ac8089',NULL,'416a4faf-e463-11e6-ae8e-001b21ac8089','151410913033','Mega Evitasari','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','mega_evitasari@yahoo.com','Diploma III','D3','Manajemen Perbankan','Surabaya','Sdri','08977292230',3.2,NULL),('41b34e65-e463-11e6-ae8e-001b21ac8089',NULL,'416a4faf-e463-11e6-ae8e-001b21ac8089','151410913023','R.A Putri Kartika Hartini','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','pkartika62@gmail.com','Diploma III','D3','Manajemen Perbankan','Surabaya','Sdri','085731566458',2.58,NULL),('58996931-e43b-11e6-ae8e-001b21ac8089',NULL,'58966316-e43b-11e6-ae8e-001b21ac8089','041311333062','Anak Agung Citra Ananda Putri','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','citraananda.putri06@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','081999326718',3.57,NULL),('5b857f80-e431-11e6-ae8e-001b21ac8089',NULL,'5b804a36-e431-11e6-ae8e-001b21ac8089','140521100075','Luluk Sisnawati','Universitas Trunojoyo Madura','Gedung RKB-E Universitas Trunojoyo Madura, Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ilmu Sosial dan Ilmu Budaya','luluksisnawati@gmail.com','Strata 1','S1','Sosiologi','Madura','Sdri','085748392632',3.39,NULL),('5b883699-e431-11e6-ae8e-001b21ac8089',NULL,'5b804a36-e431-11e6-ae8e-001b21ac8089','140521100048','Shukron Fauzi','Universitas Trunojoyo Madura','Gedung RKB-E Universitas Trunojoyo Madura, Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ilmu Sosial dan Ilmu Budaya','','Strata 1','S1','Sosiologi','Madura','Sdr','087849691165',3.17,NULL),('5b89f02f-e431-11e6-ae8e-001b21ac8089',NULL,'5b804a36-e431-11e6-ae8e-001b21ac8089','140521100057','Mawar Dwi Susanti','Universitas Trunojoyo Madura','Gedung RKB-E Universitas Trunojoyo Madura, Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ilmu Sosial dan Ilmu Budaya','','Strata 1','S1','Sosiologi','Madura','Sdri','',3.38,NULL),('63d64432-e466-11e6-ae8e-001b21ac8089',NULL,'63d2e9f9-e466-11e6-ae8e-001b21ac8089','24010214120032','Rosalina Aprilda Situmorang','Universitas Diponegoro','Jalan Prof. H. Soedarto, SH. Tembalang Semarang 50275','Fakultas Sains dan Matematika','rosalinaas97@gmail.com','Strata 1','S1','Statistika','Semarang','Sdri','085371322863',3.13,NULL),('6a150e7b-e43c-11e6-ae8e-001b21ac8089',NULL,'6a12de0c-e43c-11e6-ae8e-001b21ac8089','041311333219','Shintya Puspita Damayanti','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','shintyapuspitad@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','08562791834',3.79,NULL),('6a15905f-e43c-11e6-ae8e-001b21ac8089',NULL,'6a12de0c-e43c-11e6-ae8e-001b21ac8089','041311333221','Yulia Ika Nursaraswati','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','yuliaikan@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','085748631959',3.78,NULL),('6a16071c-e43c-11e6-ae8e-001b21ac8089',NULL,'6a12de0c-e43c-11e6-ae8e-001b21ac8089','041311333236','Fitriyaningrum N. Hidayah','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','hidafitriya@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','081235519307',3.36,NULL),('8a491ee5-e442-11e6-ae8e-001b21ac8089',NULL,'8a4781a7-e442-11e6-ae8e-001b21ac8089','081411231087','Rani Apriari','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','rani190496@gmail.com','Strata 1','S1','Matematika','Surabaya','Sdri','085790658901',3.87,NULL),('8a4abc9f-e442-11e6-ae8e-001b21ac8089',NULL,'8a4781a7-e442-11e6-ae8e-001b21ac8089','081411233001','Almas Mundinirmala Hasyyatiningtyas','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','almasmundinirmalah@gmail.com','Strata 1','S1','Matematika','Surabaya','Sdri','081234416505',3.43,NULL),('926f175b-e43a-11e6-ae8e-001b21ac8089',NULL,'926c4054-e43a-11e6-ae8e-001b21ac8089','12020113120056','Wahyu Rochmawati','Universitas Diponegoro','Jalan Prof. H. Soedarto, SH. Tembalang Semarang 50275','Fakultas Ekonomika dan Bisnis','','Strata 1','S1','Ilmu Ekonomi dan Studi Pembangunan','Semarang','Sdri','085600110945',3.78,NULL),('92c4a5cb-e441-11e6-ae8e-001b21ac8089',NULL,'92c0a3d1-e441-11e6-ae8e-001b21ac8089','041310113010','Feyyas Alvira Rahmadani','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','feyyas.vaa@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','085645753099',3.53,NULL),('92c69525-e441-11e6-ae8e-001b21ac8089',NULL,'92c0a3d1-e441-11e6-ae8e-001b21ac8089','041310113055','Ajeng Kartika Savitri','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','ajengkartikasavitri@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','087703075797',3.07,NULL),('932d5887-e46d-11e6-ae8e-001b21ac8089',NULL,'9327e4d3-e46d-11e6-ae8e-001b21ac8089','201310370311237','Fajar Tri Cahyono','Universitas Muhammadiyah Malang','Jl. Raya Tlogomas  No. 246 Malang','Fakultas Teknik','','Strata 1','S1','Teknik Informatika','Malang','Sdr','085765088565',3.61,NULL),('9330b0ab-e46d-11e6-ae8e-001b21ac8089',NULL,'9327e4d3-e46d-11e6-ae8e-001b21ac8089','201310370311249','Damar Arya Pradhipta M','Universitas Muhammadiyah Malang','Jl. Raya Tlogomas  No. 246 Malang','Fakultas Teknik','','Strata 1','S1','Teknik Informatika','Malang','Sdr','081357133688',2.17,NULL),('933146a5-e46d-11e6-ae8e-001b21ac8089',NULL,'9327e4d3-e46d-11e6-ae8e-001b21ac8089','201310370311250','Damar Arya Pradhipta M Frendy Ardiansyah','Universitas Muhammadiyah Malang','Jl. Raya Tlogomas  No. 246 Malang','Fakultas Teknik','','Strata 1','S1','Teknik Informatika','Malang','Sdr','081357325323',2.25,NULL),('96',NULL,'70','041311133125','Senatriya Wahyu Raadhan','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','senatrya9295@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdr','085746518529',3.03,NULL),('97',NULL,'71','081311633024','Dwi Indah Cahyani','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','dwiindah922@gmail.com','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','081935099906',2.84,NULL),('98',NULL,'71','081311633008','Evy Dwi Cahyati','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','evydwicahyati@gmail.com','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','085733187342',3.44,NULL),('99',NULL,'71','081311633019','Lydia Wijaya','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','lydia.wijaya-13@fst.unair.ac.id','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','081248466028',3.2,NULL),('9f7755ab-e469-11e6-ae8e-001b21ac8089',NULL,'9f7539ce-e469-11e6-ae8e-001b21ac8089','041311233076','Shabrina Alhabsyi','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','shabrinaalhabsyi@gmail.com','Strata 1','S1','Manajemen','Surabaya','Sdri','082231024598',3.73,NULL),('9f792709-e469-11e6-ae8e-001b21ac8089',NULL,'9f7539ce-e469-11e6-ae8e-001b21ac8089','041311233078','Karina Smaratantri','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','ksmaratantri@gmail.com','Strata 1','S1','Manajemen','Surabaya','Sdri','08131660698',3.12,NULL),('9f7b28df-e469-11e6-ae8e-001b21ac8089',NULL,'9f7539ce-e469-11e6-ae8e-001b21ac8089','041311233078 041311233142','Aristo Ilham Wiratama','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','aristoiwiratama@gmail.com','Strata 1','S1','Manajemen','Surabaya','Sdr','085257349292',3.48,NULL),('b5d7bb48-e465-11e6-ae8e-001b21ac8089',NULL,'b5d3d9d5-e465-11e6-ae8e-001b21ac8089','151410613089','Hania Rizkieta Hazah','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','haniarizkietahazah@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','085668800362',3.6,NULL),('b5da3b2c-e465-11e6-ae8e-001b21ac8089',NULL,'b5d3d9d5-e465-11e6-ae8e-001b21ac8089','151410613116','Ratnasari Wulan Febri','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','ratnasariwfebri@yahoo.co.id','Diploma III','D3','Akuntansi','Surabaya','Sdri','089673671098',3.3,NULL),('b7ec673e-e438-11e6-ae8e-001b21ac8089',NULL,'b7eaaac6-e438-11e6-ae8e-001b21ac8089','151410613049','Enggar Afni Nindia','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','enggarafni26@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','0896513339859',0,NULL),('c0a3c3cb-e46b-11e6-ae8e-001b21ac8089',NULL,'c09fb34e-e46b-11e6-ae8e-001b21ac8089','11403020','Evelyn Putri Tanujaya','Swiss German University','BSD City','Faculty of International Business Adminstration','tanujaya.evelyn@gmail.com','Strata 1','S1','Banking and Finance Program','Tangerang','Sdri','082111547552',3.79,NULL),('c3cbd619-e46c-11e6-ae8e-001b21ac8089',NULL,'c3c8902a-e46c-11e6-ae8e-001b21ac8089','140231100036','Nur Faina','Universitas Trunojoyo Madura','Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ekonomi dan Bisnis','inafaina07@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Madura','Sdri','082332297156',0,NULL),('c3ce0c43-e46c-11e6-ae8e-001b21ac8089',NULL,'c3c8902a-e46c-11e6-ae8e-001b21ac8089','140231100039','Maufirotul Jannah','Universitas Trunojoyo Madura','Jl.  Raya Telang PO.BOX 02 Kamal, Bangkalan, 69162','Fakultas Ekonomi dan Bisnis','maufirotul_j@yahoo.co.id','Strata 1','S1','Ekonomi Pembangunan','Madura','Sdri','083852424252',0,NULL),('c61baaa4-e43e-11e6-ae8e-001b21ac8089',NULL,'c617aaef-e43e-11e6-ae8e-001b21ac8089','041311333282','Dea Puspa Arum','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','dea.puspa1503@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','089679532533',3.29,NULL),('c61ed88b-e43e-11e6-ae8e-001b21ac8089',NULL,'c617aaef-e43e-11e6-ae8e-001b21ac8089','041311333312','Dwi Prasetyawati B. P','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','Dwiprasetya2711@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','081937267260',3.06,NULL),('c6228a57-e43e-11e6-ae8e-001b21ac8089',NULL,'c617aaef-e43e-11e6-ae8e-001b21ac8089','041311333349','Adelia Farah Dibah','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','adeliafarahdibah@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','082234446474',3.34,NULL),('e77761f8-e46a-11e6-ae8e-001b21ac8089',NULL,'e74a8f75-e46a-11e6-ae8e-001b21ac8089','081411631026','Livia Felisia Marentina','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','085731359039',3.5,NULL),('e777e684-e46a-11e6-ae8e-001b21ac8089',NULL,'e74a8f75-e46a-11e6-ae8e-001b21ac8089','081411631045','Sonya Agnesia Simanjuntak ','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','081938080509',3.35,NULL),('e77c26ec-e46a-11e6-ae8e-001b21ac8089',NULL,'e74a8f75-e46a-11e6-ae8e-001b21ac8089','081411631050','Halimatuz Zuhriyah','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','085748671813',3.74,NULL),('e77cc6bc-e46a-11e6-ae8e-001b21ac8089',NULL,'e74a8f75-e46a-11e6-ae8e-001b21ac8089','081411633001','Rizqi Akbar Romdloni','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','085854458088',3.57,NULL),('e77f18d1-e46a-11e6-ae8e-001b21ac8089',NULL,'e74a8f75-e46a-11e6-ae8e-001b21ac8089','081411631036','Alfeira Nur Aisyah','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','082332414209',3.35,NULL),('efb4f3ef-e46e-11e6-ae8e-001b21ac8089',NULL,'efb08d3f-e46e-11e6-ae8e-001b21ac8089','081411631010','Andhini Dita Putri','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','',3.31,NULL),('efb61c14-e46e-11e6-ae8e-001b21ac8089',NULL,'efb08d3f-e46e-11e6-ae8e-001b21ac8089','081411631014','Ramadhan Akira R.','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdr','',2.95,NULL),('efbaf658-e46e-11e6-ae8e-001b21ac8089',NULL,'efb08d3f-e46e-11e6-ae8e-001b21ac8089','081411631027','Elzha Odie Syahputra','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdr','',3.05,NULL),('efbbbd3a-e46e-11e6-ae8e-001b21ac8089',NULL,'efb08d3f-e46e-11e6-ae8e-001b21ac8089','081411631040','Dhania Ulfa Aghniarahmah','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','',3.36,NULL),('efbe43e2-e46e-11e6-ae8e-001b21ac8089',NULL,'efb08d3f-e46e-11e6-ae8e-001b21ac8089','081411631047','Lanang Alun Nugraga','Universitas Airlangga','Kampus C Jl.  Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','','Strata 1','S1','Sistem Informasi','Surabaya','Sdri','',3.47,NULL),('f042a981-e461-11e6-ae8e-001b21ac8089',NULL,'f036f03d-e461-11e6-ae8e-001b21ac8089','1741143241','Muhtar Rifai','IAIN Tulungagung','Jl. Mayor Sujadi Timur 46','Fakultas Ekonomi dan Bisnis Islam','brawijaya17@yahoo.com','Strata 1','S1','Perbankan Syariah','Tulungagung','Sdr','08563657373',3.75,NULL),('fad1d8e9-e444-11e6-ae8e-001b21ac8089',NULL,'facda482-e444-11e6-ae8e-001b21ac8089','13080694047','Lusy Rosa Lestari','Universitas Negeri Surabaya','Kampus Ketintang, Jalan Ketintang, Surabaya 60231','Fakultas Ekonomi','lusyrisa8@gmail.com','Strata 1','S1','Akuntansi','Surabaya','Sdri','085748937754',0,NULL),('fb11f4e9-e443-11e6-ae8e-001b21ac8089',NULL,'fad1db6a-e443-11e6-ae8e-001b21ac8089','071411633014','Nur Suci Ramadhani','Universitas Airlangga','Kampus B Dharmawangsa Dalam Surabaya, 60286','Fakultas Ilmu Sosial dan Politik','nursuciramadhani200@gmail.com','Strata 1','S1','Ilmu Informasi dan Perpustakaan','Surabaya','Sdri','083856921160',3.16,NULL),('fb12aa56-e443-11e6-ae8e-001b21ac8089',NULL,'fad1db6a-e443-11e6-ae8e-001b21ac8089','071411633031','Putri Rahayu','Universitas Airlangga','Kampus B Dharmawangsa Dalam Surabaya, 60286','Fakultas Ilmu Sosial dan Politik','putrierahayu65@gmail.com','Strata 1','S1','Ilmu Informasi dan Perpustakaan','Surabaya','Sdri','083831839503',2.99,NULL);
/*!40000 ALTER TABLE `pelamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelamaran`
--

DROP TABLE IF EXISTS `pelamaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelamaran` (
  `id_pelamaran` varchar(200) NOT NULL,
  `nosurat_pelamaran` varchar(255) DEFAULT NULL,
  `tgl_pelamaran` date DEFAULT NULL,
  `tgl_mulai_permintaan` date DEFAULT NULL,
  `tgl_selesai_permintaan` date DEFAULT NULL,
  `ldp` date DEFAULT NULL,
  `alamat_pelamar` varchar(1024) NOT NULL,
  `jurusan_pelamar` varchar(1024) NOT NULL,
  `kota_pelamar` varchar(1024) NOT NULL,
  `tingkat_pelamar` varchar(1024) NOT NULL,
  `tingkat_pelamar_pendek` varchar(1024) NOT NULL,
  `universitas_pelamar` varchar(1024) NOT NULL,
  `keterangan_pelamaran` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_pelamaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelamaran`
--

LOCK TABLES `pelamaran` WRITE;
/*!40000 ALTER TABLE `pelamaran` DISABLE KEYS */;
REPLACE INTO `pelamaran` VALUES ('0b7327b3-e46e-11e6-ae8e-001b21ac8089','6051/UN7.3.8.1/PP/2016','2016-10-27','2017-01-09','2017-02-09','2017-10-31','','','','','','',''),('0db37d66-e471-11e6-ae8e-001b21ac8089','dsfds','2017-02-23','2017-01-24','2017-01-31','2017-01-26','','','','','','',''),('0f63ddf7-e465-11e6-ae8e-001b21ac8089','1637/UN46.1.12/LT/2016','2016-10-07','2017-01-09','2017-02-22','2016-10-13','','','','','','','ada tulisan \"januari yang tidak terpilih\"\r\n'),('21ce98ed-e467-11e6-ae8e-001b21ac8089','429/UN46.1.12/LT/2016','2016-02-29','2017-01-16','2017-02-24','2016-04-01','','','','','','','ada tulisan \"januari yang tidak terpilih\"\r\n'),('238b3cd1-e436-11e6-ae8e-001b21ac8089','469/UN.3.1.4/PP/Akd/2016','2016-12-16','2017-01-01','2017-01-31','2017-01-06','','','','','','','Sekitar Bulan Januari'),('28843249-e440-11e6-ae8e-001b21ac8089','6236/UN3.1.8/PPd/2016','2016-10-21','2017-02-01','2017-02-28','2016-11-08','','','','','','',''),('29df42ab-e443-11e6-ae8e-001b21ac8089','6076/UN3.1.8/PPd/2016','2016-10-13','2017-02-01','2017-02-28','2016-10-27','','','','','','',''),('3488b425-e446-11e6-ae8e-001b21ac8089','5030/Pg.30004/04/16','2016-04-30','2016-08-01','2016-08-31','0000-00-00','','','','','','',''),('3bfbd089-e46c-11e6-ae8e-001b21ac8089','2281/UN46.1.12/LT/2016','2016-12-02','2017-01-09','2017-02-09','2016-12-05','','','','','','',''),('3eefe78c-e464-11e6-ae8e-001b21ac8089','6866/UN3.1.3/PPd/2016','2016-11-29','2017-01-16','2017-02-10','2016-12-06','','','','','','','ada tulisan \"januari yang tidak terpilih\"'),('3efbf490-e434-11e6-ae8e-001b21ac8089','486b/I1.C01.5.1/DN.2/2016','2016-11-14','2017-05-01','2017-06-01','2017-01-03','','','','','','','1 bulan dari bulan Mei 2017'),('416a4faf-e463-11e6-ae8e-001b21ac8089','3656/UN3.1.14/PPd/2016','2016-11-18','2017-01-16','2017-02-11','2016-12-06','','','','','','',''),('534a8d1c-e37e-11e6-9eb7-73649cdf8c21','222','2017-01-24','2017-01-24','2017-01-31','2017-01-30','','','','','','',NULL),('58966316-e43b-11e6-ae8e-001b21ac8089','464/UN3.1.4/PP/Akd/2016','2016-12-21','2017-02-01','2017-03-31','2017-01-03','','','','','','','Permintaan magang bulan Februari-Maret 2017'),('5b804a36-e431-11e6-ae8e-001b21ac8089','2574.1/UN46.1.13/AK/2016','2016-11-07','0000-00-00','0000-00-00','2016-12-07','','','','','','','Magang di Museum Bank Indonesia selama satu bulan'),('63d2e9f9-e466-11e6-ae8e-001b21ac8089','6050/UN7.3.8.1/PP/2016','2016-10-27','2017-01-09','2017-02-09','2016-10-31','','','','','','','ada tulisan \"januari yang tidak terpilih\"\r\n'),('6a12de0c-e43c-11e6-ae8e-001b21ac8089','416/UN3.1.4/PP/Akd/2016','2016-10-27','2017-02-01','2017-02-28','2016-11-15','','','','','','','Pelaksanaan magang selama bulan Februari 2017'),('70','453/UN3.1.4/PP/Akd/2016','2016-12-07','2017-03-21','2017-04-22','2017-01-18','','','','','','',NULL),('71','205/UN3.1.8/KM/2016','2017-01-11','2017-01-01','2017-02-28','2017-01-18','','','','','','',NULL),('72','11/22/33/44','2017-01-04','2017-01-01','2017-01-23','2017-01-19','','','','','','',NULL),('73','439/UN3.1.4/PP/Akd/2016','2016-11-30','2017-03-21','2017-04-22','2017-01-18','','','','','','',NULL),('74','4066/UN3.1.14/PPd/2016','2016-12-23','2017-02-20','2017-03-03','2017-01-10','','','','','','',NULL),('75','469/UN3.1.4/PP/Akd/2016','2016-12-16','2017-01-01','2017-01-31','2017-01-06','','','','','','',NULL),('76','B/770/UN.63/I/2017','2017-01-05','2017-02-01','2017-02-28','2017-01-06','','','','','','',NULL),('77','1376/UN27.05.7.1/DP/2016','2016-11-09','2017-02-15','2017-12-31','2016-12-21','','','','','','',NULL),('78','11/11/11','0000-00-00','0000-00-00','0000-00-00','0000-00-00','','','','','','',NULL),('79','01/01/BXC/2017','2017-01-11','2017-01-25','2017-02-28','2017-01-24','','','','','','',NULL),('8a4781a7-e442-11e6-ae8e-001b21ac8089','6683/UN3.1.8/PPd/2016','2016-11-10','2017-02-01','2017-02-28','2016-11-15','','','','','','',''),('926c4054-e43a-11e6-ae8e-001b21ac8089','4540/UN/7/3/2/PP/TH 2016','2016-12-09','2017-02-06','0000-00-00','2016-12-27','','','','','','','Mulai 6 Februari 2017, lama kerja ditentukan oleh pihak Bank Indonesia'),('92c0a3d1-e441-11e6-ae8e-001b21ac8089','3651/UN3.1.14/PPd/2016','2016-11-11','0000-00-00','0000-00-00','2016-11-29','','','','','','','Tanggal magang tidak di sebutkan dalam surat'),('9327e4d3-e46d-11e6-ae8e-001b21ac8089','E.6.k/292/FT-InF/UMM/IX/2016','2016-09-01','2017-01-19','2017-02-15','2016-09-08','','','','','','',''),('9f7539ce-e469-11e6-ae8e-001b21ac8089','414/UN3.1.4/PP/Akd/2016','2016-10-27','2017-01-16','2017-02-05','2016-11-28','','','','','','',''),('b5d3d9d5-e465-11e6-ae8e-001b21ac8089','2716/UN3.1.14/PPd/2016','2016-09-07','2017-01-16','2017-02-16','2016-09-27','','','','','','','ada tulisan \"januari yang tidak terpilih\"\r\n'),('b7eaaac6-e438-11e6-ae8e-001b21ac8089','1067/UN3.1.1.14/PPd/2016','2016-12-23','2017-01-16','2017-02-28','2017-01-03','','','','','','','PKL 1 bulan'),('c09fb34e-e46b-11e6-ae8e-001b21ac8089','I/INT/3787/IX/2016','2016-10-03','2017-02-01','2017-08-01','2016-10-07','','','','','','','The internship period will start from February 2017 for six month (at least 4 month).'),('c3c8902a-e46c-11e6-ae8e-001b21ac8089','1356/UN46.1.12/LT/2016','2016-09-01','2017-01-16','2017-02-16','2016-09-05','','','','','','',''),('c617aaef-e43e-11e6-ae8e-001b21ac8089','371/UN3.1.4/PP/Akd/2016','2016-09-01','2017-02-01','2017-02-28','2016-10-14','','','','','','','Permintaan magang di Unit Kliring, pelaksanaan dalam waktu 3 minggu'),('d19cd03c-e37c-11e6-9eb7-73649cdf8c21','432432','2017-01-18','2017-01-31','2017-02-28','2017-01-31','','','','','','',NULL),('d5df248a-e42c-11e6-ae8e-001b21ac8089','32123','2017-01-24','2017-01-31','2017-01-31','2017-01-30','','','','','','',NULL),('e74a8f75-e46a-11e6-ae8e-001b21ac8089','6885/UN3.1.8/PPd/2016','2016-11-21','2017-01-23','2017-02-10','2016-11-23','','','','','','',''),('efb08d3f-e46e-11e6-ae8e-001b21ac8089','6830/UN3.1.8/KM/2016','2016-11-17','2017-01-23','2017-02-10','2016-12-01','','','','','','',''),('f036f03d-e461-11e6-ae8e-001b21ac8089','B-665/In.12/F.IV/PP.00.9/09/2016','2016-09-13','2017-01-02','2017-02-10','2016-12-05','','','','','','','yang bersangkutan tidak dapat dihubungi'),('facda482-e444-11e6-ae8e-001b21ac8089','010688/UN38.7.5/PP/2016','2016-11-21','2016-12-01','2017-04-30','2016-11-29','','','','','','','permintaan analisis pengaruh keterbukaan informasi dan kerahasiaan bank terhadap kesuksesan tax amnesty'),('fad1db6a-e443-11e6-ae8e-001b21ac8089','5093/UN3.1.7/PPd/2016','2016-12-22','2017-01-17','2017-02-17','2016-12-27','','','','','','','permintaan magang selama 1 bulan terhitung sejak tanggal 17 januari 2017');
/*!40000 ALTER TABLE `pelamaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penempatan`
--

DROP TABLE IF EXISTS `penempatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penempatan` (
  `id_tempat` varchar(200) NOT NULL,
  `nama_tempat` varchar(1024) DEFAULT NULL,
  `nama_panjang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tempat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penempatan`
--

LOCK TABLES `penempatan` WRITE;
/*!40000 ALTER TABLE `penempatan` DISABLE KEYS */;
REPLACE INTO `penempatan` VALUES ('082877ee-e475-11e6-ae8e-001b21ac8089','Tim Pengawasan SP PUR, KI, dan Operasional SP','Tim Pengawasan SP PUR, KI, dan Operasional SP'),('1','FKKK','Fungsi Koordinasi dan Komunikasi Kebijakan'),('10','STAT','Fungsi Data dan Statistik Ekonomi dan Keuangan'),('11','UMKM','Fungsi Pelaksanaan Pengembangan UMKM'),('3c66bf94-e475-11e6-ae8e-001b21ac8089','FPPSP PUR','Fungsi Perizinan dan Pengawasan SP PUR'),('46e2c95c-e474-11e6-ae8e-001b21ac8089','DAEK','Divisi Advisory Ekonomi dan Keuangan'),('4f101952-e475-11e6-ae8e-001b21ac8089','FKIP','Fungsi Keuangan Inklusif dan Perlindungan'),('540fb868-e474-11e6-ae8e-001b21ac8089',' 	Grup Advisory dan Pengembangan Ekonomi','Grup Advisory dan Pengembangan Ekonomi'),('636dfd86-e475-11e6-ae8e-001b21ac8089','FLAK','Fungsi Logistik, Anggaran, dan Kesekretariatan'),('6c969c76-e475-11e6-ae8e-001b21ac8089','FSDM','Fungsi SDM'),('7','DPE','Divisi Pengembangan Ekonomi'),('8527a0e8-e475-11e6-ae8e-001b21ac8089','FPP','Fungsi Protokol dan Pengamanan'),('8fb6c0ce-e474-11e6-ae8e-001b21ac8089','DSPPUR','Divisi Sistem Pembayaran Pengelolaan Uang Rupiah'),('b026b356-e474-11e6-ae8e-001b21ac8089','TPUR','Tim Pengelolaan Uang Rupiah'),('b4933889-e475-11e6-ae8e-001b21ac8089','Asesmen','Fungsi Asesmen Ekonomi dan Surveillance'),('c4abff5f-e474-11e6-ae8e-001b21ac8089','DU','Unit Distribusi Uang'),('d6be9b00-e474-11e6-ae8e-001b21ac8089','LAK','Unit Layanan dan Adminstrasi Kas'),('e695220e-e474-11e6-ae8e-001b21ac8089','PU','Unit Pengelolaan Uang');
/*!40000 ALTER TABLE `penempatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surat`
--

DROP TABLE IF EXISTS `surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surat` (
  `id_surat` varchar(200) NOT NULL,
  `id_jenis_surat` varchar(200) NOT NULL,
  `tgl_buat` date DEFAULT NULL,
  `no_surat` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_surat`),
  KEY `fk_berjenis` (`id_jenis_surat`),
  CONSTRAINT `fk_berjenis` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id_jenis_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surat`
--

LOCK TABLES `surat` WRITE;
/*!40000 ALTER TABLE `surat` DISABLE KEYS */;
/*!40000 ALTER TABLE `surat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(200) NOT NULL,
  `id_magang` varchar(200) DEFAULT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `username` varchar(1024) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `remember_token` varchar(1024) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_memiliki` (`id_magang`),
  KEY `fk_punya` (`nip`),
  CONSTRAINT `fk_memiliki` FOREIGN KEY (`id_magang`) REFERENCES `magang` (`id_magang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_punya` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` VALUES ('133',NULL,'14832','Wihujeng Ayu Rengganis','14832',NULL,'$2y$10$.fN.UmUjNWMgm55InA1lneSLCGiFM/xIl6byvJAPaYZyWn6BWklP.',NULL,'2017-01-23 04:40:25','2017-01-23 04:40:25'),('2739a01c-e380-11e6-9eb7-73649cdf8c21',NULL,NULL,'Hilman','hlmn','hlmn.hg@gmail.com','$2y$10$Y3K7DjCsgDPV/tjP5bBI7eJ9zI3YSZ5cOLsKSsyBB2Th8ZesHNc4.','O5MZBhWh2FhL7uX8lq4F0juUWchNPPIkVJicBfxslKT2cGU6wZQao8c2dIJf','2017-01-22 08:44:59','2017-01-27 09:49:00'),('f49c2699-e473-11e6-ae8e-001b21ac8089',NULL,NULL,'admin','admin',NULL,'$2y$10$5w/C8tAKYScIRXwz6EGA7OAWS3weRnP9fiackFBr.mBxD/hKB/EXC',NULL,'2017-01-27 09:35:37','2017-01-27 09:35:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-27 16:49:15
