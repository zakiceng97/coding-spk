/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100133
 Source Host           : localhost:3306
 Source Schema         : spk_mbr

 Target Server Type    : MySQL
 Target Server Version : 100133
 File Encoding         : 65001

 Date: 01/06/2022 19:27:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 0_tahun
-- ----------------------------
DROP TABLE IF EXISTS `0_tahun`;
CREATE TABLE `0_tahun`  (
  `id_tahun` bigint NOT NULL AUTO_INCREMENT,
  `tahun` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tahun_renstra` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tahun`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of 0_tahun
-- ----------------------------
INSERT INTO `0_tahun` VALUES (1, '2021', '2011-2022');

-- ----------------------------
-- Table structure for 0_tipe_kriteria
-- ----------------------------
DROP TABLE IF EXISTS `0_tipe_kriteria`;
CREATE TABLE `0_tipe_kriteria`  (
  `id_tipe` int NOT NULL AUTO_INCREMENT,
  `nama_tipe` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_tipe`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 0_tipe_kriteria
-- ----------------------------
INSERT INTO `0_tipe_kriteria` VALUES (1, 'Biaya (Cost)');
INSERT INTO `0_tipe_kriteria` VALUES (2, 'Keuntungan (Benefit)');

-- ----------------------------
-- Table structure for 1_kriteria
-- ----------------------------
DROP TABLE IF EXISTS `1_kriteria`;
CREATE TABLE `1_kriteria`  (
  `id_kriteria` int NOT NULL AUTO_INCREMENT,
  `kode_kriteria` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kriteria` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bobot_kriteria` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe_kriteria` int NOT NULL,
  PRIMARY KEY (`id_kriteria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 1_kriteria
-- ----------------------------
INSERT INTO `1_kriteria` VALUES (1, 'C1', 'Status Kepemilikan Rumah', '10', 1);
INSERT INTO `1_kriteria` VALUES (2, 'C2', 'Pekerjaan Ayah', '10', 1);
INSERT INTO `1_kriteria` VALUES (3, 'C3', 'Pekerjaan Ibu', '10', 1);
INSERT INTO `1_kriteria` VALUES (4, 'C4', 'Pekerjaan wali', '10', 1);
INSERT INTO `1_kriteria` VALUES (5, 'C5', 'Pemasukkan Per-bulan', '15', 1);
INSERT INTO `1_kriteria` VALUES (6, 'C6', 'Pengeluaran Per-bulan', '15', 2);
INSERT INTO `1_kriteria` VALUES (7, 'C7', 'Surat Keterangan Tidak Mampu (SKTM)', '30', 2);
INSERT INTO `1_kriteria` VALUES (9, 'C8', 'Iya', '10', 2);

-- ----------------------------
-- Table structure for 2_kelas
-- ----------------------------
DROP TABLE IF EXISTS `2_kelas`;
CREATE TABLE `2_kelas`  (
  `id_kelas` int NOT NULL AUTO_INCREMENT,
  `nama_kelas` int NOT NULL,
  PRIMARY KEY (`id_kelas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 2_kelas
-- ----------------------------
INSERT INTO `2_kelas` VALUES (1, 7);
INSERT INTO `2_kelas` VALUES (2, 8);
INSERT INTO `2_kelas` VALUES (3, 9);

-- ----------------------------
-- Table structure for 2_tabel_log
-- ----------------------------
DROP TABLE IF EXISTS `2_tabel_log`;
CREATE TABLE `2_tabel_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_tipe` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_iddata` int NULL DEFAULT NULL COMMENT 'id insert atau id update',
  `log_ket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of 2_tabel_log
-- ----------------------------
INSERT INTO `2_tabel_log` VALUES (1, '2022-02-07 10:14:19', '1', 'edit', 1, 'Edit Master kriteria id = 1', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'10\'\nWHERE `id_kriteria` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (2, '2022-02-07 10:14:19', '1', 'add', 3, 'Input Master kriteria id = 3', 'INSERT INTO `1_kriteria` (`nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'Pekerjaan Ayah\', \'10\', \'1\')');
INSERT INTO `2_tabel_log` VALUES (3, '2022-02-07 10:14:19', '1', 'delete', 1, 'Hapus Master Data Siswa id = 1', 'DELETE FROM `data_siswa`\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (4, '2022-02-07 10:14:19', '1', 'add', 4, 'Input Master data id = 4', 'INSERT INTO `data_siswa` (`tgl_masuk`, `nisn`, `nis`, `nik_siswa`, `nama_siswa`, `kelas_siswa`, `rombel`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir_siswa`, `agama`, `anak_ke`, `alamat`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kodepos`, `kota`, `jenis_tinggal`, `rumah_kriteria`, `transportasi`, `pilih_sktm`, `sktm_kriteria`, `sktm`, `pilih_kartu_bantuan`, `kartu_bantuan`, `nik_ayah`, `nama_ayah`, `tgl_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `kerja_ayah_kriteria`, `gaji_ayah`, `hp_ayah`, `nik_ibu`, `nama_ibu`, `tgl_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `kerja_ibu_kriteria`, `gaji_ibu`, `hp_ibu`, `nik_wali`, `nama_wali`, `tgl_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `kerja_wali_kriteria`, `gaji_wali`, `hp_wali`, `total_gaji`, `gaji_masuk_kriteria`, `pengeluaran`, `gaji_keluar_kriteria`, `jml_anak_sekolah`) VALUES (\'\', \'0082563396\', \'6032\', \'3578122007080001\', \'BAYU PRASETIO\', \'1\', \'B\', \'1\', \'SURABAYA\', \'2008-07-20\', \'1\', \'1\', \'PASAR BABAAN 97\', \'6\', \'5\', \'Krembangan Utara\', \'Pabean Cantian\', \'60163\', \'SURABAYA\', \'1\', \'1\', \'3\', \'1\', \'7\', \'\', \'2\', \'\', \'3578241407770002\', \'SALUKI \', \'1977-01-01\', \'5\', \'4\', \'2\', \'2500000\', \'081111111111\', \'3578126812730002\', \'SITI CHOSIDAH\', \'1973-01-01\', \'3\', \'12\', \'3\', \'0\', \'081111111111\', \'\', \'\', \'\', \'\', \'\', \'\', \'0\', \'\', \'2500000\', \'5\', \'3000000\', \'6\', \'3\')');
INSERT INTO `2_tabel_log` VALUES (5, '2022-02-07 10:14:19', '1', 'delete', 4, 'Hapus Master Data Siswa id = 4', 'DELETE FROM `data_siswa`\nWHERE `id_siswa` = \'4\'');
INSERT INTO `2_tabel_log` VALUES (6, '2022-02-07 10:14:19', '1', 'edit', 3, 'Edit Master data Siswa id = 3', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0082563396\', `nis` = \'6032\', `nik_siswa` = \'\', `nama_siswa` = \'BAYU PRASETIO\', `kelas_siswa` = \'\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-07-20\', `agama` = \'1\', `anak_ke` = \'1\', `alamat` = \'PASAR BABAAN 97\', `rt` = \'6\', `rw` = \'5\', `kelurahan` = \'Krembangan Utara\', `kecamatan` = \'Pabean Cantian\', `kodepos` = \'60163\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'3\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'\', `nik_ayah` = \'3578241407770002\', `nama_ayah` = \'SALUKI \', `tgl_lahir_ayah` = \'1977-01-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'081111111111\', `nik_ibu` = \'3578126812730002\', `nama_ibu` = \'SITI CHOSIDAH\', `tgl_lahir_ibu` = \'1973-01-01\', `pendidikan_ibu` = \'3\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'081111111111\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'2500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'2\'\nWHERE `id_siswa` = \'3\'');
INSERT INTO `2_tabel_log` VALUES (7, '2022-02-07 10:14:19', '1', 'edit', 5, 'Input Master data id = 5', 'INSERT INTO `data_siswa` (`tgl_masuk`, `nisn`, `nis`, `nik_siswa`, `nama_siswa`, `kelas_siswa`, `rombel`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir_siswa`, `agama`, `anak_ke`, `alamat`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kodepos`, `kota`, `jenis_tinggal`, `rumah_kriteria`, `transportasi`, `pilih_sktm`, `sktm_kriteria`, `sktm`, `pilih_kartu_bantuan`, `kartu_bantuan`, `nik_ayah`, `nama_ayah`, `tgl_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `kerja_ayah_kriteria`, `gaji_ayah`, `hp_ayah`, `nik_ibu`, `nama_ibu`, `tgl_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `kerja_ibu_kriteria`, `gaji_ibu`, `hp_ibu`, `nik_wali`, `nama_wali`, `tgl_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `kerja_wali_kriteria`, `gaji_wali`, `hp_wali`, `total_gaji`, `gaji_masuk_kriteria`, `pengeluaran`, `gaji_keluar_kriteria`, `jml_anak_sekolah`) VALUES (\'\', \'0082563396\', \'6032\', \'\', \'BAYU PRASETIO\', \'\', \'B\', \'1\', \'SURABAYA\', \'2008-07-20\', \'1\', \'1\', \'PASAR BABAAN 97\', \'6\', \'5\', \'Krembangan Utara\', \'Pabean Cantian\', \'60163\', \'SURABAYA\', \'1\', \'\', \'3\', \'1\', \'\', \'\', \'2\', \'\', \'3578241407770002\', \'SALUKI \', \'1977-01-01\', \'5\', \'4\', \'\', \'2500000\', \'081111111111\', \'3578126812730002\', \'SITI CHOSIDAH\', \'1973-01-01\', \'3\', \'12\', \'\', \'0\', \'081111111111\', \'\', \'\', \'\', \'\', \'\', \'\', \'0\', \'\', \'2500000\', \'\', \'3000000\', \'\', \'3\')');
INSERT INTO `2_tabel_log` VALUES (8, '2022-02-07 10:14:19', '1', 'edit', 6, 'Input Master data id = 6', 'INSERT INTO `data_siswa` (`tgl_masuk`, `nisn`, `nis`, `nik_siswa`, `nama_siswa`, `kelas_siswa`, `rombel`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir_siswa`, `agama`, `anak_ke`, `alamat`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kodepos`, `kota`, `jenis_tinggal`, `rumah_kriteria`, `transportasi`, `pilih_sktm`, `sktm_kriteria`, `sktm`, `pilih_kartu_bantuan`, `kartu_bantuan`, `nik_ayah`, `nama_ayah`, `tgl_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `kerja_ayah_kriteria`, `gaji_ayah`, `hp_ayah`, `nik_ibu`, `nama_ibu`, `tgl_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `kerja_ibu_kriteria`, `gaji_ibu`, `hp_ibu`, `nik_wali`, `nama_wali`, `tgl_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `kerja_wali_kriteria`, `gaji_wali`, `hp_wali`, `total_gaji`, `gaji_masuk_kriteria`, `pengeluaran`, `gaji_keluar_kriteria`, `jml_anak_sekolah`) VALUES (\'\', \'0082563396\', \'6032\', \'\', \'BAYU PRASETIO\', \'\', \'B\', \'1\', \'SURABAYA\', \'2008-07-20\', \'1\', \'1\', \'PASAR BABAAN 97\', \'6\', \'5\', \'Krembangan Utara\', \'Pabean Cantian\', \'60163\', \'SURABAYA\', \'1\', \'\', \'3\', \'1\', \'\', \'\', \'2\', \'\', \'3578241407770002\', \'SALUKI \', \'1977-01-01\', \'5\', \'4\', \'\', \'2500000\', \'081111111111\', \'3578126812730002\', \'SITI CHOSIDAH\', \'1973-01-01\', \'3\', \'12\', \'\', \'0\', \'081111111111\', \'\', \'\', \'\', \'\', \'\', \'\', \'0\', \'\', \'2500000\', \'\', \'3000000\', \'\', \'3\')');
INSERT INTO `2_tabel_log` VALUES (9, '2022-02-07 10:14:19', '1', 'add', 7, 'Input Master data id = 7', 'INSERT INTO `data_siswa` (`tgl_masuk`, `nisn`, `nis`, `nik_siswa`, `nama_siswa`, `kelas_siswa`, `rombel`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir_siswa`, `agama`, `anak_ke`, `alamat`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kodepos`, `kota`, `jenis_tinggal`, `rumah_kriteria`, `transportasi`, `pilih_sktm`, `sktm_kriteria`, `sktm`, `pilih_kartu_bantuan`, `kartu_bantuan`, `nik_ayah`, `nama_ayah`, `tgl_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `kerja_ayah_kriteria`, `gaji_ayah`, `hp_ayah`, `nik_ibu`, `nama_ibu`, `tgl_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `kerja_ibu_kriteria`, `gaji_ibu`, `hp_ibu`, `nik_wali`, `nama_wali`, `tgl_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `kerja_wali_kriteria`, `gaji_wali`, `hp_wali`, `total_gaji`, `gaji_masuk_kriteria`, `pengeluaran`, `gaji_keluar_kriteria`, `jml_anak_sekolah`) VALUES (\'\', \'0081696182\', \'6059\', \'3578206802090004\', \'NESHA AULIA FEBRIANA\', \'2\', \'A\', \'2\', \'SURABAYA\', \'2009-02-28\', \'1\', \'2\', \'GEMPOL\', \'2\', \'3\', \'Balas Klumprik\', \'WIYUNG\', \'60222\', \'SURABAYA\', \'1\', \'1\', \'3\', \'2\', \'7\', \'\', \'2\', \'\', \'3578203004840001\', \'AGUS HERMANSYAH\', \'1984-04-30\', \'3\', \'4\', \'2\', \'2500000\', \'081111111112\', \'3517115310860005\', \'INDAH LESTARI\', \'1986-10-13\', \'5\', \'4\', \'3\', \'2500000\', \'081111111112\', \'\', \'RIANTO \', \'1984-04-30\', \'3\', \'4\', \'4\', \'2500000\', \'081111111112\', \'7500000\', \'5\', \'8000000\', \'6\', \'5\')');
INSERT INTO `2_tabel_log` VALUES (10, '2022-02-07 10:14:19', '1', 'add', 8, 'Input Master data id = 8', 'INSERT INTO `data_siswa` (`tgl_masuk`, `nisn`, `nis`, `nik_siswa`, `nama_siswa`, `kelas_siswa`, `rombel`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir_siswa`, `agama`, `anak_ke`, `alamat`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kodepos`, `kota`, `jenis_tinggal`, `rumah_kriteria`, `transportasi`, `pilih_sktm`, `sktm_kriteria`, `sktm`, `pilih_kartu_bantuan`, `kartu_bantuan`, `nik_ayah`, `nama_ayah`, `tgl_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `kerja_ayah_kriteria`, `gaji_ayah`, `hp_ayah`, `nik_ibu`, `nama_ibu`, `tgl_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `kerja_ibu_kriteria`, `gaji_ibu`, `hp_ibu`, `nik_wali`, `nama_wali`, `tgl_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `kerja_wali_kriteria`, `gaji_wali`, `hp_wali`, `total_gaji`, `gaji_masuk_kriteria`, `pengeluaran`, `gaji_keluar_kriteria`, `jml_anak_sekolah`) VALUES (\'\', \'1\', \'1\', \'1\', \'A\', \'3\', \'C\', \'1\', \'PACITAN\', \'2000-05-01\', \'1\', \'1\', \'W\', \'4\', \'3\', \'J\', \'J\', \'6\', \'T\', \'1\', \'1\', \'1\', \'1\', \'7\', \'\', \'2\', \'\', \'1\', \'L\', \'0198-10-10\', \'1\', \'1\', \'2\', \'2500000\', \'081111111112\', \'2\', \'I\', \'1982-01-01\', \'4\', \'6\', \'3\', \'1000000\', \'081111111111\', \'\', \'\', \'\', \'\', \'\', \'\', \'0\', \'\', \'3500000\', \'5\', \'2500000\', \'6\', \'2\')');
INSERT INTO `2_tabel_log` VALUES (11, '2022-02-07 10:14:19', '1', 'edit', 3, 'Edit Master Data Siswa id = 3', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0082563396\', `nis` = \'6032\', `nik_siswa` = \'3578122007080001\', `nama_siswa` = \'BAYU PRASETIO1\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-07-20\', `agama` = \'1\', `anak_ke` = \'1\', `alamat` = \'PASAR BABAAN 97\', `rt` = \'6\', `rw` = \'5\', `kelurahan` = \'Krembangan Utara\', `kecamatan` = \'Pabean Cantian\', `kodepos` = \'60163\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'3\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'\', `nik_ayah` = \'3578241407770002\', `nama_ayah` = \'SALUKI \', `tgl_lahir_ayah` = \'1977-01-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'081111111111\', `nik_ibu` = \'3578126812730002\', `nama_ibu` = \'SITI CHOSIDAH\', `tgl_lahir_ibu` = \'1973-01-01\', `pendidikan_ibu` = \'3\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'081111111111\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'2500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'2\'\nWHERE `id_siswa` = \'3\'');
INSERT INTO `2_tabel_log` VALUES (12, '2022-02-07 10:14:19', '1', 'edit', 3, 'Edit Master Data Siswa id = 3', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0082563396\', `nis` = \'6032\', `nik_siswa` = \'3578122007080001\', `nama_siswa` = \'BAYU PRASETIO\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-07-20\', `agama` = \'1\', `anak_ke` = \'1\', `alamat` = \'PASAR BABAAN 97\', `rt` = \'6\', `rw` = \'5\', `kelurahan` = \'Krembangan Utara\', `kecamatan` = \'Pabean Cantian\', `kodepos` = \'60163\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'3\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'\', `nik_ayah` = \'3578241407770002\', `nama_ayah` = \'SALUKI \', `tgl_lahir_ayah` = \'1977-01-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'081111111111\', `nik_ibu` = \'3578126812730002\', `nama_ibu` = \'SITI CHOSIDAH\', `tgl_lahir_ibu` = \'1973-01-01\', `pendidikan_ibu` = \'3\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'081111111111\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'2500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'2\'\nWHERE `id_siswa` = \'3\'');
INSERT INTO `2_tabel_log` VALUES (13, '2022-02-07 10:14:19', '1', 'edit', 3, 'Edit Master Data Siswa id = 3', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0082563396\', `nis` = \'6032\', `nik_siswa` = \'3578122007080001\', `nama_siswa` = \'BAYU PRASETIO\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-07-20\', `agama` = \'1\', `anak_ke` = \'1\', `alamat` = \'PASAR BABAAN 97\', `rt` = \'6\', `rw` = \'5\', `kelurahan` = \'Krembangan Utara\', `kecamatan` = \'Pabean Cantian\', `kodepos` = \'60163\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'3\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'\', `nik_ayah` = \'3578241407770002\', `nama_ayah` = \'SALUKI \', `tgl_lahir_ayah` = \'1977-01-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'081111111111\', `nik_ibu` = \'3578126812730002\', `nama_ibu` = \'SITI CHOSIDAH\', `tgl_lahir_ibu` = \'1973-01-01\', `pendidikan_ibu` = \'3\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'081111111111\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'2500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'3\'');
INSERT INTO `2_tabel_log` VALUES (14, '2022-02-07 10:14:19', '1', 'edit', 3, 'Edit Master Data Siswa id = 3', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0082563396\', `nis` = \'6032\', `nik_siswa` = \'3578122007080001\', `nama_siswa` = \'BAYU PRASETIO\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-07-20\', `agama` = \'1\', `anak_ke` = \'1\', `alamat` = \'PASAR BABAAN 97\', `rt` = \'6\', `rw` = \'5\', `kelurahan` = \'Krembangan Utara\', `kecamatan` = \'Pabean Cantian\', `kodepos` = \'60163\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'3\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'\', `nik_ayah` = \'3578241407770002\', `nama_ayah` = \'SALUKI \', `tgl_lahir_ayah` = \'1977-01-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'081111111111\', `nik_ibu` = \'3578126812730002\', `nama_ibu` = \'SITI CHOSIDAH\', `tgl_lahir_ibu` = \'1973-01-01\', `pendidikan_ibu` = \'3\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'081111111111\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'1000000\', `hp_wali` = \'\', `total_gaji` = \'3500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'3\'');
INSERT INTO `2_tabel_log` VALUES (15, '2022-02-07 10:14:19', '1', 'edit', 3, 'Edit Master Data Siswa id = 3', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0082563396\', `nis` = \'6032\', `nik_siswa` = \'3578122007080001\', `nama_siswa` = \'BAYU PRASETIO\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-07-20\', `agama` = \'1\', `anak_ke` = \'1\', `alamat` = \'PASAR BABAAN 97\', `rt` = \'6\', `rw` = \'5\', `kelurahan` = \'Krembangan Utara\', `kecamatan` = \'Pabean Cantian\', `kodepos` = \'60163\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'3\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'\', `nik_ayah` = \'3578241407770002\', `nama_ayah` = \'SALUKI \', `tgl_lahir_ayah` = \'1977-01-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'081111111111\', `nik_ibu` = \'3578126812730002\', `nama_ibu` = \'SITI CHOSIDAH\', `tgl_lahir_ibu` = \'1973-01-01\', `pendidikan_ibu` = \'3\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'1000000\', `hp_ibu` = \'081111111111\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'1000000\', `hp_wali` = \'\', `total_gaji` = \'4500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'3\'');
INSERT INTO `2_tabel_log` VALUES (16, '2022-02-07 10:14:19', '1', 'edit', 10, 'Edit Master Data Siswa id = 10', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0092961081\', `nis` = \'6019\', `nik_siswa` = \'3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2021-12-24\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'ok\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'\', `nik_ayah` = \'3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'2021-12-01\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'081111111111\', `nik_ibu` = \'3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'2021-12-09\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'1000000\', `hp_ibu` = \'081111111111\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'6000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'2659583\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'10\'\nWHERE `id_siswa` = \'10\'');
INSERT INTO `2_tabel_log` VALUES (17, '2022-02-22 08:54:37', '1', 'edit', 7, 'Edit Master kriteria id = 7', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'40\'\nWHERE `id_kriteria` = \'7\'');
INSERT INTO `2_tabel_log` VALUES (18, '2022-02-22 08:54:48', '1', 'edit', 7, 'Edit Master kriteria id = 7', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'30\'\nWHERE `id_kriteria` = \'7\'');
INSERT INTO `2_tabel_log` VALUES (19, '2022-02-22 08:55:06', '1', 'add', 8, 'Input Master kriteria id = 8', 'INSERT INTO `1_kriteria` (`nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'oke\', \'10\', \'1\')');
INSERT INTO `2_tabel_log` VALUES (20, '2022-02-22 09:00:39', '1', 'edit', 8, 'Edit Master kriteria id = 8', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'20\'\nWHERE `id_kriteria` = \'8\'');
INSERT INTO `2_tabel_log` VALUES (21, '2022-02-22 09:02:52', '1', 'edit', 8, 'Edit Master kriteria id = 8', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'30\'\nWHERE `id_kriteria` = \'8\'');
INSERT INTO `2_tabel_log` VALUES (22, '2022-02-22 09:06:06', '1', 'delete', 64, 'Hapus Master Data Siswa id = 64', 'DELETE FROM `data_siswa`\nWHERE `id_siswa` = \'64\'');
INSERT INTO `2_tabel_log` VALUES (23, '2022-02-22 09:13:58', '1', 'add', 9, 'Input Master kriteria id = 9', 'INSERT INTO `1_kriteria` (`kode_kriteria`, `nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'C8\', \'iya\', \'9\', \'1\')');
INSERT INTO `2_tabel_log` VALUES (24, '2022-02-22 09:14:14', '1', 'edit', 9, 'Edit Master kriteria id = 9', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'10\'\nWHERE `id_kriteria` = \'9\'');
INSERT INTO `2_tabel_log` VALUES (25, '2022-02-22 09:17:14', '1', 'edit', 1, 'Edit Master Data Siswa id = 1', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0092961081\', `nis` = \'6019\', `nik_siswa` = \'`3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2009-01-06\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'iya\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'661779997dc32d9e1e9aab3e0934fc53.jpg\', `pilih_kartu_bantuan` = \'1\', `kartu_bantuan` = \'e51744ad96417a10844a39405e7c83d6.jpg\', `nik_ayah` = \'`3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'1973-06-10\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'1980-04-05\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'0\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (26, '2022-02-23 20:44:10', '1', 'add', 10, 'Input Master kriteria id = 10', 'INSERT INTO `1_kriteria` (`kode_kriteria`, `nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'C8\', \'qwe\', \'10\', \'2\')');
INSERT INTO `2_tabel_log` VALUES (27, '2022-02-23 20:44:18', '1', 'delete', 10, 'Hapus Master kriteria id = 10', 'DELETE FROM `1_kriteria`\nWHERE `id_kriteria` = \'10\'');
INSERT INTO `2_tabel_log` VALUES (28, '2022-02-23 20:44:54', '1', 'edit', 1, 'Edit Master Data Siswa id = 1', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0092961081\', `nis` = \'6019\', `nik_siswa` = \'`3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2009-01-06\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'iya\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'06d054d9d77f069c1c31f83f5fdbda9c.jpg\', `pilih_kartu_bantuan` = \'1\', `kartu_bantuan` = \'b16ae68db54732497ab152a210cd2f9f.jpg\', `nik_ayah` = \'`3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'1973-06-10\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'1980-04-05\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'0\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (29, '2022-02-23 20:45:08', '1', 'edit', 1, 'Edit Master Data Siswa id = 1', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0092961081\', `nis` = \'6019\', `nik_siswa` = \'`3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN cek\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2009-01-06\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'iya\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'1\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'1973-06-10\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'1980-04-05\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'0\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (30, '2022-02-23 20:45:20', '1', 'edit', 1, 'Edit Master Data Siswa id = 1', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0092961081\', `nis` = \'6019\', `nik_siswa` = \'`3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2009-01-06\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'iya\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'1\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'1973-06-10\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'1980-04-05\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'0\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (31, '2022-02-23 21:04:57', '1', 'edit', 1, 'Edit Master Data Siswa id = 1', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0092961081\', `nis` = \'6019\', `nik_siswa` = \'`3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2009-01-06\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'iya\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'2f50fce4b959829e4f8690b40ce2c269.jpg\', `pilih_kartu_bantuan` = \'1\', `kartu_bantuan` = \'d675dcad2baac9b5c42fd77127c6f000.jpg\', `nik_ayah` = \'`3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'1973-06-10\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'1980-04-05\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'0\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (32, '2022-03-06 19:53:27', '1', 'edit', 1, 'Edit Master Data Siswa id = 1', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0092961081\', `nis` = \'6019\', `nik_siswa` = \'`3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2009-01-06\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'iya\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'1\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'1\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'1973-06-10\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'1980-04-05\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3400000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (33, '2022-03-06 19:54:25', '1', 'edit', 1, 'Edit Master Data Siswa id = 1', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'0092961081\', `nis` = \'6019\', `nik_siswa` = \'`3208180601090001\', `nama_siswa` = \'ABDUL HARIS AL-HASAN\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'KUNINGAN\', `tgl_lahir_siswa` = \'2009-01-06\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'LINGK. MUSLIM\', `rt` = \'11\', `rw` = \'4\', `kelurahan` = \'iya\', `kecamatan` = \'ok\', `kodepos` = \'45552\', `kota` = \'KUNINGAN\', `jenis_tinggal` = \'5\', `rumah_kriteria` = \'\', `transportasi` = \'2\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3208181006730004\', `nama_ayah` = \'UMAN\', `tgl_lahir_ayah` = \'1973-06-10\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3208184504800004\', `nama_ibu` = \'TITING BUDIARTI\', `tgl_lahir_ibu` = \'1980-04-05\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3400000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'3\'\nWHERE `id_siswa` = \'1\'');
INSERT INTO `2_tabel_log` VALUES (34, '2022-03-06 19:55:14', '1', 'edit', 3, 'Edit Master Data Siswa id = 3', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0085450023\', `nis` = \'6080\', `nik_siswa` = \'`3578021907080006\', `nama_siswa` = \'ADHIKA PRASETYO FATKULLOH\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-07-19\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'SIWALANKERTO UTARA 59-D\', `rt` = \'4\', `rw` = \'3\', `kelurahan` = \'Siwalankerto\', `kecamatan` = \'Kec. Wonocolo\', `kodepos` = \'60236\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3578020605790001\', `nama_ayah` = \'SIGIT PRASETYO\', `tgl_lahir_ayah` = \'1905-06-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'\', `nik_ibu` = \'`3578024804790005\', `nama_ibu` = \'NIKMATUS SOLIKAH\', `tgl_lahir_ibu` = \'1905-06-01\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'2500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'4000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'3\'');
INSERT INTO `2_tabel_log` VALUES (35, '2022-03-06 19:56:14', '1', 'edit', 4, 'Edit Master Data Siswa id = 4', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0085365508\', `nis` = \'6020\', `nik_siswa` = \'`3501104107080010\', `nama_siswa` = \'ADINDA PUTRI YULIANA\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'2\', `tempat_lahir` = \'PACITAN\', `tgl_lahir_siswa` = \'2008-07-01\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'JL. SIWALAN KERTO NO. 85\', `rt` = \'7\', `rw` = \'1\', `kelurahan` = \'Siwalankerto\', `kecamatan` = \'Kec. Wonocolo\', `kodepos` = \'60236\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3501101505790005\', `nama_ayah` = \'SUGIONO\', `tgl_lahir_ayah` = \'1979-05-15\', `pendidikan_ayah` = \'4\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'2500000\', `hp_ayah` = \'\', `nik_ibu` = \'`3501106304830002\', `nama_ibu` = \'IKE TRIWAHYUNI\', `tgl_lahir_ibu` = \'1983-04-23\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'5\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'2500000\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'1400000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'4\'');
INSERT INTO `2_tabel_log` VALUES (36, '2022-03-06 19:57:04', '1', 'edit', 5, 'Edit Master Data Siswa id = 5', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0085122713\', `nis` = \'6021\', `nik_siswa` = \'`3578025308080003\', `nama_siswa` = \'AGATHA HAYU RABTYBEL\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'2\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-08-13\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'JEMUR WONOSARI GG.IAIN 11-B\', `rt` = \'8\', `rw` = \'3\', `kelurahan` = \'Jemur Wonosari\', `kecamatan` = \'Kec. Wonocolo\', `kodepos` = \'60237\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3578022002600003\', `nama_ayah` = \'JONSIN\', `tgl_lahir_ayah` = \'1905-05-18\', `pendidikan_ayah` = \'8\', `pekerjaan_ayah` = \'12\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'`3578026407670003\', `nama_ibu` = \'SITI SAMSIYAH\', `tgl_lahir_ibu` = \'1905-05-16\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'1000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'5\'');
INSERT INTO `2_tabel_log` VALUES (37, '2022-03-06 19:58:00', '1', 'edit', 6, 'Edit Master Data Siswa id = 6', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`-\', `nis` = \'6022\', `nik_siswa` = \'`3518021205080002\', `nama_siswa` = \'AGRA SYAHREZA PRIMADY\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-05-12\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'DSN NGETOS\', `rt` = \'4\', `rw` = \'2\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'64474\', `kota` = \'NGANJUK\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'-\', `nama_ayah` = \'-\', `tgl_lahir_ayah` = \'2022-02-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'12\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'-\', `nama_ibu` = \'-\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'2500000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'6\'');
INSERT INTO `2_tabel_log` VALUES (38, '2022-03-06 19:59:16', '1', 'edit', 7, 'Edit Master Data Siswa id = 7', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0087560409\', `nis` = \'6024\', `nik_siswa` = \'`3513052706080001\', `nama_siswa` = \'AGUNG PRASETYA\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'PROBOLINGGO\', `tgl_lahir_siswa` = \'2008-06-27\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'BLOK KEDUNGMINIAN\', `rt` = \'2\', `rw` = \'7\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'67273\', `kota` = \'PROBOLINGGO\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3513051701680001\', `nama_ayah` = \'USNADI\', `tgl_lahir_ayah` = \'1905-05-21\', `pendidikan_ayah` = \'3\', `pekerjaan_ayah` = \'2\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'500000\', `hp_ayah` = \'\', `nik_ibu` = \'`3513056607730001\', `nama_ibu` = \'SUMIRAH\', `tgl_lahir_ibu` = \'1905-05-26\', `pendidikan_ibu` = \'3\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'500000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'4000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'7\'');
INSERT INTO `2_tabel_log` VALUES (39, '2022-03-06 20:01:17', '1', 'edit', 10, 'Edit Master Data Siswa id = 10', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0081219051\', `nis` = \'6026\', `nik_siswa` = \'`3574022403080001\', `nama_siswa` = \'ALIF PUTRA ANDRIANTO\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'PROBOLINGGO\', `tgl_lahir_siswa` = \'2008-03-24\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'DSN ASEM DOYONG\', `rt` = \'1\', `rw` = \'10\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'67236\', `kota` = \'PROBOLINGGO\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`3574022402840003\', `nama_ayah` = \'TAUFIK ANDRIANTO \', `tgl_lahir_ayah` = \'1905-06-06\', `pendidikan_ayah` = \'3\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`3574024802850002\', `nama_ibu` = \'IIS SRIBAWATI\', `tgl_lahir_ibu` = \'1905-06-07\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'5000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'10\'');
INSERT INTO `2_tabel_log` VALUES (40, '2022-03-06 20:03:25', '1', 'edit', 27, 'Edit Master Data Siswa id = 27', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0087142060\', `nis` = \'6076\', `nik_siswa` = \'`3515066307080001\', `nama_siswa` = \'HABIBA HARDIANTI\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'2\', `tempat_lahir` = \'SIDOARJO\', `tgl_lahir_siswa` = \'2008-07-23\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'BHAYANGKARA PERMAI E-04\', `rt` = \'23\', `rw` = \'8\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'60221\', `kota` = \'SIDOARJO\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'-\', `nama_ayah` = \'EDDY SUHARSONO\', `tgl_lahir_ayah` = \'1973-04-11\', `pendidikan_ayah` = \'\', `pekerjaan_ayah` = \'4\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'\', `nama_ibu` = \'DEWI PURWATI\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'\', `pekerjaan_ibu` = \'\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'12\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'2000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'27\'');
INSERT INTO `2_tabel_log` VALUES (41, '2022-03-06 20:04:24', '1', 'edit', 38, 'Edit Master Data Siswa id = 38', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`00689899461\', `nis` = \'6077\', `nik_siswa` = \'`3328112812060006\', `nama_siswa` = \'MUHAMAD KELVIN DIANTORO\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'TEGAL\', `tgl_lahir_siswa` = \'2006-12-28\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'-\', `rt` = \'0\', `rw` = \'0\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'0\', `kota` = \'-\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'-\', `nama_ayah` = \'-\', `tgl_lahir_ayah` = \'2022-02-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'12\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'`\', `nama_ibu` = \'-\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'38\'');
INSERT INTO `2_tabel_log` VALUES (42, '2022-03-06 20:07:02', '1', 'edit', 52, 'Edit Master Data Siswa id = 52', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0089047916\', `nis` = \'6064\', `nik_siswa` = \'`3174031907080003\', `nama_siswa` = \'RADITYA BAHTIAR AKMAL\', `kelas_siswa` = \'1\', `rombel` = \'A\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'JAKARTA\', `tgl_lahir_siswa` = \'2008-07-19\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'JEMUR NGAWINAN GG. I NO. 69\', `rt` = \'2\', `rw` = \'2\', `kelurahan` = \'Jemur Wonosari\', `kecamatan` = \'Kec. Wonocolo\', `kodepos` = \'12790\', `kota` = \'SURABAYA\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'`\', `nama_ayah` = \'MARNO\', `tgl_lahir_ayah` = \'2022-02-01\', `pendidikan_ayah` = \'\', `pekerjaan_ayah` = \'5\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'5000000\', `hp_ayah` = \'\', `nik_ibu` = \'`\', `nama_ibu` = \'SITI AMILIN\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'\', `pekerjaan_ibu` = \'12\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'5000000\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'5000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'52\'');
INSERT INTO `2_tabel_log` VALUES (43, '2022-03-06 21:53:09', '1', 'edit', 6, 'Edit Master Data Siswa id = 6', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`-\', `nis` = \'6022\', `nik_siswa` = \'`3518021205080002\', `nama_siswa` = \'AGRA SYAHREZA PRIMADY\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'SURABAYA\', `tgl_lahir_siswa` = \'2008-05-12\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'DSN NGETOS\', `rt` = \'4\', `rw` = \'2\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'64474\', `kota` = \'NGANJUK\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'-\', `nama_ayah` = \'-\', `tgl_lahir_ayah` = \'2022-02-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'-\', `nama_ibu` = \'-\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'2500000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'6\'');
INSERT INTO `2_tabel_log` VALUES (44, '2022-03-06 21:53:45', '1', 'edit', 27, 'Edit Master Data Siswa id = 27', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0087142060\', `nis` = \'6076\', `nik_siswa` = \'`3515066307080001\', `nama_siswa` = \'HABIBA HARDIANTI\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'2\', `tempat_lahir` = \'SIDOARJO\', `tgl_lahir_siswa` = \'2008-07-23\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'BHAYANGKARA PERMAI E-04\', `rt` = \'23\', `rw` = \'8\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'60221\', `kota` = \'SIDOARJO\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'-\', `nama_ayah` = \'EDDY SUHARSONO\', `tgl_lahir_ayah` = \'1973-04-11\', `pendidikan_ayah` = \'\', `pekerjaan_ayah` = \'\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'\', `nama_ibu` = \'DEWI PURWATI\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'\', `pekerjaan_ibu` = \'\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'2000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'27\'');
INSERT INTO `2_tabel_log` VALUES (45, '2022-03-06 21:54:03', '1', 'edit', 38, 'Edit Master Data Siswa id = 38', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`00689899461\', `nis` = \'6077\', `nik_siswa` = \'`3328112812060006\', `nama_siswa` = \'MUHAMAD KELVIN DIANTORO\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'1\', `tempat_lahir` = \'TEGAL\', `tgl_lahir_siswa` = \'2006-12-28\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'-\', `rt` = \'0\', `rw` = \'0\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'0\', `kota` = \'-\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'-\', `nama_ayah` = \'-\', `tgl_lahir_ayah` = \'2022-02-01\', `pendidikan_ayah` = \'5\', `pekerjaan_ayah` = \'\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'`\', `nama_ibu` = \'-\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'5\', `pekerjaan_ibu` = \'\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'3000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'38\'');
INSERT INTO `2_tabel_log` VALUES (46, '2022-03-06 21:54:49', '1', 'edit', 27, 'Edit Master Data Siswa id = 27', 'UPDATE `data_siswa` SET `tgl_masuk` = \'\', `nisn` = \'`0087142060\', `nis` = \'6076\', `nik_siswa` = \'`3515066307080001\', `nama_siswa` = \'HABIBA HARDIANTI\', `kelas_siswa` = \'1\', `rombel` = \'B\', `jenis_kelamin` = \'2\', `tempat_lahir` = \'SIDOARJO\', `tgl_lahir_siswa` = \'2008-07-23\', `agama` = \'1\', `anak_ke` = \'0\', `alamat` = \'BHAYANGKARA PERMAI E-04\', `rt` = \'23\', `rw` = \'8\', `kelurahan` = \'-\', `kecamatan` = \'-\', `kodepos` = \'60221\', `kota` = \'SIDOARJO\', `jenis_tinggal` = \'1\', `rumah_kriteria` = \'\', `transportasi` = \'4\', `pilih_sktm` = \'2\', `sktm_kriteria` = \'\', `sktm` = \'<p>You did not select a file to upload.</p>\', `pilih_kartu_bantuan` = \'2\', `kartu_bantuan` = \'<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>\', `nik_ayah` = \'-\', `nama_ayah` = \'EDDY SUHARSONO\', `tgl_lahir_ayah` = \'1973-04-11\', `pendidikan_ayah` = \'\', `pekerjaan_ayah` = \'\', `kerja_ayah_kriteria` = \'\', `gaji_ayah` = \'0\', `hp_ayah` = \'\', `nik_ibu` = \'\', `nama_ibu` = \'DEWI PURWATI\', `tgl_lahir_ibu` = \'2022-02-01\', `pendidikan_ibu` = \'\', `pekerjaan_ibu` = \'\', `kerja_ibu_kriteria` = \'\', `gaji_ibu` = \'0\', `hp_ibu` = \'\', `nik_wali` = \'\', `nama_wali` = \'\', `tgl_lahir_wali` = \'2022-02-01\', `pendidikan_wali` = \'\', `pekerjaan_wali` = \'\', `kerja_wali_kriteria` = \'\', `gaji_wali` = \'0\', `hp_wali` = \'\', `total_gaji` = \'0\', `gaji_masuk_kriteria` = \'\', `pengeluaran` = \'4000000\', `gaji_keluar_kriteria` = \'\', `jml_anak_sekolah` = \'0\'\nWHERE `id_siswa` = \'27\'');
INSERT INTO `2_tabel_log` VALUES (47, '2022-04-11 20:11:12', '1', 'add', 10, 'Input Master kriteria id = 10', 'INSERT INTO `1_kriteria` (`kode_kriteria`, `nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'C9\', \'Oke\', \'20\', \'1\')');
INSERT INTO `2_tabel_log` VALUES (48, '2022-04-13 11:51:56', '1', 'add', 10, 'Input Master kriteria id = 10', 'INSERT INTO `1_kriteria` (`kode_kriteria`, `nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'C9\', \'aku\', \'20\', \'2\')');
INSERT INTO `2_tabel_log` VALUES (49, '2022-04-13 11:52:04', '1', 'edit', 10, 'Edit Master kriteria id = 10', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'30\'\nWHERE `id_kriteria` = \'10\'');
INSERT INTO `2_tabel_log` VALUES (50, '2022-04-13 11:52:11', '1', 'delete', 10, 'Hapus Master kriteria id = 10', 'DELETE FROM `1_kriteria`\nWHERE `id_kriteria` = \'10\'');
INSERT INTO `2_tabel_log` VALUES (51, '2022-04-13 11:53:51', '1', 'add', 11, 'Input Master kriteria id = 11', 'INSERT INTO `1_kriteria` (`kode_kriteria`, `nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'fgh\', \'rewe\', \'3\', \'1\')');
INSERT INTO `2_tabel_log` VALUES (52, '2022-04-13 11:54:00', '1', 'delete', 11, 'Hapus Master kriteria id = 11', 'DELETE FROM `1_kriteria`\nWHERE `id_kriteria` = \'11\'');
INSERT INTO `2_tabel_log` VALUES (53, '2022-04-25 10:31:27', '1', 'add', 10, 'Input Master kriteria id = 10', 'INSERT INTO `1_kriteria` (`kode_kriteria`, `nama_kriteria`, `bobot_kriteria`, `tipe_kriteria`) VALUES (\'C9\', \'Pekerjaan Wali\', \'20\', \'1\')');
INSERT INTO `2_tabel_log` VALUES (54, '2022-04-25 10:32:28', '1', 'edit', 10, 'Edit Master kriteria id = 10', 'UPDATE `1_kriteria` SET `bobot_kriteria` = \'30\'\nWHERE `id_kriteria` = \'10\'');
INSERT INTO `2_tabel_log` VALUES (55, '2022-04-25 10:33:13', '1', 'delete', 10, 'Hapus Master kriteria id = 10', 'DELETE FROM `1_kriteria`\nWHERE `id_kriteria` = \'10\'');

-- ----------------------------
-- Table structure for 2_users
-- ----------------------------
DROP TABLE IF EXISTS `2_users`;
CREATE TABLE `2_users`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `fid_opd` int NULL DEFAULT NULL,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_pass` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fid_hak` int NULL DEFAULT NULL,
  `user_nama` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sta` int NULL DEFAULT 1,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of 2_users
-- ----------------------------
INSERT INTO `2_users` VALUES (1, NULL, 'admin', '$2y$10$IlbUIJB7cgDK87VE.lXo6eP.qUR68LKFfBooJG/4M2EVtVq1wqXDe', 1, 'Administrator', 1);
INSERT INTO `2_users` VALUES (2, 1, 'dinsos', '$2y$10$IlbUIJB7cgDK87VE.lXo6eP.qUR68LKFfBooJG/4M2EVtVq1wqXDe', 2, NULL, 1);

-- ----------------------------
-- Table structure for 3_jenis_kelamin
-- ----------------------------
DROP TABLE IF EXISTS `3_jenis_kelamin`;
CREATE TABLE `3_jenis_kelamin`  (
  `id_jk` int NOT NULL AUTO_INCREMENT,
  `nama_jk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_jk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 3_jenis_kelamin
-- ----------------------------
INSERT INTO `3_jenis_kelamin` VALUES (1, 'Laki - Laki');
INSERT INTO `3_jenis_kelamin` VALUES (2, 'Perempuan');

-- ----------------------------
-- Table structure for 4_agama
-- ----------------------------
DROP TABLE IF EXISTS `4_agama`;
CREATE TABLE `4_agama`  (
  `id_agama` int NOT NULL AUTO_INCREMENT,
  `nama_agama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_agama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 4_agama
-- ----------------------------
INSERT INTO `4_agama` VALUES (1, 'Islam');
INSERT INTO `4_agama` VALUES (2, 'Kristen');
INSERT INTO `4_agama` VALUES (3, 'Katolik');
INSERT INTO `4_agama` VALUES (4, 'Budha');
INSERT INTO `4_agama` VALUES (5, 'Hindu');

-- ----------------------------
-- Table structure for 5_jenis_tinggal
-- ----------------------------
DROP TABLE IF EXISTS `5_jenis_tinggal`;
CREATE TABLE `5_jenis_tinggal`  (
  `id_jt` int NOT NULL AUTO_INCREMENT,
  `nama_jt` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bobot` int NOT NULL,
  PRIMARY KEY (`id_jt`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 5_jenis_tinggal
-- ----------------------------
INSERT INTO `5_jenis_tinggal` VALUES (1, 'Rumah Pribadi Bersama Orang Tua / Wali', 4);
INSERT INTO `5_jenis_tinggal` VALUES (2, 'Kos', 3);
INSERT INTO `5_jenis_tinggal` VALUES (3, 'Kontrak', 3);
INSERT INTO `5_jenis_tinggal` VALUES (4, 'Asrama / Pondok', 2);
INSERT INTO `5_jenis_tinggal` VALUES (5, 'Panti Asuhan', 1);

-- ----------------------------
-- Table structure for 6_transportasi
-- ----------------------------
DROP TABLE IF EXISTS `6_transportasi`;
CREATE TABLE `6_transportasi`  (
  `id_transport` int NOT NULL AUTO_INCREMENT,
  `nama_transport` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_transport`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 6_transportasi
-- ----------------------------
INSERT INTO `6_transportasi` VALUES (1, 'Jalan Kaki');
INSERT INTO `6_transportasi` VALUES (2, 'Kendaraan Umum');
INSERT INTO `6_transportasi` VALUES (3, 'Antar Jemput');
INSERT INTO `6_transportasi` VALUES (4, 'Sepeda');

-- ----------------------------
-- Table structure for 7_pendidikan
-- ----------------------------
DROP TABLE IF EXISTS `7_pendidikan`;
CREATE TABLE `7_pendidikan`  (
  `id_pendidikan` int NOT NULL AUTO_INCREMENT,
  `nama_pendidikan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_pendidikan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 7_pendidikan
-- ----------------------------
INSERT INTO `7_pendidikan` VALUES (1, 'Tidak Sekolah');
INSERT INTO `7_pendidikan` VALUES (2, 'Putus SD');
INSERT INTO `7_pendidikan` VALUES (3, 'SD Sederajat');
INSERT INTO `7_pendidikan` VALUES (4, 'SMP/MTS Sederajat');
INSERT INTO `7_pendidikan` VALUES (5, 'SMA/SMK/MA Sederajat');
INSERT INTO `7_pendidikan` VALUES (6, 'D1');
INSERT INTO `7_pendidikan` VALUES (7, 'D2');
INSERT INTO `7_pendidikan` VALUES (8, 'D3');
INSERT INTO `7_pendidikan` VALUES (9, 'D4');
INSERT INTO `7_pendidikan` VALUES (10, 'S1');
INSERT INTO `7_pendidikan` VALUES (11, 'S2');
INSERT INTO `7_pendidikan` VALUES (12, 'S3');

-- ----------------------------
-- Table structure for 8_pekerjaan
-- ----------------------------
DROP TABLE IF EXISTS `8_pekerjaan`;
CREATE TABLE `8_pekerjaan`  (
  `id_kerja` int NOT NULL AUTO_INCREMENT,
  `nama_kerja` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bobot` int NOT NULL,
  PRIMARY KEY (`id_kerja`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of 8_pekerjaan
-- ----------------------------
INSERT INTO `8_pekerjaan` VALUES (1, 'Nelayan', 1);
INSERT INTO `8_pekerjaan` VALUES (2, 'Petani', 1);
INSERT INTO `8_pekerjaan` VALUES (3, 'Peternak', 1);
INSERT INTO `8_pekerjaan` VALUES (4, 'Karyawan Swasta', 3);
INSERT INTO `8_pekerjaan` VALUES (5, 'Wiraswasta', 2);
INSERT INTO `8_pekerjaan` VALUES (6, 'PNS', 4);
INSERT INTO `8_pekerjaan` VALUES (7, 'POLRI', 4);
INSERT INTO `8_pekerjaan` VALUES (8, 'TNI', 4);
INSERT INTO `8_pekerjaan` VALUES (9, 'Guru', 3);
INSERT INTO `8_pekerjaan` VALUES (10, 'Pedagang Kecil', 2);
INSERT INTO `8_pekerjaan` VALUES (11, 'Pedagang Besar', 2);
INSERT INTO `8_pekerjaan` VALUES (12, 'Tidak Bekerja / Mengurus Rumah Tangga', 1);

-- ----------------------------
-- Table structure for data_siswa
-- ----------------------------
DROP TABLE IF EXISTS `data_siswa`;
CREATE TABLE `data_siswa`  (
  `id_siswa` int NOT NULL AUTO_INCREMENT,
  `tgl_masuk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nisn` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nis` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik_siswa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_siswa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kelas_siswa` int NOT NULL,
  `rombel` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_kelamin` int NOT NULL,
  `tempat_lahir` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_lahir_siswa` date NOT NULL,
  `agama` int NOT NULL DEFAULT 1,
  `anak_ke` int NOT NULL,
  `alamat` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rt` int NOT NULL,
  `rw` int NOT NULL,
  `kelurahan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kecamatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kodepos` int NOT NULL,
  `kota` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_tinggal` int NOT NULL DEFAULT 1,
  `rumah_kriteria` int NOT NULL,
  `transportasi` int NOT NULL DEFAULT 1,
  `pilih_sktm` int NOT NULL,
  `sktm_kriteria` int NOT NULL,
  `sktm` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pilih_kartu_bantuan` int NOT NULL,
  `kartu_bantuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `nik_ayah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_ayah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir_ayah` date NULL DEFAULT NULL,
  `pendidikan_ayah` int NULL DEFAULT 1,
  `pekerjaan_ayah` int NULL DEFAULT 12,
  `kerja_ayah_kriteria` int NULL DEFAULT NULL,
  `gaji_ayah` int NULL DEFAULT 0,
  `hp_ayah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik_ibu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_ibu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir_ibu` date NULL DEFAULT NULL,
  `pendidikan_ibu` int NULL DEFAULT 1,
  `pekerjaan_ibu` int NULL DEFAULT 12,
  `kerja_ibu_kriteria` int NULL DEFAULT NULL,
  `gaji_ibu` int NULL DEFAULT 0,
  `hp_ibu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nik_wali` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_wali` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_lahir_wali` date NULL DEFAULT NULL,
  `pendidikan_wali` int NULL DEFAULT 1,
  `pekerjaan_wali` int NULL DEFAULT 12,
  `kerja_wali_kriteria` int NULL DEFAULT NULL,
  `gaji_wali` int NULL DEFAULT 0,
  `hp_wali` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total_gaji` int NOT NULL,
  `gaji_masuk_kriteria` int NOT NULL,
  `pengeluaran` int NOT NULL,
  `gaji_keluar_kriteria` int NOT NULL,
  `jml_anak_sekolah` int NOT NULL,
  PRIMARY KEY (`id_siswa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of data_siswa
-- ----------------------------
INSERT INTO `data_siswa` VALUES (1, '0000-00-00 00:00:00', '0092961081', '6019', '`3208180601090001', 'ABDUL HARIS AL-HASAN', 1, 'A', 1, 'KUNINGAN', '2009-01-06', 1, 0, 'LINGK. MUSLIM', 11, 4, 'iya', 'ok', 45552, 'KUNINGAN', 5, 0, 2, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '`3208181006730004', 'UMAN', '1973-06-10', 4, 5, 0, 5000000, '', '`3208184504800004', 'TITING BUDIARTI', '1980-04-05', 5, 12, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 5000000, 0, 3400000, 0, 3);
INSERT INTO `data_siswa` VALUES (3, '0000-00-00 00:00:00', '`0085450023', '6080', '`3578021907080006', 'ADHIKA PRASETYO FATKULLOH', 1, 'B', 1, 'SURABAYA', '2008-07-19', 1, 0, 'SIWALANKERTO UTARA 59-D', 4, 3, 'Siwalankerto', 'Kec. Wonocolo', 60236, 'SURABAYA', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '`3578020605790001', 'SIGIT PRASETYO', '1905-06-01', 5, 5, 0, 2500000, '', '`3578024804790005', 'NIKMATUS SOLIKAH', '1905-06-01', 5, 12, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 2500000, 0, 4000000, 0, 0);
INSERT INTO `data_siswa` VALUES (4, '0000-00-00 00:00:00', '`0085365508', '6020', '`3501104107080010', 'ADINDA PUTRI YULIANA', 1, 'A', 2, 'PACITAN', '2008-07-01', 1, 0, 'JL. SIWALAN KERTO NO. 85', 7, 1, 'Siwalankerto', 'Kec. Wonocolo', 60236, 'SURABAYA', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '`3501101505790005', 'SUGIONO', '1979-05-15', 4, 5, 0, 2500000, '', '`3501106304830002', 'IKE TRIWAHYUNI', '1983-04-23', 5, 5, 0, 2500000, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 5000000, 0, 1400000, 0, 0);
INSERT INTO `data_siswa` VALUES (5, '0000-00-00 00:00:00', '`0085122713', '6021', '`3578025308080003', 'AGATHA HAYU RABTYBEL', 1, 'A', 2, 'SURABAYA', '2008-08-13', 1, 0, 'JEMUR WONOSARI GG.IAIN 11-B', 8, 3, 'Jemur Wonosari', 'Kec. Wonocolo', 60237, 'SURABAYA', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '`3578022002600003', 'JONSIN', '1905-05-18', 8, 12, 0, 0, '', '`3578026407670003', 'SITI SAMSIYAH', '1905-05-16', 5, 12, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 0, 0, 1000000, 0, 0);
INSERT INTO `data_siswa` VALUES (6, '0000-00-00 00:00:00', '`-', '6022', '`3518021205080002', 'AGRA SYAHREZA PRIMADY', 1, 'B', 1, 'SURABAYA', '2008-05-12', 1, 0, 'DSN NGETOS', 4, 2, '-', '-', 64474, 'NGANJUK', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '-', '-', '2022-02-01', 5, 0, 0, 0, '', '-', '-', '2022-02-01', 5, 0, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 0, 0, 2500000, 0, 0);
INSERT INTO `data_siswa` VALUES (7, '0000-00-00 00:00:00', '`0087560409', '6024', '`3513052706080001', 'AGUNG PRASETYA', 1, 'A', 1, 'PROBOLINGGO', '2008-06-27', 1, 0, 'BLOK KEDUNGMINIAN', 2, 7, '-', '-', 67273, 'PROBOLINGGO', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '`3513051701680001', 'USNADI', '1905-05-21', 3, 2, 0, 500000, '', '`3513056607730001', 'SUMIRAH', '1905-05-26', 3, 12, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 500000, 0, 4000000, 0, 0);
INSERT INTO `data_siswa` VALUES (10, '0000-00-00 00:00:00', '`0081219051', '6026', '`3574022403080001', 'ALIF PUTRA ANDRIANTO', 1, 'B', 1, 'PROBOLINGGO', '2008-03-24', 1, 0, 'DSN ASEM DOYONG', 1, 10, '-', '-', 67236, 'PROBOLINGGO', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '`3574022402840003', 'TAUFIK ANDRIANTO ', '1905-06-06', 3, 4, 0, 5000000, '', '`3574024802850002', 'IIS SRIBAWATI', '1905-06-07', 5, 12, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 5000000, 0, 5000000, 0, 0);
INSERT INTO `data_siswa` VALUES (27, '0000-00-00 00:00:00', '`0087142060', '6076', '`3515066307080001', 'HABIBA HARDIANTI', 1, 'B', 2, 'SIDOARJO', '2008-07-23', 1, 0, 'BHAYANGKARA PERMAI E-04', 23, 8, '-', '-', 60221, 'SIDOARJO', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '-', 'EDDY SUHARSONO', '1973-04-11', 0, 0, 0, 0, '', '', 'DEWI PURWATI', '2022-02-01', 0, 0, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 0, 0, 4000000, 0, 0);
INSERT INTO `data_siswa` VALUES (38, '0000-00-00 00:00:00', '`00689899461', '6077', '`3328112812060006', 'MUHAMAD KELVIN DIANTORO', 1, 'B', 1, 'TEGAL', '2006-12-28', 1, 0, '-', 0, 0, '-', '-', 0, '-', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '-', '-', '2022-02-01', 5, 0, 0, 0, '', '`', '-', '2022-02-01', 5, 0, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 0, 0, 3000000, 0, 0);
INSERT INTO `data_siswa` VALUES (52, '0000-00-00 00:00:00', '`0089047916', '6064', '`3174031907080003', 'RADITYA BAHTIAR AKMAL', 1, 'A', 1, 'JAKARTA', '2008-07-19', 1, 0, 'JEMUR NGAWINAN GG. I NO. 69', 2, 2, 'Jemur Wonosari', 'Kec. Wonocolo', 12790, 'SURABAYA', 1, 0, 4, 2, 0, '<p>You did not select a file to upload.</p>', 2, '<p>You did not select a file to upload.</p><p>You did not select a file to upload.</p>', '`', 'MARNO', '2022-02-01', 0, 5, 0, 5000000, '', '`', 'SITI AMILIN', '2022-02-01', 0, 12, 0, 0, '', '', '', '2022-02-01', 0, 0, 0, 0, '', 5000000, 0, 5000000, 0, 0);

-- ----------------------------
-- Table structure for pilihan
-- ----------------------------
DROP TABLE IF EXISTS `pilihan`;
CREATE TABLE `pilihan`  (
  `id_pilih` int NOT NULL AUTO_INCREMENT,
  `nama_pilih` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_pilih`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of pilihan
-- ----------------------------
INSERT INTO `pilihan` VALUES (1, 'Iya');
INSERT INTO `pilihan` VALUES (2, 'Tidak');

SET FOREIGN_KEY_CHECKS = 1;
