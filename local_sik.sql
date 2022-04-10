-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 10 Apr 2022 pada 16.44
-- Versi server: 5.7.33
-- Versi PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dwikyakbar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `status` enum('hadir','izin','sakit','cuti','alfa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'alfa',
  `id_permohonan` int(11) NOT NULL DEFAULT '0',
  `id_kantor` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL,
  `latitude` double DEFAULT '0',
  `longitude` double DEFAULT '0',
  `jarak` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id`, `id_pegawai`, `status`, `id_permohonan`, `id_kantor`, `tanggal`, `jam_masuk`, `jam_pulang`, `latitude`, `longitude`, `jarak`, `created_at`, `updated_at`) VALUES
(4, 2, 'izin', 2, 1, '2020-03-27', NULL, NULL, 0, 0, NULL, NULL, NULL),
(5, 2, 'izin', 2, 1, '2020-03-28', NULL, NULL, 0, 0, NULL, NULL, NULL),
(6, 2, 'izin', 2, 1, '2020-03-29', NULL, NULL, 0, 0, NULL, NULL, NULL),
(7, 2, 'izin', 2, 1, '2020-03-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, 'izin', 2, 1, '2020-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, 'izin', 2, 1, '2020-04-01', '16:16:13', '16:16:14', NULL, NULL, NULL, NULL, '2020-03-19 08:16:16'),
(10, 2, 'hadir', 0, 1, '2020-03-17', '12:02:35', '12:02:46', NULL, NULL, NULL, '2020-03-17 04:02:36', '2020-03-17 04:02:47'),
(11, 3, 'hadir', 0, 1, '2020-03-18', '10:00:13', '10:00:21', NULL, NULL, NULL, '2020-03-18 02:00:14', '2020-03-18 02:00:22'),
(12, 5, 'hadir', 0, 1, '2020-03-18', '10:03:37', '10:03:42', NULL, NULL, NULL, '2020-03-18 02:03:38', '2020-03-18 02:03:43'),
(13, 1, 'hadir', 0, 1, '2020-03-19', '16:02:27', NULL, -8.6991772, 115.17746170000001, 30, '2020-03-19 08:02:27', '2020-03-19 08:02:27'),
(14, 4, 'hadir', 0, 1, '2022-02-13', '14:20:56', '14:21:42', -8.6611296, 115.2335523, 10, '2022-02-13 08:20:56', '2022-02-13 08:21:43'),
(15, 7, 'hadir', 0, 1, '2022-02-13', '14:30:33', '14:49:21', -8.661032, 115.2335267, 7, '2022-02-13 08:30:33', '2022-02-13 08:49:21'),
(16, 4, 'hadir', 0, 1, '2022-03-13', '17:57:22', '17:57:43', -8.6609723, 115.2335008, 1, '2022-03-13 11:57:23', '2022-03-13 11:57:44'),
(17, 3, 'hadir', 0, 1, '2022-03-13', '18:51:23', NULL, -8.6609554, 115.2334581, 6, '2022-03-13 12:51:23', '2022-03-13 12:51:23'),
(18, 8, 'hadir', 0, 1, '2022-03-13', '18:56:27', NULL, -8.6609195, 115.2334901, 6, '2022-03-13 12:56:27', '2022-03-13 12:56:27'),
(20, 9, 'hadir', 0, 1, '2022-04-04', '07:28:21', '07:30:03', -8.6720334, 115.2285944, 26, '2022-04-04 01:28:22', '2022-04-04 01:30:04'),
(22, 9, 'cuti', 6, NULL, '2022-04-05', NULL, NULL, 0, 0, NULL, NULL, NULL),
(23, 9, 'cuti', 6, NULL, '2022-04-06', NULL, NULL, 0, 0, NULL, NULL, NULL),
(24, 9, 'cuti', 6, NULL, '2022-04-07', NULL, NULL, 0, 0, NULL, NULL, NULL),
(25, 9, 'cuti', 6, NULL, '2022-04-08', NULL, NULL, 0, 0, NULL, NULL, NULL),
(26, 9, 'cuti', 6, NULL, '2022-04-09', NULL, NULL, 0, 0, NULL, NULL, NULL),
(27, 9, 'cuti', 6, NULL, '2022-04-10', NULL, NULL, 0, 0, NULL, NULL, NULL),
(28, 9, 'cuti', 6, NULL, '2022-04-11', NULL, NULL, 0, 0, NULL, NULL, NULL),
(29, 9, 'cuti', 6, NULL, '2022-04-12', NULL, NULL, 0, 0, NULL, NULL, NULL),
(30, 4, 'sakit', 7, NULL, '2022-04-04', NULL, NULL, 0, 0, NULL, NULL, NULL),
(31, 4, 'sakit', 7, NULL, '2022-04-05', NULL, NULL, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi`
--

CREATE TABLE `aplikasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `aplikasi`
--

INSERT INTO `aplikasi` (`id`, `nama`, `logo`, `alamat`, `email`, `telp`, `fax`, `created_at`, `updated_at`) VALUES
(1, 'Sistem Informasi Karyawan Pada PT. Telkominfra Denpasar', 'Logo-2020-03-18-20-33-32.png', 'Jl. Serma Gede No.11-13, Dauh Puri Klod, Kec. Denpasar Bar., Kota Denpasar, Bali 80234', 'telkominfa@mail.com', '0361 - 7775554', NULL, NULL, '2020-03-18 12:33:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `hari_kerja` int(11) NOT NULL DEFAULT '0',
  `hari_izin` int(11) NOT NULL DEFAULT '0',
  `hari_sakit` int(11) NOT NULL DEFAULT '0',
  `hari_cuti` int(11) NOT NULL DEFAULT '0',
  `gaji_pokok` double NOT NULL DEFAULT '0',
  `bpjs_kesehatan` double NOT NULL DEFAULT '0',
  `bpjs_tk` double NOT NULL DEFAULT '0',
  `bpjs_jht` double NOT NULL DEFAULT '0',
  `potongan_lain` double NOT NULL DEFAULT '0',
  `bonus` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `keterangan` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`id`, `id_pegawai`, `bulan`, `tahun`, `hari_kerja`, `hari_izin`, `hari_sakit`, `hari_cuti`, `gaji_pokok`, `bpjs_kesehatan`, `bpjs_tk`, `bpjs_jht`, `potongan_lain`, `bonus`, `total`, `keterangan`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 2020, 1, 5, 0, 0, 5000000, 50000, 50000, 50000, 100000, 0, 4750000, NULL, NULL, '2022-02-13 08:55:36'),
(4, 5, 3, 2020, 1, 0, 0, 0, 10000000, 200000, 100000, 100000, 0, 0, 9600000, 'lebih giat lagi', NULL, '2020-03-18 05:28:12'),
(5, 3, 3, 2020, 1, 0, 0, 0, 2500000, 25000, 25000, 25000, 0, 0, 2425000, NULL, NULL, NULL),
(6, 4, 2, 2022, 1, 0, 0, 0, 4000000, 40000, 40000, 40000, 0, 0, 3880000, NULL, NULL, NULL),
(8, 7, 2, 2022, 1, 0, 0, 0, 5000000, 50000, 50000, 50000, 0, 0, 4850000, NULL, NULL, NULL),
(9, 4, 3, 2022, 1, 0, 0, 0, 4000000, 40000, 40000, 40000, 0, 0, 3880000, NULL, NULL, NULL),
(10, 6, 4, 2022, 1, 0, 0, 0, 5000000, 50000, 50000, 50000, 0, 0, 4850000, NULL, NULL, NULL),
(11, 9, 4, 2022, 1, 0, 0, 9, 45000000, 450000, 450000, 450000, 0, 0, 43650000, NULL, NULL, NULL),
(12, 8, 3, 2022, 1, 0, 0, 0, 12345, 12345, 12345, 12345, 0, 0, -24690, NULL, NULL, NULL),
(13, 3, 3, 2022, 1, 0, 0, 0, 2500000, 25000, 25000, 25000, 0, 0, 2425000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kantor`
--

CREATE TABLE `kantor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `radius` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kantor`
--

INSERT INTO `kantor` (`id`, `nama`, `alamat`, `telp`, `radius`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Telkom Infra', 'Renon Denpasar 33444', '0889394333', 100, -8.6609731, 115.233513, '2020-03-19 06:59:08', '2022-04-04 06:40:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_10_16_044809_create_kejuruan_table', 1),
(4, '2019_10_16_044830_create_slider_table', 1),
(5, '2019_10_16_044851_create_kategori_table', 1),
(6, '2019_10_16_044909_create_ujian_table', 1),
(7, '2019_10_16_044948_create_tes_table', 1),
(8, '2019_10_16_045001_create_soal_table', 1),
(9, '2019_10_16_045044_create_daftar_table', 1),
(10, '2019_11_07_064209_create_informasi_table', 2),
(11, '2020_03_14_111530_create_aplikasis_table', 3),
(12, '2020_03_14_114756_add_logo_to_applikasi_table', 4),
(13, '2020_03_14_133445_create_pegawais_table', 5),
(14, '2020_03_16_165651_create_permohonans_table', 6),
(15, '2020_03_16_170502_create_gajis_table', 7),
(16, '2020_03_16_200823_create_absensis_table', 7),
(17, '2020_03_16_201355_create_towers_table', 7),
(18, '2020_03_19_143902_create_kantors_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(10) UNSIGNED NOT NULL,
  `nik` int(4) UNSIGNED ZEROFILL NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$1NdJ9Lg4X43sf0pus52bROC93mNd1sS5G3zreDHq1jPbrfcerTrfm',
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departemen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('hrd','pegawai','developer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pegawai' COMMENT 'level admin',
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  `gaji_pokok` double NOT NULL DEFAULT '0',
  `bpjs_kesehatan` int(11) NOT NULL DEFAULT '1' COMMENT 'asuransi kesehatan',
  `bpjs_tk` int(11) NOT NULL DEFAULT '1' COMMENT 'asuransi tenaga kerja',
  `bpjs_jht` int(11) NOT NULL DEFAULT '1' COMMENT 'persentase asuransi ',
  `uang_makan` double NOT NULL DEFAULT '15000',
  `uang_transport` double NOT NULL DEFAULT '0',
  `mulai_kerja` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nik`, `username`, `password`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jabatan`, `departemen`, `alamat`, `telp`, `email`, `level`, `foto`, `gaji_pokok`, `bpjs_kesehatan`, `bpjs_tk`, `bpjs_jht`, `uang_makan`, `uang_transport`, `mulai_kerja`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0001, 'admin', '$2y$10$Hxe9VZL.y0HX4RrgaBqvfO2s5odaa1BQlDmz8BlbiuJEX1hd6z6eK', 'admin', 'Jakarta', '2020-03-18', NULL, NULL, 'Denpasar', '02233356', 'admin@mail.com', 'developer', 'user.png', 0, 1, 1, 1, 15000, 0, NULL, '6EQLwjccuQ1XTMl9N0Mxga3bGiaZgmT2K6v74kHgLePerlIamr4aiDMTDDcq', NULL, '2020-03-19 01:30:36'),
(2, 0002, 'joko', '$2y$10$oCNOtGDVbBtQ6mSkHT89cO8qrLDIpwFFbKtu5VvU4EpnEgdL36B1O', 'joko1', 'Bandung', '2020-03-18', 'Manager', 'HRD', 'Denpasar', '099343433', 'joko@mail.com', 'hrd', 'user.png', 5000000, 1, 1, 1, 15000, 0, '2016-01-01', 'cpACcb4Q1dWrhYHpBybp1s8ehfl9GdFjnETvWwtcBK5uJGKoQhF5TOyjstZk', '2020-03-18 03:38:08', '2020-03-18 03:38:08'),
(3, 0003, 'nita', '$2y$10$a36aHsKlmqfaTRp/PemBnuynJ8.4gkzE7Fkl4CkUYb3vTCCE7B1SS', 'Nita Siantari', 'Denpasar', '2020-03-18', 'Staff', 'Office', 'Denpasar Utara', '093434234243', 'nita@mail.com', 'pegawai', 'user.png', 2500000, 1, 1, 1, 15000, 0, '2016-03-18', 'TMpOvemPXUNlJdhpDrTq6lBSCbXSQ52fL0qp2qzZYUbBLzQcledA8iV5k9w3', '2020-03-18 03:39:25', '2020-03-18 03:39:25'),
(4, 0004, 'juni', '$2y$10$cLUU43SPqKoQgz/JUkWdIulHiB7WP4bmx3Mkpm/R8Fodmt.9neS6C', 'Juniantara', 'Denpasar', '2020-03-18', 'Staff', 'TSR', 'Kerobokan', '09994549900', 'juni@mail.com', 'pegawai', 'user.png', 4000000, 1, 1, 1, 15000, 0, '2017-02-03', 'bYdPpuMjKcNZxTqg8RFpViQJ8iFrad1H7I6ugKcpANqSYoFF6euiRsTX1mnR', '2020-03-18 03:40:55', '2020-03-18 03:40:55'),
(5, 0005, 'fika', '$2y$10$JGd3L7MITvkZwbt.sP1s3OkcjsDtz9Pfj7SSkD4Y7II2HyrGmIW2a', 'Fika', 'Kalimantan', '2020-04-08', 'Admin', 'Purchasing', 'Kerobokan 5', '08894500000', 'fika@mail.com', 'pegawai', 'user.png', 10000000, 1, 1, 1, 15000, 0, '2010-03-18', 'NBtsH9V5ds8rMMaylQ1m0MtZ7eOg0jOFPauGSehT8gBTHU0jl9OSUOAVQdJz', '2020-03-18 03:42:40', '2020-03-18 03:42:40'),
(6, 0006, 'akbar', '$2y$10$XlwBZ2auQZdk1RBYzD/wvuqv.F72bxXRko1olv51fDx7fe5uichCG', 'akbar', 'subang', '1996-05-22', 'admin', 'kepegawaian', 'subang', '0111111', 'asassa@com', 'hrd', 'user.png', 5000000, 1, 1, 1, 15000, 0, '2017-05-31', 'HxkuiMVRulLcRgNDBCZLiuPMNtmsDw5uh7cv5YSFnyVlsCqGFoziHmmx2baq', '2022-02-06 05:19:29', '2022-02-06 05:19:29'),
(7, 0007, 'dwiky', '$2y$10$fbFVvTRwLBo170VddXJr2.8pSflmAbxiQ0eE2lFpq2DrFpCNJ1YuS', 'dwiky', 'tabanan', '2022-02-07', 'staff', 'tsra', 'bali', '12121', 'a@com', 'pegawai', 'user.png', 5000000, 1, 1, 1, 15000, 0, '2022-02-13', 'Le6IRDbklRduVaTuLctqTqLEBL7FvQtwPxHnlPNyJCQJunio6wsWw76EOGWj', '2022-02-13 08:27:21', '2022-03-13 12:49:34'),
(8, 0008, 'adi', '$2y$10$PKMBaqw6Kohvgsd9tTqfUO3gmK87jVU1R32Xk3Kx7Xubl6eGkLw6y', 'adi', 'badung', '2022-03-13', 'dddd', 'tsra', 'dadada', 'dadada', 'adada@gmail.com', 'pegawai', 'user.png', 12345, 1, 1, 1, 15000, 0, '2022-03-13', '5NEfw1rL3DRTjzWgVM17EXsdkM4FfEgRQ2hYaFpMFxWhB552lyh2YnGHOJea', '2022-03-13 12:56:06', '2022-03-13 12:56:06'),
(9, 0009, 'dani', '$2y$10$viD9ohcmtX9v3BtDsZzVmOae8XHh9Js8HS7cpzrcklP231qZ4Bp3K', 'dani', 'bali', '1995-02-07', 'staff', 'tsra', 'bali', '1231233', 'a@gmail.com', 'pegawai', 'user.png', 45000000, 1, 1, 1, 15000, 0, '2022-04-04', 'm7Sah7RoB06yrtClHXCKSr7zrgsNim9FMV5UyO8PyXSpUXMeAnJVuWOKnRrC', '2022-04-04 01:23:40', '2022-04-04 01:23:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permohonan`
--

CREATE TABLE `permohonan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jenis` enum('izin','sakit','cuti') COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_pengajuan` date NOT NULL,
  `mulai_tgl` date NOT NULL,
  `sampai_tgl` date NOT NULL,
  `keterangan` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('menunggu','diterima','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permohonan`
--

INSERT INTO `permohonan` (`id`, `id_pegawai`, `jenis`, `foto`, `tgl_pengajuan`, `mulai_tgl`, `sampai_tgl`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'izin', NULL, '2020-03-16', '2020-03-16', '2020-03-16', 'sa', 'diterima', '2020-03-16 14:10:53', '2020-03-16 14:28:10'),
(2, 2, 'izin', NULL, '2020-03-17', '2020-03-27', '2020-04-01', 'Keperluan keluarga', 'diterima', '2020-03-17 02:49:51', '2020-03-17 03:56:31'),
(3, 3, 'sakit', 'Permohonan-2020-03-18-10-01-26.png', '2020-03-18', '2020-03-25', '2020-03-27', NULL, 'ditolak', '2020-03-18 02:01:26', '2020-03-18 02:01:37'),
(4, 4, 'cuti', NULL, '2022-02-13', '2022-02-14', '2022-02-28', 'acara  keluarga', 'ditolak', '2022-02-13 08:13:02', '2022-02-13 08:13:24'),
(5, 6, 'izin', NULL, '2022-02-13', '2022-02-13', '2022-02-28', 'coba', 'ditolak', '2022-02-13 08:23:02', '2022-02-13 08:23:47'),
(6, 9, 'cuti', NULL, '2022-04-04', '2022-04-04', '2022-04-12', 'acara keluarga', 'diterima', '2022-04-04 01:29:45', '2022-04-04 01:30:52'),
(7, 4, 'sakit', NULL, '2022-04-04', '2022-04-04', '2022-04-05', 'sakit', 'diterima', '2022-04-04 08:46:23', '2022-04-04 09:02:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `id_absensi` int(11) NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `report`
--

INSERT INTO `report` (`id`, `id_absensi`, `keterangan`) VALUES
(2, 13, '<p>Jam 12 - 23 makan siang</p>\r\n\r\n<p>Jam 23 - 24 service tower</p>'),
(42, 11, '<p>Jam 2 istirahat</p>\r\n\r\n<p>jam 3 service tower</p>'),
(43, 14, '<p>ganti PC</p>'),
(44, 15, '<p>apa aja</p>'),
(45, 18, '<p>sdfsdfss</p>'),
(46, 20, '<p>asffqwqdd</p>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slider`
--

CREATE TABLE `slider` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `slider`
--

INSERT INTO `slider` (`id`, `image`, `created_at`, `updated_at`) VALUES
(8, 'Slider-2020-01-14-13-51-46.jpeg', '2020-01-14 06:51:46', '2020-01-14 06:51:46'),
(9, 'Slider-2020-01-14-13-52-08.jpeg', '2020-01-14 06:52:08', '2020-01-14 06:52:08'),
(10, 'Slider-2022-03-28-11-03-02.jpg', '2020-03-16 08:33:06', '2022-03-28 04:03:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tower`
--

CREATE TABLE `tower` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longtitude` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tower`
--

INSERT INTO `tower` (`id`, `nama`, `latitude`, `longtitude`, `created_at`, `updated_at`) VALUES
(1, 'Cempaka', 234324234234, 4324324343, '2020-03-17 02:02:27', '2020-03-17 02:11:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nik` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$2y$10$f7l8O14pKk7CBmR9gmybJupnHAqRGAmea5zdLFeYlp.0Utdqi3D/u',
  `level` enum('admin','pegawai','calon') COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `jabatan`, `email`, `email_verified_at`, `telepon`, `alamat`, `username`, `password`, `level`, `img`, `remember_token`, `created_at`, `updated_at`) VALUES
(19, '001', 'nur', 'nur', 'nur@gmail.com', NULL, '098765432111', 'nur', 'nur1', '$2y$10$1NdJ9Lg4X43sf0pus52bROC93mNd1sS5G3zreDHq1jPbrfcerTrfm', 'admin', 'user.png', 'QIOMroiZA0VyY0m9FNKeC5RpN6GVHPsAfyqikLgyLKIyQGSDNrSFrYPhGZXJ', '2019-11-15 14:17:25', '2019-11-15 14:17:25'),
(21, '001', 'Riska', 'S1', 'gaktu@gmail.com', NULL, '08213456745', 'gaktau', 'Ris1', '$2y$10$1NdJ9Lg4X43sf0pus52bROC93mNd1sS5G3zreDHq1jPbrfcerTrfm', 'pegawai', 'user.png', 'bVDwsa3IjE2f2p25ZuiB2bRmjAZPYl3Wrp7tJx42ri5gkFSukGjHKuDwAbO8', '2019-11-16 09:14:49', '2019-11-16 09:14:49'),
(24, NULL, 'Riskaa', NULL, 'Riskaa@gmail.com', NULL, NULL, NULL, 'Ris2', '$2y$10$1NdJ9Lg4X43sf0pus52bROC93mNd1sS5G3zreDHq1jPbrfcerTrfm', 'calon', 'user.png', 'srFPKIddr2CFbtbuuFI7AeOgqBMtjyoKbObouDK6097irWQvuLLyfOBjsK0R', '2020-01-14 06:53:36', '2020-01-14 06:53:36'),
(25, NULL, 'Riskaamelia', NULL, 'ris@gmail.com', NULL, NULL, NULL, 'ria1', '$2y$10$1NdJ9Lg4X43sf0pus52bROC93mNd1sS5G3zreDHq1jPbrfcerTrfm', 'calon', 'user.png', 'nRKA6AOVhhgfs3oYadkURk9ATuI8IGkvti1t1prRS6HZeXS8p8aNUxfp7wRE', '2020-01-27 05:22:22', '2020-01-27 05:22:22'),
(26, NULL, 'admin', 'S1', 'admin@mail.com', NULL, NULL, NULL, 'admin', '$2y$10$1NdJ9Lg4X43sf0pus52bROC93mNd1sS5G3zreDHq1jPbrfcerTrfm', 'admin', 'user.png', 'uo9QfzAvdtADV6bpsB2nYQTxb6itDPLPcrk7dfwXWcLxHDGo5KRq0eFY7PYG', '2020-03-14 03:29:29', '2020-03-14 03:29:29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `aplikasi`
--
ALTER TABLE `aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kantor`
--
ALTER TABLE `kantor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pegawai_username_unique` (`username`),
  ADD UNIQUE KEY `pegawai_email_unique` (`email`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indeks untuk tabel `permohonan`
--
ALTER TABLE `permohonan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tower`
--
ALTER TABLE `tower`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_telepon_unique` (`telepon`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `aplikasi`
--
ALTER TABLE `aplikasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `gaji`
--
ALTER TABLE `gaji`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kantor`
--
ALTER TABLE `kantor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `permohonan`
--
ALTER TABLE `permohonan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tower`
--
ALTER TABLE `tower`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
