-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Agu 2022 pada 09.57
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arsip`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `disposisi`
--

CREATE TABLE `disposisi` (
  `id` int(11) NOT NULL,
  `id_surat_masuk` int(11) DEFAULT NULL,
  `tgl_disposisi` date DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `disposisi`
--

INSERT INTO `disposisi` (`id`, `id_surat_masuk`, `tgl_disposisi`, `catatan`) VALUES
(2, 3, '2021-06-09', '<p>Saya Tidak Bisa Hadir</p>\r\n'),
(3, 4, '2021-06-10', '<p>Sudah Dibaca</p>\r\n'),
(4, 5, '2022-06-25', '<p>Males</p>\r\n'),
(5, 8, '2022-08-26', '<p>Saya hadir agak telat</p>\r\n'),
(6, 9, '2022-08-26', '<p>Sudah dibaca</p>\r\n'),
(7, 10, '2022-08-26', '<p>Sudah dibaca</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'Undangan'),
(2, 'Khusus'),
(3, 'Spesial'),
(4, 'Elite'),
(5, 'Rahasia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suratkeluar`
--

CREATE TABLE `suratkeluar` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `no_surat_keluar` varchar(255) DEFAULT NULL,
  `no_agenda_surat_keluar` varchar(255) DEFAULT NULL,
  `tgl_surat_keluar` date DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `tujuan_surat` varchar(255) DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `file_surat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `suratkeluar`
--

INSERT INTO `suratkeluar` (`id`, `id_kategori`, `no_surat_keluar`, `no_agenda_surat_keluar`, `tgl_surat_keluar`, `tgl_kirim`, `tujuan_surat`, `perihal`, `file_surat`) VALUES
(2, 1, 'SK-001', 'NASK-001', '2021-06-09', '2021-06-09', 'Sappo', '<p>Surat Keluar</p>\r\n', 'Koala.jpg'),
(3, 2, 'SK-002', 'NASK-002', '2022-06-18', '2022-06-19', '132222', '', 'ckeditor4-export-pdf.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suratmasuk`
--

CREATE TABLE `suratmasuk` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `no_surat_masuk` varchar(255) DEFAULT NULL,
  `no_agenda_surat_masuk` varchar(255) DEFAULT NULL,
  `tgl_surat_masuk` date DEFAULT NULL,
  `tgl_terima` date DEFAULT NULL,
  `asal_surat` varchar(255) DEFAULT NULL,
  `perihal` text DEFAULT NULL,
  `file_surat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `suratmasuk`
--

INSERT INTO `suratmasuk` (`id`, `id_kategori`, `no_surat_masuk`, `no_agenda_surat_masuk`, `tgl_surat_masuk`, `tgl_terima`, `asal_surat`, `perihal`, `file_surat`) VALUES
(3, 1, 'SM-001', 'NASM-001', '2021-06-09', '2021-06-09', 'Rian', '<p>Surat Masuk</p>\r\n', '1214074-Adrian Bimo Hernawan Pratama-D4 TI 1C- Tugas Writing Assignment--.pdf'),
(4, 1, 'SM-002', 'NASM-002', '2021-06-10', '2021-06-10', 'asdasd', '<p>asdasdasd</p>\r\n', 'Penguins.jpg'),
(6, 2, 'SM-003', 'NASM-003', '2022-06-18', '2022-06-19', 'Adrian', '', 'g18bulk.jpg'),
(9, 5, 'SM-005', 'NASM-005', '2022-08-25', '2022-08-27', 'Adrian', '<p>######</p>\r\n', 'Screenshot (577).png'),
(10, 5, 'SM-005', 'NASM-005', '2022-08-26', '2022-08-27', 'Adrian12', '<p>***********</p>\r\n', 'Screenshot (577).png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `level` enum('admin','anggota') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `username`, `password`, `level`) VALUES
(36, 'adrian', 'adrian43', '123', 'admin'),
(37, 'adrian', 'admin', 'admin', 'admin'),
(38, 'adrian93', 'adrian93', 'abidan', 'admin'),
(39, 'adrian93', 'adrian93', 'adrian93', 'admin'),
(40, 'adrianadmin', 'adrianadmin', 'abidan', 'admin'),
(41, 'adrianadmin', 'adrianadmin', 'admin', 'admin'),
(43, 'adrian12', 'admin', 'admin', 'admin'),
(44, 'admin1', 'admin1', 'admin', 'admin'),
(45, 'adrian13', 'admin13', 'admin', 'anggota'),
(46, 'sadsda', 'admin', 'admin', 'anggota'),
(47, 'adsasd', 'admin', 'admin', 'anggota'),
(48, 'adrian23', 'admin', 'admin', 'anggota'),
(49, 'adrian123', 'admin123', 'admin', 'anggota'),
(50, 'adrian76', 'admin', 'admin', 'anggota'),
(51, 'adrian76', 'adrian76', 'admin', 'anggota'),
(52, 'adrian76', 'adrian76', 'admin', 'anggota'),
(53, 'wewewewe', 'aku', 'aku', 'anggota');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `disposisi`
--
ALTER TABLE `disposisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `suratkeluar`
--
ALTER TABLE `suratkeluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `suratmasuk`
--
ALTER TABLE `suratmasuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `disposisi`
--
ALTER TABLE `disposisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `suratkeluar`
--
ALTER TABLE `suratkeluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `suratmasuk`
--
ALTER TABLE `suratmasuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
