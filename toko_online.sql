-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 19 Jan 2023 pada 00.04
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` text DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `gambar` text DEFAULT NULL,
  `id_kategori` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama`, `harga`, `stok`, `gambar`, `id_kategori`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Yello Sweater', 75000, 4, 'product-1.jpg', 2, 1, '2022-12-16 20:36:31', NULL, NULL),
(2, 'Dusty Pink Crop Sweater', 100000, 10, 'product-2.jpg', 2, 1, '2022-12-16 20:49:25', NULL, NULL),
(3, 'Green Jacket', 250000, 4, 'product-3.jpg', 1, 1, '2022-12-16 20:50:19', NULL, NULL),
(4, 'Grey Syal', 50000, 20, 'product-4.jpg', 3, 1, '2022-12-16 20:51:11', NULL, NULL),
(5, 'Yellow Bag', 150000, 49, 'product-7.jpg', 3, 1, '2022-12-16 20:51:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `kode_voucher` varchar(10) DEFAULT NULL,
  `tanggal_mulai_berlaku` date DEFAULT NULL,
  `tanggal_akhir_berlaku` date DEFAULT NULL,
  `besar_diskon` tinyint(2) DEFAULT NULL,
  `aktif` tinyint(1) DEFAULT NULL,
  `nama_diskon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `diskon`
--

INSERT INTO `diskon` (`id`, `kode_voucher`, `tanggal_mulai_berlaku`, `tanggal_akhir_berlaku`, `besar_diskon`, `aktif`, `nama_diskon`) VALUES
(1, 'd1skon', '2022-12-20', '2022-12-31', 30, 1, 'DISKON NATAL'),
(2, 'di5kon', '2022-12-20', '2023-01-28', 40, 1, 'DISKON TAUN BARU'),
(3, 'disk0n', '2022-12-07', '2022-12-14', 50, 0, 'DISKON 12.12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Men', 1, '2022-12-16 20:34:26', NULL, NULL),
(2, 'Women', 1, '2022-12-16 20:34:53', NULL, NULL),
(3, 'Kid', 1, '2022-12-16 20:35:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED DEFAULT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id`, `id_barang`, `id_user`, `komentar`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 2, 2, 'Barangnya mantab', 2, '2022-12-21 01:44:57', NULL, NULL),
(2, 1, 4, 'barangnya sangat bagus', 4, '2022-12-21 17:58:09', NULL, NULL),
(3, 2, 7, 'Barangnya bagus sekali', 7, '2022-12-22 06:38:28', NULL, NULL),
(4, 2, 7, 'barangnya bagus sekali', 7, '2022-12-22 06:41:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED DEFAULT NULL,
  `id_pembeli` int(10) UNSIGNED DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `ongkir` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_barang`, `id_pembeli`, `jumlah`, `total_harga`, `alamat`, `ongkir`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 2, 2, 1, 168000, 'UDINUS', 18000, 0, 2, '2022-12-16 21:21:10', NULL, NULL),
(2, 3, 3, 1, 118000, 'UGM', 18000, 0, 3, '2022-12-16 21:22:57', NULL, NULL),
(3, 3, 3, 1, 118000, 'UDINUS', 18000, 0, 3, '2022-12-16 21:23:03', NULL, NULL),
(4, 1, 1, 1, 105000, '123', 30000, 0, 1, '2022-12-19 22:29:25', NULL, NULL),
(5, 1, 1, 2, 142500, 'Dsn. Getas RT 02 RW 02, Kauman Lor Kec. Pabelan', 30000, 0, 1, '2022-12-21 00:42:45', NULL, NULL),
(6, 1, 1, 2, 127000, 'Bantul', 22000, 0, 1, '2022-12-21 00:58:57', NULL, NULL),
(7, 1, 1, 2, 155000, 'Dsn. Getas RT 02 RW 02, Kauman Lor Kec. Pabelan', 50000, 0, 1, '2022-12-21 01:00:08', NULL, NULL),
(8, 1, 1, 2, 155000, 'Dsn. Getas RT 02 RW 02, Kauman Lor Kec. Pabelan', 50000, 0, 1, '2022-12-21 01:06:08', NULL, NULL),
(9, 1, 2, 1, 78500, 'Udinus', 26000, 0, 2, '2022-12-21 01:24:44', NULL, NULL),
(10, 1, 2, 1, 82500, 'udinus', 30000, 0, 2, '2022-12-21 01:43:22', NULL, NULL),
(11, 1, 2, 1, 105000, 'udinus', 30000, 0, 2, '2022-12-21 01:44:10', NULL, NULL),
(12, 1, 4, 1, 101000, 'Dsn. Getas RT 02 RW 02, Kauman Lor Kec. Pabelan', 26000, 0, 4, '2022-12-21 17:22:15', NULL, NULL),
(13, 1, 4, 2, 138500, 'Dsn. Getas RT 02 RW 02, Kauman Lor Kec. Pabelan', 26000, 0, 4, '2022-12-21 18:08:40', NULL, NULL),
(14, 2, 4, 4, 330000, 'udinus', 30000, 0, 4, '2022-12-21 23:10:02', NULL, NULL),
(15, 2, 7, 1, 96000, 'Jalan jalan no. 5 kota kita', 26000, 0, 7, '2022-12-22 06:38:11', NULL, NULL),
(16, 3, 7, 1, 169000, 'jalan gunung kidul', 19000, 0, 7, '2022-12-22 06:40:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `salt` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avatar`, `role`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(5, 'slamet', 'd054a37883432bba236145c20a99ce62', '63a44e2f19c650.46220589', NULL, NULL, 0, '2022-12-22 06:31:43', NULL, NULL),
(6, 'slamet', 'c0ffe29ecf531eae95a12a132b33c77e', '63a44e4780ab69.89563644', NULL, NULL, 0, '2022-12-22 06:32:07', NULL, NULL),
(7, 'bambang', 'e27baa8d16d3359a9f2310477115ca65', '63a44ea907b7d7.71309790', NULL, NULL, 0, '2022-12-22 06:33:45', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
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
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
