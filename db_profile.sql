-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Nov 2025 pada 11.37
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
-- Database: `db_profile`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_aside`
--

CREATE TABLE `tbl_aside` (
  `id_aside` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nama_kegiatan` varchar(150) DEFAULT NULL,
  `judul_lagu` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `lagu` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_aside`
--

INSERT INTO `tbl_aside` (`id_aside`, `nim`, `foto`, `nama_kegiatan`, `judul_lagu`, `keterangan`, `lagu`) VALUES
(3, '2024081024', '1763978643_dashboard.png', 'ui ux', 'mario bros', 'sega', '1763978517_super-mario-bros_e5hrra6.mp3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_biodata`
--

CREATE TABLE `tbl_biodata` (
  `id_biodata` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `isi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_biodata`
--

INSERT INTO `tbl_biodata` (`id_biodata`, `nim`, `judul`, `isi`) VALUES
(3, '2024081024', 'sekretaris', 'hebat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_footer`
--

CREATE TABLE `tbl_footer` (
  `id_footer` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `spotify` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `copyright` varchar(150) DEFAULT NULL,
  `quote` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_footer`
--

INSERT INTO `tbl_footer` (`id_footer`, `nim`, `linkedin`, `spotify`, `instagram`, `copyright`, `quote`) VALUES
(1, '2024081024', 'serena mariana', 'marki', 'm4ki', '2025', 'saya suka mark');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_keahlian`
--

CREATE TABLE `tbl_keahlian` (
  `id_keahlian` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `isi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_keahlian`
--

INSERT INTO `tbl_keahlian` (`id_keahlian`, `nim`, `judul`, `isi`) VALUES
(2, '2024081024', 'word', 'jago bikin proposal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_konten`
--

CREATE TABLE `tbl_konten` (
  `id_konten` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `judul` varchar(150) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_konten`
--

INSERT INTO `tbl_konten` (`id_konten`, `nim`, `judul`, `isi`, `foto`) VALUES
(2, '2024081024', 'sekre', 'pahlawan himasif', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_nav_profile`
--

CREATE TABLE `tbl_nav_profile` (
  `id_nav` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL,
  `aktif` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_nav_profile`
--

INSERT INTO `tbl_nav_profile` (`id_nav`, `nim`, `menu`, `aktif`) VALUES
(1, '2024081024', 'dadawd', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pendidikan`
--

CREATE TABLE `tbl_pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `institusi` varchar(100) DEFAULT NULL,
  `jurusan` varchar(100) DEFAULT NULL,
  `tahun` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pendidikan`
--

INSERT INTO `tbl_pendidikan` (`id_pendidikan`, `nim`, `institusi`, `jurusan`, `tahun`) VALUES
(2, '2024081024', 'YADIKA', 'IPS 2', '2024');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengalaman`
--

CREATE TABLE `tbl_pengalaman` (
  `id_pengalaman` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pengalaman`
--

INSERT INTO `tbl_pengalaman` (`id_pengalaman`, `nim`, `judul`, `isi`, `foto`) VALUES
(2, '2024081024', 'Tidur', 'tidur 10 jam', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id_user` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `foto_background` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_users`
--

INSERT INTO `tbl_users` (`id_user`, `nim`, `nama_lengkap`, `foto_profil`, `foto_background`) VALUES
(3, '2024081024', 'lalang', '', ''),
(4, '2024081020', 'rehan', '', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_aside`
--
ALTER TABLE `tbl_aside`
  ADD PRIMARY KEY (`id_aside`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_biodata`
--
ALTER TABLE `tbl_biodata`
  ADD PRIMARY KEY (`id_biodata`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_footer`
--
ALTER TABLE `tbl_footer`
  ADD PRIMARY KEY (`id_footer`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_keahlian`
--
ALTER TABLE `tbl_keahlian`
  ADD PRIMARY KEY (`id_keahlian`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_konten`
--
ALTER TABLE `tbl_konten`
  ADD PRIMARY KEY (`id_konten`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_nav_profile`
--
ALTER TABLE `tbl_nav_profile`
  ADD PRIMARY KEY (`id_nav`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_pendidikan`
--
ALTER TABLE `tbl_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_pengalaman`
--
ALTER TABLE `tbl_pengalaman`
  ADD PRIMARY KEY (`id_pengalaman`),
  ADD KEY `nim` (`nim`);

--
-- Indeks untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_aside`
--
ALTER TABLE `tbl_aside`
  MODIFY `id_aside` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_biodata`
--
ALTER TABLE `tbl_biodata`
  MODIFY `id_biodata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_footer`
--
ALTER TABLE `tbl_footer`
  MODIFY `id_footer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_keahlian`
--
ALTER TABLE `tbl_keahlian`
  MODIFY `id_keahlian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_konten`
--
ALTER TABLE `tbl_konten`
  MODIFY `id_konten` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_nav_profile`
--
ALTER TABLE `tbl_nav_profile`
  MODIFY `id_nav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_pendidikan`
--
ALTER TABLE `tbl_pendidikan`
  MODIFY `id_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengalaman`
--
ALTER TABLE `tbl_pengalaman`
  MODIFY `id_pengalaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_aside`
--
ALTER TABLE `tbl_aside`
  ADD CONSTRAINT `tbl_aside_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_biodata`
--
ALTER TABLE `tbl_biodata`
  ADD CONSTRAINT `tbl_biodata_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_footer`
--
ALTER TABLE `tbl_footer`
  ADD CONSTRAINT `tbl_footer_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_keahlian`
--
ALTER TABLE `tbl_keahlian`
  ADD CONSTRAINT `tbl_keahlian_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_konten`
--
ALTER TABLE `tbl_konten`
  ADD CONSTRAINT `tbl_konten_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_nav_profile`
--
ALTER TABLE `tbl_nav_profile`
  ADD CONSTRAINT `tbl_nav_profile_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_pendidikan`
--
ALTER TABLE `tbl_pendidikan`
  ADD CONSTRAINT `tbl_pendidikan_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_pengalaman`
--
ALTER TABLE `tbl_pengalaman`
  ADD CONSTRAINT `tbl_pengalaman_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_users` (`nim`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
