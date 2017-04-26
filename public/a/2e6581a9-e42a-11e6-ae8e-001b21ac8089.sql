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
  CONSTRAINT `fk_diterima2` FOREIGN KEY (`id_pelamar`) REFERENCES `pelamar` (`id_pelamar`) ON DELETE SET NULL,
  CONSTRAINT `fk_memiliki2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magang`
--

LOCK TABLES `magang` WRITE;
/*!40000 ALTER TABLE `magang` DISABLE KEYS */;
REPLACE INTO `magang` VALUES ('0621c238-e380-11e6-9eb7-73649cdf8c21','062f4d90-e380-11e6-9eb7-73649cdf8c21','534b4892-e37e-11e6-9eb7-73649cdf8c21','1','2017-01-26','2017-01-31',NULL,'2017-01-26'),('80','134','114','1','2017-01-04','2017-01-26',NULL,NULL),('81','135','115','7','2017-01-04','2017-01-26',NULL,NULL),('82','136','117','1','2017-01-01','2017-01-20',NULL,'2017-01-25');
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
REPLACE INTO `pelamar` VALUES ('100',NULL,'71','081311633025','Susmiandri','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','susmuandri27@gmail.com','Diploma I','D1','Sistem Informasi','Surabaya','Sdri','083856953697',3.3,NULL),('105',NULL,'73','041311133116','Muchammad Zuhad','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','muchamadzuhad@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdr','085806138198',3.27,NULL),('106',NULL,'73','041311133023','Kurniawan Dwi Yulianto','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','kurniawandy@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdr','085731625966',3.75,NULL),('107',NULL,'74','151410613089','Hania Rizkieta Hazah','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','haniarizkietahazah@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','085668800362',3.6,NULL),('108',NULL,'74','151410613101','Nadia Vita Melinda','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','nadiavita292@yahoo.co.id','Diploma III','D3','Akuntansi','Surabaya','Sdri','082234311360',3.28,NULL),('109',NULL,'74','151410613110','Yayang Rizki Toria N','Universitas Airlangga','Kampus B Jl. Srikana65 Surabaya 60286','Fakultas Vokasi','torianugrahani@gmail.com','Diploma III','D3','Akuntansi','Surabaya','Sdri','085790504060',3.19,NULL),('110',NULL,'75','041311133148','Kholidia Nur Solikha','Universitas Airlangga','Kampus B Jl Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdri','085736845096',3.19,NULL),('111',NULL,'75','041311133082','Deviani Henindar','Universitas Airlangga','Kampus B Jl Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdri','082231022542',3.08,NULL),('112',NULL,'76','1312115029','Laurensius Ezra B M','Universitas Pembangunan Nasional \"Veteran\" Jawa Timur','Jl. Raya Rungkut Madya Gunung Anyar Surabaya 60294','Fakultas Ekonomi dan Bisnis','laurenzeus@gmail.com','Strata 1','S1','Manajemen','Surabaya','Sdr','085850336863',0,NULL),('113',NULL,'77','D1614088','Rena Laila Wuri','Universitas Sebelas Maret ','Jl. Ir. Sutami No. 36 A, Jebres, Surakarta 57126','Fakultas Ilmu Sosial dan Politik','renalaila@gmail.com','Diploma III','D3','Komunikasi Terapan','Surakarta','Sdri','082137991350',3.57,NULL),('114','80','78','1233','CONTON 1','','','f','','Diploma I','D1','t','SURABAYA','Sdri','',0,1),('115','81','78','3333','CONTOH 2','','','f','','Diploma I','D1','t','SURABAYA','Sdr','',0,1),('116',NULL,'79','3213','TEST','Universitas Airlangga','Kampus B Jl Airlangga 4 Surabaya 60286','Fakultas Ilmu Sosial dan Politik','test1@gmail.com','Strata 1','S1','Manajemen','Surabaya','Sdr','08561350152',3.5,2),('117','82','79','3223','test2','Universitas Airlangga','Kampus B Jl Airlangga 4 Surabaya 60286','Fakultas Ilmu Sosial dan Politik','test2@gmail.com','Strata 1','S1','Manajemen','Surabaya','Sdr','84932980430',3.5,1),('534b4892-e37e-11e6-9eb7-73649cdf8c21','0621c238-e380-11e6-9eb7-73649cdf8c21','534a8d1c-e37e-11e6-9eb7-73649cdf8c21','fdsfds','dsfds','dfdsfds','fdsfdsfds','fdsfdsfds','dsfdsf','Strata 1','S1','dsffdsfds','surbaya','Sdr','fdsfdsf',0,1),('96',NULL,'70','041311133125','Senatriya Wahyu Raadhan','Universitas Airlangga','Kampus B Jl. Airlangga 4 Surabaya 60286','Fakultas Ekonomi dan Bisnis','senatrya9295@gmail.com','Strata 1','S1','Ekonomi Pembangunan','Surabaya','Sdr','085746518529',3.03,NULL),('97',NULL,'71','081311633024','Dwi Indah Cahyani','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','dwiindah922@gmail.com','Diploma I','D1','Sistem Informasi','Surabaya','Sdri','081935099906',2.84,NULL),('98',NULL,'71','081311633008','Evy Dwi Cahyati','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','evydwicahyati@gmail.com','Diploma I','D1','Sistem Informasi','Surabaya','Sdri','085733187342',3.44,NULL),('99',NULL,'71','081311633019','Lydia Wijaya','Universitas Airlangga','Kampus C Mulyorejo Surabaya, 60115','Fakultas Sains dan Teknologi','lydia.wijaya-13@fst.unair.ac.id','Diploma I','D1','Sistem Informasi','Surabaya','Sdri','081248466028',3.2,NULL);
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
  PRIMARY KEY (`id_pelamaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelamaran`
--

LOCK TABLES `pelamaran` WRITE;
/*!40000 ALTER TABLE `pelamaran` DISABLE KEYS */;
REPLACE INTO `pelamaran` VALUES ('','432432','2017-01-18','2017-01-31','2017-02-28','2017-01-31','','','','','',''),('534a8d1c-e37e-11e6-9eb7-73649cdf8c21','222','2017-01-24','2017-01-24','2017-01-31','2017-01-30','','','','','',''),('70','453/UN3.1.4/PP/Akd/2016','2016-12-07','2017-03-21','2017-04-22','2017-01-18','','','','','',''),('71','205/UN3.1.8/KM/2016','2017-01-11','2017-01-01','2017-02-28','2017-01-18','','','','','',''),('72','11/22/33/44','2017-01-04','2017-01-01','2017-01-23','2017-01-19','','','','','',''),('73','439/UN3.1.4/PP/Akd/2016','2016-11-30','2017-03-21','2017-04-22','2017-01-18','','','','','',''),('74','4066/UN3.1.14/PPd/2016','2016-12-23','2017-02-20','2017-03-03','2017-01-10','','','','','',''),('75','469/UN3.1.4/PP/Akd/2016','2016-12-16','2017-01-01','2017-01-31','2017-01-06','','','','','',''),('76','B/770/UN.63/I/2017','2017-01-05','2017-02-01','2017-02-28','2017-01-06','','','','','',''),('77','1376/UN27.05.7.1/DP/2016','2016-11-09','2017-02-15','2017-12-31','2016-12-21','','','','','',''),('78','11/11/11','0000-00-00','0000-00-00','0000-00-00','0000-00-00','','','','','',''),('79','01/01/BXC/2017','2017-01-11','2017-01-25','2017-02-28','2017-01-24','','','','','',''),('d19cd03c-e37c-11e6-9eb7-73649cdf8c21','432432','2017-01-18','2017-01-31','2017-02-28','2017-01-31','','','','','','');
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
REPLACE INTO `penempatan` VALUES ('1','FKKK','Fungsi Koordinasi dan Komunikasi Kebijakan'),('10','STAT','Fungsi Data dan Statistik Ekonomi dan Keuangan'),('11','UMKM','Fungsi Pelaksanaan Pengembangan UMKM'),('7','DPE','Divisi Pengembangan Ekonomi');
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
REPLACE INTO `users` VALUES ('062f4d90-e380-11e6-9eb7-73649cdf8c21','0621c238-e380-11e6-9eb7-73649cdf8c21',NULL,'dsfds','fdsfds','dsfdsf','$2y$10$eNJkMJiLnPsy1AMQcYrnk.uYoWJC5e/1eMfj6QisTFAF01qJOzUse',NULL,'2017-01-26 04:29:28','2017-01-26 04:29:28'),('133',NULL,'14832','Wihujeng Ayu Rengganis','14832',NULL,'$2y$10$.fN.UmUjNWMgm55InA1lneSLCGiFM/xIl6byvJAPaYZyWn6BWklP.',NULL,'2017-01-23 04:40:25','2017-01-23 04:40:25'),('134','80',NULL,'CONTON 1','1233','','$2y$10$n4IQOCd75.5fNMZ2UIVxUelZmo1z3cPoGTMauwdRo/CFyjGjq6Rfa',NULL,'2017-01-23 06:27:57','2017-01-23 06:27:57'),('135','81',NULL,'CONTOH 2','3333','','$2y$10$pIvMk.YsftPoN24w/5xjBO7H3y7akKGLkCsMDVUcPoniXcPe2FoS2',NULL,'2017-01-23 06:27:57','2017-01-23 06:27:57'),('136','82',NULL,'test2','3223','test2@gmail.com','$2y$10$QTNxy.e3MsGjnhXhJn7s0OY9DNeAu.B.dBrxxQLzdBxiyZ4IljLga',NULL,'2017-01-25 10:35:03','2017-01-25 10:35:03'),('2739a01c-e380-11e6-9eb7-73649cdf8c21',NULL,NULL,'Hilman','hlmn','hlmn.hg@gmail.com','$2y$10$Y3K7DjCsgDPV/tjP5bBI7eJ9zI3YSZ5cOLsKSsyBB2Th8ZesHNc4.','FgOlDErQVDHYYajtYGZeEPmk9zHgxQNLVuwRmY2PaDNUQCv4BmOGTCeAzTgl','2017-01-22 08:44:59','2017-01-27 00:43:10');
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

-- Dump completed on 2017-01-27  7:47:31
