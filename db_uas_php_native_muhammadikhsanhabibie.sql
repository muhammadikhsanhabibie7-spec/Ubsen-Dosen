-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Feb 2026 pada 20.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uas_php_native_muhammadikhsanhabibie`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `id_mhs` int(11) DEFAULT NULL,
  `status` enum('Hadir','Izin','Sakit','Alpha') DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `pertemuan_ke` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `id_jadwal`, `id_mhs`, `status`, `tanggal`, `pertemuan_ke`) VALUES
(1, NULL, 2, 'Hadir', '2026-01-26', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `beban_mengajar`
--

CREATE TABLE `beban_mengajar` (
  `id_beban` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `total_sks` int(11) NOT NULL DEFAULT 0,
  `id_ta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `beban_mengajar`
--

INSERT INTO `beban_mengajar` (`id_beban`, `id_dosen`, `total_sks`, `id_ta`) VALUES
(1, 1, 6, 1),
(2, 2, 8, 1),
(3, 6, 3, 1),
(4, 8, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nidn` varchar(20) DEFAULT NULL,
  `nama_dosen` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `gelar` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `status` enum('Tetap','Tidak Tetap') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nidn`, `nama_dosen`, `username`, `foto`, `gelar`, `email`, `no_hp`, `status`, `created_at`) VALUES
(1, '123456', 'Budi Santoso', NULL, 'foto_123456_1769633935.png', 'M.Kom', NULL, NULL, 'Tetap', '2026-01-22 11:25:49'),
(2, '654321', 'Siti Aminah', NULL, 'foto_654321_1769460235.png', 'M.Pd', NULL, NULL, 'Tidak Tetap', '2026-01-22 11:25:49'),
(6, 'IKHSAN', 'MUHAMMAD IKHSAN KAMIL', NULL, 'foto_IKHSAN_1769460227.png', 'M.kom', '2273@ma-almuddatsiriyah.sch.id', '088888888', 'Tetap', '2026-01-22 12:35:48'),
(8, '2411452', 'bang aril', NULL, 'foto_2411452_1769460213.png', 'I.kom', 'viasihabul@gmail.com', '08U242349', 'Tetap', '2026-01-22 13:21:13'),
(9, '431241', 'Akademik', NULL, 'foto_431241_1769457718.jpg', 'Akademik', 'mcwfw@gmail.com', '01235', '', '2026-01-25 14:38:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `id_ruang` int(11) DEFAULT NULL,
  `alamat_mengajar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `tanggal`, `hari`, `jam_mulai`, `jam_selesai`, `id_ruang`, `alamat_mengajar`) VALUES
(1, '2026-01-19', 'Senin', '13:30:00', '19:00:00', 1, 'JL.www.comm'),
(3, '2026-01-21', 'Rabu', '13:30:00', '19:00:00', 1, NULL),
(4, '2026-01-22', 'Kamis', '13:30:00', '19:00:00', 1, NULL),
(5, '2026-01-03', 'Sabtu', '08:25:00', '20:00:00', 2, 'JL.www.comm'),
(6, '2026-01-25', 'Minggu', '05:18:00', '19:17:00', 3, 'JL.www.comm'),
(7, '2026-01-01', 'Kamis', '09:16:00', '13:13:00', 2, 'JL.www.comm');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(20) DEFAULT NULL,
  `id_prodi` int(11) DEFAULT NULL,
  `angkatan` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `id_prodi`, `angkatan`) VALUES
(1, 'TI-2A', 1, '2024'),
(2, 'TI-2A', 1, '2024'),
(3, 'BD-1', NULL, '2025'),
(4, 'KA-1B', NULL, '2025'),
(5, 'KA-1B', NULL, '2024');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi_mengajar`
--

CREATE TABLE `lokasi_mengajar` (
  `id_lokasi` int(11) NOT NULL,
  `nama_lokasi` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lokasi_mengajar`
--

INSERT INTO `lokasi_mengajar` (`id_lokasi`, `nama_lokasi`, `alamat`, `keterangan`) VALUES
(1, 'Kampus Pusat', NULL, NULL),
(2, 'Kampus Pusat', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `nama_mahasiswa` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_prodi` int(11) DEFAULT NULL,
  `angkatan` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nim`, `nama_mahasiswa`, `no_hp`, `jurusan`, `id_kelas`, `id_prodi`, `angkatan`) VALUES
(2, '2025002', 'Siti Aminah', NULL, NULL, NULL, NULL, '2025');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id_mk` int(11) NOT NULL,
  `kode_mk` varchar(20) DEFAULT NULL,
  `nama_mk` varchar(100) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `jenis` enum('Wajib','Pilihan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_mk`, `kode_mk`, `nama_mk`, `sks`, `semester`, `jenis`) VALUES
(1, 'WEB1', 'Pemrograman Web', 3, 2, NULL),
(2, 'ALGO1', 'Algoritma', 4, 1, NULL),
(3, NULL, 'Bisnis Digital', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `id_mk` int(11) NOT NULL,
  `grade` char(2) NOT NULL,
  `semester` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nim`, `id_mk`, `grade`, `semester`) VALUES
(1, '2025002', 1, 'A', 'Ganjil 2025/2026'),
(2, '2025002', 2, 'B', 'Ganjil 2025/2026');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `nidn` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jabatan` enum('Admin','Dosen','Akademik') NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengampu`
--

CREATE TABLE `pengampu` (
  `id_pengampu` int(11) NOT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `id_mk` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_ta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengampu`
--

INSERT INTO `pengampu` (`id_pengampu`, `id_dosen`, `id_mk`, `id_kelas`, `id_ta`) VALUES
(2, 1, 1, 2, 1),
(5, 6, 1, 1, 1),
(6, 8, 1, 2, 1),
(7, 1, 2, 3, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ploting_mengajar`
--

CREATE TABLE `ploting_mengajar` (
  `id_ploting` int(11) NOT NULL,
  `id_pengampu` int(11) DEFAULT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `status` enum('Disetujui','Menunggu','Ditolak') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ploting_mengajar`
--

INSERT INTO `ploting_mengajar` (`id_ploting`, `id_pengampu`, `id_jadwal`, `status`) VALUES
(5, 5, 1, 'Disetujui'),
(6, 6, 5, 'Disetujui'),
(7, 6, 6, 'Disetujui'),
(8, 2, 7, 'Disetujui');

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_studi`
--

CREATE TABLE `program_studi` (
  `id_prodi` int(11) NOT NULL,
  `kode_prodi` varchar(20) DEFAULT NULL,
  `nama_prodi` varchar(100) DEFAULT NULL,
  `jenjang` enum('D3','S1','S2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `program_studi`
--

INSERT INTO `program_studi` (`id_prodi`, `kode_prodi`, `nama_prodi`, `jenjang`) VALUES
(1, NULL, 'Teknik Informatika', 'S1'),
(2, NULL, 'Teknik Informatika', 'S1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_kelas`
--

CREATE TABLE `ruang_kelas` (
  `id_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(50) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  `id_lokasi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruang_kelas`
--

INSERT INTO `ruang_kelas` (`id_ruang`, `nama_ruang`, `kapasitas`, `id_lokasi`) VALUES
(1, 'Lab Komputer 1', 40, 1),
(2, 'Lab Komputer 1', 40, 1),
(3, 'Ruang-303', NULL, NULL),
(4, 'Ruang-303', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id_ta` int(11) NOT NULL,
  `tahun` varchar(9) DEFAULT NULL,
  `semester` enum('Ganjil','Genap') DEFAULT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tahun_akademik`
--

INSERT INTO `tahun_akademik` (`id_ta`, `tahun`, `semester`, `status`) VALUES
(1, '2025/2026', 'Genap', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin'),
(3, 'IKHSAN', 'c20ad4d76fe97759aa27a0c99bff6710', 'Dosen'),
(4, '023165', 'c20ad4d76fe97759aa27a0c99bff6710', 'Pegawai'),
(12, '2411452', 'c20ad4d76fe97759aa27a0c99bff6710', 'Dosen'),
(19, '123456', 'c20ad4d76fe97759aa27a0c99bff6710', 'Dosen');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`);

--
-- Indeks untuk tabel `beban_mengajar`
--
ALTER TABLE `beban_mengajar`
  ADD PRIMARY KEY (`id_beban`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_ta` (`id_ta`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `nidn` (`nidn`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_ruang` (`id_ruang`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_prodi` (`id_prodi`);

--
-- Indeks untuk tabel `lokasi_mengajar`
--
ALTER TABLE `lokasi_mengajar`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id_mk`),
  ADD UNIQUE KEY `kode_mk` (`kode_mk`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nidn`);

--
-- Indeks untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  ADD PRIMARY KEY (`id_pengampu`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_mk` (`id_mk`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_ta` (`id_ta`);

--
-- Indeks untuk tabel `ploting_mengajar`
--
ALTER TABLE `ploting_mengajar`
  ADD PRIMARY KEY (`id_ploting`),
  ADD KEY `id_pengampu` (`id_pengampu`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indeks untuk tabel `ruang_kelas`
--
ALTER TABLE `ruang_kelas`
  ADD PRIMARY KEY (`id_ruang`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indeks untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id_ta`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `beban_mengajar`
--
ALTER TABLE `beban_mengajar`
  MODIFY `id_beban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `lokasi_mengajar`
--
ALTER TABLE `lokasi_mengajar`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id_mk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  MODIFY `id_pengampu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `ploting_mengajar`
--
ALTER TABLE `ploting_mengajar`
  MODIFY `id_ploting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ruang_kelas`
--
ALTER TABLE `ruang_kelas`
  MODIFY `id_ruang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  MODIFY `id_ta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `beban_mengajar`
--
ALTER TABLE `beban_mengajar`
  ADD CONSTRAINT `beban_mengajar_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `beban_mengajar_ibfk_2` FOREIGN KEY (`id_ta`) REFERENCES `tahun_akademik` (`id_ta`);

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_ruang`) REFERENCES `ruang_kelas` (`id_ruang`);

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `program_studi` (`id_prodi`);

--
-- Ketidakleluasaan untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  ADD CONSTRAINT `pengampu_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `pengampu_ibfk_2` FOREIGN KEY (`id_mk`) REFERENCES `mata_kuliah` (`id_mk`),
  ADD CONSTRAINT `pengampu_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `pengampu_ibfk_4` FOREIGN KEY (`id_ta`) REFERENCES `tahun_akademik` (`id_ta`);

--
-- Ketidakleluasaan untuk tabel `ploting_mengajar`
--
ALTER TABLE `ploting_mengajar`
  ADD CONSTRAINT `ploting_mengajar_ibfk_1` FOREIGN KEY (`id_pengampu`) REFERENCES `pengampu` (`id_pengampu`),
  ADD CONSTRAINT `ploting_mengajar_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`);

--
-- Ketidakleluasaan untuk tabel `ruang_kelas`
--
ALTER TABLE `ruang_kelas`
  ADD CONSTRAINT `ruang_kelas_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi_mengajar` (`id_lokasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
