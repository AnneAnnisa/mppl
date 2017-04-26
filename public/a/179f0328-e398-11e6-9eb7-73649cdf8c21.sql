-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 26, 2017 at 05:52 AM
-- Server version: 5.6.33
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `magangbibaru`
--

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
('1', 'Analis'),
('2', 'Analis Senior');

--
-- Dumping data for table `magang`
--

INSERT INTO `magang` (`id_magang`, `id`, `id_pelamar`, `id_tempat`, `tanggal_terima`, `tanggal_selesai`, `nilai`, `tgl_konfirmasi_magang`) VALUES
('0621c238-e380-11e6-9eb7-73649cdf8c21', '062f4d90-e380-11e6-9eb7-73649cdf8c21', '534b4892-e37e-11e6-9eb7-73649cdf8c21', '1', '2017-01-26', '2017-01-31', NULL, '2017-01-26'),
('80', '134', '114', '1', '2017-01-04', '2017-01-26', NULL, NULL),
('81', '135', '115', '7', '2017-01-04', '2017-01-26', NULL, NULL),
('82', '136', '117', '1', '2017-01-01', '2017-01-20', NULL, '2017-01-25');

--
-- Dumping data for table `pangkat`
--

INSERT INTO `pangkat` (`id_pangkat`, `nama_pangkat`) VALUES
('1', 'Manager'),
('2', 'Kepala Divisi');

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama_pegawai`, `id_pangkat`, `id_jabatan`, `id`, `divisi`) VALUES
('123', 'ayam', '2', '2', NULL, NULL),
('1232321', 'hilman', '1', '1', NULL, '1'),
('1234', 'baruuu', '1', '1', NULL, '1'),
('14832', 'Wihujeng Ayu Rengganis', '1', '1', '133', '1'),
('4536', 'dfsdf', '2', '1', NULL, NULL),
('47873985', 'anne', '1', '1', NULL, '1'),
('51141000', 'anne annisaa', '2', '2', NULL, NULL),
('7555', 'ddddif', '1', '1', NULL, '1'),
('dsdsdsds', 'dsds', '1', '1', 'fdd97f66-e380-11e6-9eb7-73649cdf8c21', '1');

--
-- Dumping data for table `pelamar`
--

INSERT INTO `pelamar` (`id_pelamar`, `id_magang`, `id_pelamaran`, `nim_pelamar`, `nama_pelamar`, `universitas_pelamar`, `alamat_pelamar`, `fakultas_pelamar`, `email_pelamar`, `tingkat_pelamar`, `tingkat_pelamar_pendek`, `jurusan_pelamar`, `kota_pelamar`, `title_pelamar`, `no_telp_pelamar`, `ipk_pelamar`, `status`) VALUES
('100', NULL, '71', '081311633025', 'Susmiandri', 'Universitas Airlangga', 'Kampus C Mulyorejo Surabaya, 60115', 'Fakultas Sains dan Teknologi', 'susmuandri27@gmail.com', 'Diploma I', 'D1', 'Sistem Informasi', 'Surabaya', 'Sdri', '083856953697', 3.3, NULL),
('101', NULL, '72', '1234', 'aaaa', 'Universitas Airlangga', 'JALAN', 'Fakultas Ekonomi dan Bisnis', 'a@a.a', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdr', '1234', 1, 2),
('102', NULL, '72', '5678', 'bbbb', 'Universitas Airlangga', 'JALAN', 'Fakultas Ekonomi dan Bisnis', 'b@b.b', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdri', '5678', 3, 2),
('103', NULL, '72', '1111', 'cccc', 'Universitas Airlangga', 'JALAN', 'Fakultas Ekonomi dan Bisnis', 'b@b.b', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdr', '1111', 2.88, 2),
('104', NULL, '72', '2222', 'dddd', 'Universitas Airlangga', 'JALAN', 'Fakultas Ekonomi dan Bisnis', 'b@b.b', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdri', '2222', 3.009, 2),
('105', NULL, '73', '041311133116', 'Muchammad Zuhad', 'Universitas Airlangga', 'Kampus B Jl. Airlangga 4 Surabaya 60286', 'Fakultas Ekonomi dan Bisnis', 'muchamadzuhad@gmail.com', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdr', '085806138198', 3.27, NULL),
('106', NULL, '73', '041311133023', 'Kurniawan Dwi Yulianto', 'Universitas Airlangga', 'Kampus B Jl. Airlangga 4 Surabaya 60286', 'Fakultas Ekonomi dan Bisnis', 'kurniawandy@gmail.com', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdr', '085731625966', 3.75, NULL),
('107', NULL, '74', '151410613089', 'Hania Rizkieta Hazah', 'Universitas Airlangga', 'Kampus B Jl. Srikana65 Surabaya 60286', 'Fakultas Vokasi', 'haniarizkietahazah@gmail.com', 'Diploma III', 'D3', 'Akuntansi', 'Surabaya', 'Sdri', '085668800362', 3.6, NULL),
('108', NULL, '74', '151410613101', 'Nadia Vita Melinda', 'Universitas Airlangga', 'Kampus B Jl. Srikana65 Surabaya 60286', 'Fakultas Vokasi', 'nadiavita292@yahoo.co.id', 'Diploma III', 'D3', 'Akuntansi', 'Surabaya', 'Sdri', '082234311360', 3.28, NULL),
('109', NULL, '74', '151410613110', 'Yayang Rizki Toria N', 'Universitas Airlangga', 'Kampus B Jl. Srikana65 Surabaya 60286', 'Fakultas Vokasi', 'torianugrahani@gmail.com', 'Diploma III', 'D3', 'Akuntansi', 'Surabaya', 'Sdri', '085790504060', 3.19, NULL),
('110', NULL, '75', '041311133148', 'Kholidia Nur Solikha', 'Universitas Airlangga', 'Kampus B Jl Airlangga 4 Surabaya 60286', 'Fakultas Ekonomi dan Bisnis', '', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdri', '085736845096', 3.19, NULL),
('111', NULL, '75', '041311133082', 'Deviani Henindar', 'Universitas Airlangga', 'Kampus B Jl Airlangga 4 Surabaya 60286', 'Fakultas Ekonomi dan Bisnis', '', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdri', '082231022542', 3.08, NULL),
('112', NULL, '76', '1312115029', 'Laurensius Ezra B M', 'Universitas Pembangunan Nasional "Veteran" Jawa Timur', 'Jl. Raya Rungkut Madya Gunung Anyar Surabaya 60294', 'Fakultas Ekonomi dan Bisnis', 'laurenzeus@gmail.com', 'Strata 1', 'S1', 'Manajemen', 'Surabaya', 'Sdr', '085850336863', 0, NULL),
('113', NULL, '77', 'D1614088', 'Rena Laila Wuri', 'Universitas Sebelas Maret ', 'Jl. Ir. Sutami No. 36 A, Jebres, Surakarta 57126', 'Fakultas Ilmu Sosial dan Politik', 'renalaila@gmail.com', 'Diploma III', 'D3', 'Komunikasi Terapan', 'Surakarta', 'Sdri', '082137991350', 3.57, NULL),
('114', '80', '78', '1233', 'CONTON 1', '', '', 'f', '', 'Diploma I', 'D1', 't', 'SURABAYA', 'Sdri', '', 0, 1),
('115', '81', '78', '3333', 'CONTOH 2', '', '', 'f', '', 'Diploma I', 'D1', 't', 'SURABAYA', 'Sdr', '', 0, 1),
('116', NULL, '79', '3213', 'TEST', 'Universitas Airlangga', 'Kampus B Jl Airlangga 4 Surabaya 60286', 'Fakultas Ilmu Sosial dan Politik', 'test1@gmail.com', 'Strata 1', 'S1', 'Manajemen', 'Surabaya', 'Sdr', '08561350152', 3.5, 2),
('117', '82', '79', '3223', 'test2', 'Universitas Airlangga', 'Kampus B Jl Airlangga 4 Surabaya 60286', 'Fakultas Ilmu Sosial dan Politik', 'test2@gmail.com', 'Strata 1', 'S1', 'Manajemen', 'Surabaya', 'Sdr', '84932980430', 3.5, 1),
('534b4892-e37e-11e6-9eb7-73649cdf8c21', '0621c238-e380-11e6-9eb7-73649cdf8c21', '534a8d1c-e37e-11e6-9eb7-73649cdf8c21', 'fdsfds', 'dsfds', 'dfdsfds', 'fdsfdsfds', 'fdsfdsfds', 'dsfdsf', 'Strata 1', 'S1', 'dsffdsfds', 'surbaya', 'Sdr', 'fdsfdsf', 0, 1),
('96', NULL, '70', '041311133125', 'Senatriya Wahyu Raadhan', 'Universitas Airlangga', 'Kampus B Jl. Airlangga 4 Surabaya 60286', 'Fakultas Ekonomi dan Bisnis', 'senatrya9295@gmail.com', 'Strata 1', 'S1', 'Ekonomi Pembangunan', 'Surabaya', 'Sdr', '085746518529', 3.03, NULL),
('97', NULL, '71', '081311633024', 'Dwi Indah Cahyani', 'Universitas Airlangga', 'Kampus C Mulyorejo Surabaya, 60115', 'Fakultas Sains dan Teknologi', 'dwiindah922@gmail.com', 'Diploma I', 'D1', 'Sistem Informasi', 'Surabaya', 'Sdri', '081935099906', 2.84, NULL),
('98', NULL, '71', '081311633008', 'Evy Dwi Cahyati', 'Universitas Airlangga', 'Kampus C Mulyorejo Surabaya, 60115', 'Fakultas Sains dan Teknologi', 'evydwicahyati@gmail.com', 'Diploma I', 'D1', 'Sistem Informasi', 'Surabaya', 'Sdri', '085733187342', 3.44, NULL),
('99', NULL, '71', '081311633019', 'Lydia Wijaya', 'Universitas Airlangga', 'Kampus C Mulyorejo Surabaya, 60115', 'Fakultas Sains dan Teknologi', 'lydia.wijaya-13@fst.unair.ac.id', 'Diploma I', 'D1', 'Sistem Informasi', 'Surabaya', 'Sdri', '081248466028', 3.2, NULL);

--
-- Dumping data for table `pelamaran`
--

INSERT INTO `pelamaran` (`id_pelamaran`, `nosurat_pelamaran`, `tgl_pelamaran`, `tgl_mulai_permintaan`, `tgl_selesai_permintaan`, `ldp`, `alamat_pelamar`, `jurusan_pelamar`, `kota_pelamar`, `tingkat_pelamar`, `tingkat_pelamar_pendek`, `universitas_pelamar`) VALUES
('', '432432', '2017-01-18', '2017-01-31', '2017-02-28', '2017-01-31', '', '', '', '', '', ''),
('534a8d1c-e37e-11e6-9eb7-73649cdf8c21', '222', '2017-01-24', '2017-01-24', '2017-01-31', '2017-01-30', '', '', '', '', '', ''),
('70', '453/UN3.1.4/PP/Akd/2016', '2016-12-07', '2017-03-21', '2017-04-22', '2017-01-18', '', '', '', '', '', ''),
('71', '205/UN3.1.8/KM/2016', '2017-01-11', '2017-01-01', '2017-02-28', '2017-01-18', '', '', '', '', '', ''),
('72', '11/22/33/44', '2017-01-04', '2017-01-01', '2017-01-23', '2017-01-19', '', '', '', '', '', ''),
('73', '439/UN3.1.4/PP/Akd/2016', '2016-11-30', '2017-03-21', '2017-04-22', '2017-01-18', '', '', '', '', '', ''),
('74', '4066/UN3.1.14/PPd/2016', '2016-12-23', '2017-02-20', '2017-03-03', '2017-01-10', '', '', '', '', '', ''),
('75', '469/UN3.1.4/PP/Akd/2016', '2016-12-16', '2017-01-01', '2017-01-31', '2017-01-06', '', '', '', '', '', ''),
('76', 'B/770/UN.63/I/2017', '2017-01-05', '2017-02-01', '2017-02-28', '2017-01-06', '', '', '', '', '', ''),
('77', '1376/UN27.05.7.1/DP/2016', '2016-11-09', '2017-02-15', '2017-12-31', '2016-12-21', '', '', '', '', '', ''),
('78', '11/11/11', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', '', ''),
('79', '01/01/BXC/2017', '2017-01-11', '2017-01-25', '2017-02-28', '2017-01-24', '', '', '', '', '', ''),
('d19cd03c-e37c-11e6-9eb7-73649cdf8c21', '432432', '2017-01-18', '2017-01-31', '2017-02-28', '2017-01-31', '', '', '', '', '', '');

--
-- Dumping data for table `penempatan`
--

INSERT INTO `penempatan` (`id_tempat`, `nama_tempat`, `nama_panjang`) VALUES
('0606e296-e381-11e6-9eb7-73649cdf8c21', 'dsfdsfdsfdsfdsfdsfds', 'fdsfdfdsfdsfdsfds'),
('1', 'FKKK', 'Fungsi Koordinasi dan Komunikasi Kebijakan'),
('10', 'STAT', 'Fungsi Data dan Statistik Ekonomi dan Keuangan'),
('11', 'UMKM', 'Fungsi Pelaksanaan Pengembangan UMKM'),
('7', 'DPE', 'Divisi Pengembangan Ekonomi');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_magang`, `nip`, `name`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('062f4d90-e380-11e6-9eb7-73649cdf8c21', '0621c238-e380-11e6-9eb7-73649cdf8c21', NULL, 'dsfds', 'fdsfds', 'dsfdsf', '$2y$10$eNJkMJiLnPsy1AMQcYrnk.uYoWJC5e/1eMfj6QisTFAF01qJOzUse', NULL, '2017-01-26 04:29:28', '2017-01-26 04:29:28'),
('133', NULL, '14832', 'Wihujeng Ayu Rengganis', '14832', NULL, '$2y$10$.fN.UmUjNWMgm55InA1lneSLCGiFM/xIl6byvJAPaYZyWn6BWklP.', NULL, '2017-01-23 04:40:25', '2017-01-23 04:40:25'),
('134', '80', NULL, 'CONTON 1', '1233', '', '$2y$10$n4IQOCd75.5fNMZ2UIVxUelZmo1z3cPoGTMauwdRo/CFyjGjq6Rfa', NULL, '2017-01-23 06:27:57', '2017-01-23 06:27:57'),
('135', '81', NULL, 'CONTOH 2', '3333', '', '$2y$10$pIvMk.YsftPoN24w/5xjBO7H3y7akKGLkCsMDVUcPoniXcPe2FoS2', NULL, '2017-01-23 06:27:57', '2017-01-23 06:27:57'),
('136', '82', NULL, 'test2', '3223', 'test2@gmail.com', '$2y$10$QTNxy.e3MsGjnhXhJn7s0OY9DNeAu.B.dBrxxQLzdBxiyZ4IljLga', NULL, '2017-01-25 10:35:03', '2017-01-25 10:35:03'),
('2739a01c-e380-11e6-9eb7-73649cdf8c21', NULL, NULL, 'Hilman', 'hlmn', 'hlmn.hg@gmail.com', '$2y$10$Y3K7DjCsgDPV/tjP5bBI7eJ9zI3YSZ5cOLsKSsyBB2Th8ZesHNc4.', '7wlOw7N93mvKXZoMMtZPbLweXktPD9JE9JihCa6u4U3YaPZ6z5WvKvWGRnfJ', '2017-01-22 08:44:59', '2017-01-25 10:58:13'),
('fdd97f66-e380-11e6-9eb7-73649cdf8c21', NULL, 'dsdsdsds', 'dsds', 'dsdsdsds', NULL, '$2y$10$pXyw7Bki/KVrvEEx/r10Fu4Hw1zeMWvkc9ehFu8XARZprMNK9GH4i', NULL, '2017-01-26 04:36:23', '2017-01-26 04:36:23');
