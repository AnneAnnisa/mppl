-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2017 at 06:26 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `silkmmtl`
--

-- --------------------------------------------------------

--
-- Table structure for table `menilai`
--

CREATE TABLE `menilai` (
  `id_nilai` int(11) NOT NULL,
  `nim_penguji` varchar(255) NOT NULL DEFAULT '',
  `id_wawancara` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `nilai` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menilai`
--

INSERT INTO `menilai` (`id_nilai`, `nim_penguji`, `id_wawancara`, `comment`, `nilai`) VALUES
(7, '1', 34, 'ehe', 80),
(8, '111111111', 34, 'fgfd', 0),
(10, '1', 36, 'dsdklfsdf', 34);

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar`
--

CREATE TABLE `pendaftar` (
  `id_pendaftar` int(11) NOT NULL,
  `id_pendidikan` int(11) NOT NULL DEFAULT '0',
  `id_wawancara` int(11) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  `path_foto` varchar(255) DEFAULT NULL,
  `path_cv` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendaftar`
--

INSERT INTO `pendaftar` (`id_pendaftar`, `id_pendidikan`, `id_wawancara`, `nim`, `nama`, `email`, `telp`, `alamat`, `alasan`, `path_foto`, `path_cv`) VALUES
(1, 81, 34, '123', 'anne', 'a@a.a', '123', 'keputih', 'mau aja kenapa', '/18.jpeg', '/contoh.doc'),
(2, 81, 36, '99', 'nisa', 'z@z.z', '890', 'kertajaya', '789', '/18.jpeg', '/ehe.doc');

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `jurusan` varchar(255) DEFAULT NULL,
  `fakultas` varchar(255) DEFAULT NULL,
  `universitas` varchar(255) DEFAULT NULL,
  `alamat_jurusan` varchar(255) DEFAULT NULL,
  `telp_jurusan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendidikan`
--

INSERT INTO `pendidikan` (`id_pendidikan`, `kode`, `jurusan`, `fakultas`, `universitas`, `alamat_jurusan`, `telp_jurusan`) VALUES
(81, NULL, 'Bisnis', 'FEB', 'Unair', 'Keputiiiih', '849328'),
(84, NULL, '', '', 'ynhn', '', ''),
(457, NULL, '', '', 'fererer', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `penguji`
--

CREATE TABLE `penguji` (
  `nim_penguji` varchar(11) NOT NULL DEFAULT '',
  `nama_penguji` varchar(255) DEFAULT NULL,
  `telp_penguji` varchar(255) DEFAULT NULL,
  `status_penguji` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penguji`
--

INSERT INTO `penguji` (`nim_penguji`, `nama_penguji`, `telp_penguji`, `status_penguji`) VALUES
('1', 'aulia', '123', '1'),
('111111111', 'bisa', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wawancara`
--

CREATE TABLE `wawancara` (
  `id_wawancara` int(11) NOT NULL,
  `id_pendaftar` int(11) NOT NULL DEFAULT '0',
  `waktu_wawancara` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nilai_wawancara` varchar(255) DEFAULT '0',
  `status` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wawancara`
--

INSERT INTO `wawancara` (`id_wawancara`, `id_pendaftar`, `waktu_wawancara`, `nilai_wawancara`, `status`) VALUES
(34, 1, '2017-03-29 14:05:36', '80.0000', '0'),
(36, 2, '2017-03-29 15:37:14', '38.0000', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menilai`
--
ALTER TABLE `menilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `fk_penguji_menilai` (`nim_penguji`),
  ADD KEY `menilai_ibfk_1` (`id_wawancara`);

--
-- Indexes for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD PRIMARY KEY (`id_pendaftar`),
  ADD KEY `fk_pendidikan_pendaftar` (`id_pendidikan`),
  ADD KEY `id_wawancara` (`id_wawancara`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indexes for table `penguji`
--
ALTER TABLE `penguji`
  ADD PRIMARY KEY (`nim_penguji`);

--
-- Indexes for table `wawancara`
--
ALTER TABLE `wawancara`
  ADD PRIMARY KEY (`id_wawancara`),
  ADD KEY `fk_pendaftar_wawancara` (`id_pendaftar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menilai`
--
ALTER TABLE `menilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pendaftar`
--
ALTER TABLE `pendaftar`
  MODIFY `id_pendaftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pendidikan`
--
ALTER TABLE `pendidikan`
  MODIFY `id_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=458;
--
-- AUTO_INCREMENT for table `wawancara`
--
ALTER TABLE `wawancara`
  MODIFY `id_wawancara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menilai`
--
ALTER TABLE `menilai`
  ADD CONSTRAINT `fk_penguji_menilai` FOREIGN KEY (`nim_penguji`) REFERENCES `penguji` (`nim_penguji`),
  ADD CONSTRAINT `menilai_ibfk_1` FOREIGN KEY (`id_wawancara`) REFERENCES `wawancara` (`id_wawancara`) ON DELETE CASCADE;

--
-- Constraints for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD CONSTRAINT `fk_pendidikan_pendaftar` FOREIGN KEY (`id_pendidikan`) REFERENCES `pendidikan` (`id_pendidikan`),
  ADD CONSTRAINT `pendaftar_ibfk_1` FOREIGN KEY (`id_wawancara`) REFERENCES `wawancara` (`id_wawancara`) ON DELETE SET NULL;

--
-- Constraints for table `wawancara`
--
ALTER TABLE `wawancara`
  ADD CONSTRAINT `fk_pendaftar_wawancara` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
