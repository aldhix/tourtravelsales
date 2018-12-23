-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 23 Des 2018 pada 18.10
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tts`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `phone` bigint(20) NOT NULL,
  `gender` enum('L','P') NOT NULL DEFAULT 'L'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `name`, `address`, `phone`, `gender`) VALUES
(1, 'Yorn Suni', 'Padaherang, Rt 01/01, Kec.Padaherang, Kab.Pangandaran', 888999555111, 'L'),
(2, 'Butterfly', 'Cibinong, Rt 02/05, Kec. Cibinong, Kota Bandung', 888666777444, 'P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservation`
--

CREATE TABLE `reservation` (
  `id` int(10) NOT NULL,
  `reservation_code` varchar(191) NOT NULL,
  `reservation_at` time NOT NULL,
  `reservation_date` date NOT NULL,
  `customerid` int(10) NOT NULL,
  `seat_code` varchar(10) NOT NULL,
  `ruteid` int(10) NOT NULL,
  `depart_at` datetime NOT NULL,
  `price` int(10) NOT NULL,
  `userid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `reservation`
--

INSERT INTO `reservation` (`id`, `reservation_code`, `reservation_at`, `reservation_date`, `customerid`, `seat_code`, `ruteid`, `depart_at`, `price`, `userid`) VALUES
(1, 'TTS20181103001', '00:19:24', '2018-11-03', 1, 'AA01', 1, '2018-11-10 10:00:00', 150000, 1),
(2, 'TTS20181103002', '00:19:24', '2018-11-03', 2, 'EA01', 2, '2018-11-07 13:30:00', 325000, 4),
(3, 'TTS20181105003', '01:25:46', '2018-11-05', 1, 'A324', 3, '2018-11-05 01:15:46', 200000, 1),
(4, 'TTS20181105004', '01:27:31', '2018-11-05', 2, 'XX10', 4, '2018-11-17 10:30:00', 1500000, 1),
(5, 'TTS20181105005', '02:23:42', '2018-11-05', 1, 'DH34', 4, '2018-11-06 20:30:00', 1500000, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE `rute` (
  `id` int(10) NOT NULL,
  `depart_at` int(10) NOT NULL,
  `rute_from` varchar(100) NOT NULL,
  `rute_to` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `transportationid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rute`
--

INSERT INTO `rute` (`id`, `depart_at`, `rute_from`, `rute_to`, `price`, `transportationid`) VALUES
(1, 6, 'Jakarta', 'Yogyakarta', 150000, 1),
(2, 3, 'Bandung', 'Semarang', 325000, 3),
(3, 4, 'Bandung', 'Semarang', 200000, 2),
(4, 3, 'Jakarta', 'Aceh', 1500000, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transportation`
--

CREATE TABLE `transportation` (
  `id` int(10) NOT NULL,
  `code` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `seat_qty` int(10) NOT NULL,
  `transportation_typeid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transportation`
--

INSERT INTO `transportation` (`id`, `code`, `description`, `seat_qty`, `transportation_typeid`) VALUES
(1, 'Argo Bromo Anggrek', 'PT. Kereta Api', 200, 1),
(2, 'Argo Wilis', 'PT. Kereta Api', 200, 1),
(3, 'Boing 737-500', 'PT. Merpati', 200, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transportation_type`
--

CREATE TABLE `transportation_type` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transportation_type`
--

INSERT INTO `transportation_type` (`id`, `description`) VALUES
(1, 'Kereta Api'),
(2, 'Pesawat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('operator','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'operator',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `password`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aldhi Ekananda', 'aldhi', 'aldhi@gmail.com', '$2y$10$yqY7gE3hMGr5GzHRKIGhYuEe5OWjelkbML1Ma0TLMahGLPlI3fFMC', 'admin', 'ZYDvL6kNIjLsKlZNga7MMMGEE3h1z0o5jp4q4MOSvdLCxrQHWJe6DLJHql08', '2018-10-05 10:32:57', '2018-10-15 13:48:31'),
(4, 'Butterfly', 'butterfly', 'butterfly@yahoo.com', '$2y$10$B2IlrS7vbZfJHSrvJk8zHOSFc4i9.GkHsLQJSt0zZs.cMuSaIi51K', 'operator', 'kY9vshFfFjShv0xQe8DZzcMZHHPzkAWFSsQxPCzwTx1hkYYEOxiQA2AlSNdm', '2018-10-08 13:00:56', '2018-10-14 12:26:36'),
(5, 'Lindis AOV', 'lindis', 'lindis@yahoo.com', '$2y$10$iywgcRae/F.dEnLipQ7NOuvAQpSzkWgCcIecqVYGdyc5AO1z8fby2', 'operator', '42wGOp9frAng4HaTqGHLSoRLyRlt7x8AwOcNgQwLaTiweq6MDZzhgfh2Nf3U', '2018-10-08 13:01:51', '2018-10-14 09:59:27'),
(6, 'Anisa Bahar', 'anisa', 'anisa@yahoo.com', '$2y$10$UkxFpT/c1y7JtTnpcV8At.QTTa0sfiNSqMtLcQoSEEEyvQgGdrMda', 'operator', 'h4RC9MQgYgSngIxo2xAcKpwkXhiMEUDaGiLxrDaCdwHMVZSXPlbH1mS9465p', '2018-10-08 13:02:43', '2018-10-08 13:02:43'),
(8, 'Airi AOV', 'airi', 'airi@gmail.com', '$2y$10$w3pB8WwKuMsevto7Mb0ll.BqBiZOkoGSQZ93f2wp9DVeih8CnQ/hq', 'operator', 'lDrZdSVnKQfHRhMsLEJBDzgcBWECO0wSWtnKMkXGtEWEXZOVhDTceB3VzY7H', '2018-10-14 01:47:26', '2018-10-14 01:47:26'),
(9, 'Yorn AOV', 'yorn', 'yorn@yahoo.com', '$2y$10$sgIgLSWu8bOwOxm4Pphpzerk5W3p2FLBIGtFWfhGDXORaCBMdyd9S', 'operator', NULL, '2018-10-14 01:52:28', '2018-10-14 01:52:28'),
(10, 'Angling Darma', 'angling_darma', 'angling@gmail.com', '$2y$10$bhATwvKr4rt0XJuOFweUquNT1.xIFDInYnRk1j8uAwq276wQcrDli', 'operator', 'SrlJGYH4g7d9ydUoGTYvdtJlwAx3ORoBcbwobA47t6WGrq29yq93lYwFIck3', '2018-10-15 13:11:20', '2018-10-15 13:11:20'),
(12, 'Wiro Sableng', 'wiro', 'wiro@gmail.com', '$2y$10$CTPpZPUC8VHm//WWOpkjjuC1KnOUb0WkdgFVxv1iIXm/.BSLdF7Ua', 'operator', 'XjKqLnr1TThicikrCurvCYOv33EsVbVPbYFE823AHx1b7Gc9jSVsEogDxwpt', '2018-10-15 13:37:26', '2018-10-15 13:45:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reservation_code` (`reservation_code`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transportation`
--
ALTER TABLE `transportation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `transportation_type`
--
ALTER TABLE `transportation_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rute`
--
ALTER TABLE `rute`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transportation_type`
--
ALTER TABLE `transportation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
