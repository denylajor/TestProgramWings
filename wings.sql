/*
 Navicat Premium Dump SQL

 Source Server         : _local
 Source Server Type    : MySQL
 Source Server Version : 100411 (10.4.11-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : wings

 Target Server Type    : MySQL
 Target Server Version : 100411 (10.4.11-MariaDB)
 File Encoding         : 65001

 Date: 15/11/2025 17:27:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for jenis_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `jenis_transaksi`;
CREATE TABLE `jenis_transaksi`  (
  `id_jenis_transaksi` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `jenis_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jenis_transaksi`) USING BTREE,
  UNIQUE INDEX `jenis_transaksi_jenis_transaksi_unique`(`jenis_transaksi` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_transaksi
-- ----------------------------
INSERT INTO `jenis_transaksi` VALUES (1, 'Barang Masuk', '2025-11-13 13:23:02', NULL, 'System', NULL);
INSERT INTO `jenis_transaksi` VALUES (2, 'Barang Keluar', '2025-11-13 13:23:02', NULL, 'System', NULL);

-- ----------------------------
-- Table structure for master_barang
-- ----------------------------
DROP TABLE IF EXISTS `master_barang`;
CREATE TABLE `master_barang`  (
  `id_barang` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE,
  UNIQUE INDEX `master_barang_nama_barang_unique`(`nama_barang` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_barang
-- ----------------------------
INSERT INTO `master_barang` VALUES (1, 'Mie Sedaap Goreng', '2025-11-13 13:23:02', NULL, 'System', NULL);
INSERT INTO `master_barang` VALUES (2, 'Mie Sedaap Soto', '2025-11-13 13:23:02', NULL, 'System', NULL);
INSERT INTO `master_barang` VALUES (3, 'Mie Sedaap Kari Spesial', '2025-11-13 13:23:02', NULL, 'System', NULL);
INSERT INTO `master_barang` VALUES (4, 'Mie Sedaap Ayam Bawang', '2025-11-13 13:23:02', NULL, 'System', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (3, '2025_11_13_105635_role_user', 1);
INSERT INTO `migrations` VALUES (4, '2025_11_13_105636_create_users_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_11_13_110502_master_barang', 2);
INSERT INTO `migrations` VALUES (6, '2025_11_13_110800_jenis_transaksi', 3);
INSERT INTO `migrations` VALUES (7, '2025_11_13_110801_transaksi', 3);
INSERT INTO `migrations` VALUES (8, '2025_11_13_131059_stock', 4);
INSERT INTO `migrations` VALUES (9, '2019_12_14_000001_create_personal_access_tokens_table', 5);
INSERT INTO `migrations` VALUES (10, '2025_11_13_135318_v_user', 6);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\User', 1, 'auth_token', 'c70f693ed968cfd6e73cbdc1666600443004ae43b110d8c6bb4e2b2746d81ca5', '[\"*\"]', NULL, '2025-11-13 13:51:49', '2025-11-13 13:51:49');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\User', 1, 'auth_token', '0beeb6328f47c582e0b87024780081e9d951fa0dab87569e9ba77307e22387c2', '[\"*\"]', NULL, '2025-11-13 13:52:02', '2025-11-13 13:52:02');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\User', 1, 'auth_token', 'c7e4c46a4f1b5b93e715270d3d9e539482afe5240252523366ff74a4f2e6589e', '[\"*\"]', NULL, '2025-11-13 13:56:40', '2025-11-13 13:56:40');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\User', 1, 'auth_token', '0f34922b095a43830588918c74060e17b9dc6e529477585f198eb3669ed7a38b', '[\"*\"]', NULL, '2025-11-13 13:59:24', '2025-11-13 13:59:24');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\User', 1, 'auth_token', '93306fea4b97e88ca5bb481a3abce945adf5f0ed9aeb9045d6454f6c59e3f94b', '[\"*\"]', NULL, '2025-11-13 14:05:08', '2025-11-13 14:05:08');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\User', 1, 'auth_token', 'f4e4c240e51ae241e6c6ecabd37b7474a428a182d7394086a75129e02892608b', '[\"*\"]', NULL, '2025-11-13 14:11:42', '2025-11-13 14:11:42');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\User', 1, 'auth_token', '84904a6be588d4439f0c02a4dbe72dc5cd957349ee6e6fe30280968fdc04b1da', '[\"*\"]', NULL, '2025-11-13 14:12:28', '2025-11-13 14:12:28');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\User', 1, 'auth_token', '473bf25c0421d5bbf1bc932cbde142b9e1ffd1d8d607f3e8049964ca56bb0414', '[\"*\"]', NULL, '2025-11-13 14:13:25', '2025-11-13 14:13:25');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\User', 1, 'auth_token', '7463e620ebf8b4c47374b43dc2f96c5eb7017288eb3b57d1d3948d38665ddfbd', '[\"*\"]', NULL, '2025-11-13 14:14:12', '2025-11-13 14:14:12');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\User', 1, 'auth_token', '6585ce45b14d30a42c4a93b73acc12f062c13ff72f7374c79ec2828c67a639e7', '[\"*\"]', NULL, '2025-11-13 14:16:34', '2025-11-13 14:16:34');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\User', 1, 'auth_token', 'ac5bda14ebef040d76b05b9348fcb6d68f7c8dcddf8d82c08af9b3e2ed8bb7bf', '[\"*\"]', NULL, '2025-11-13 14:16:46', '2025-11-13 14:16:46');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\User', 1, 'auth_token', '81d8bb03164abe6ade80e194a5a8174ece5e2a7dbe5edcaaa7e62fb90961f9e4', '[\"*\"]', NULL, '2025-11-13 14:16:50', '2025-11-13 14:16:50');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\User', 1, 'auth_token', '48d50d4b0897e766418bdbb51744a50855da3d4fd9ec7d70504540023cd6f3eb', '[\"*\"]', NULL, '2025-11-13 14:18:30', '2025-11-13 14:18:30');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\User', 1, 'auth_token', 'fefd040eb3091eb7ed839e29945b3e449249ccd8db444a44878a9fb0a780159b', '[\"*\"]', NULL, '2025-11-13 14:18:32', '2025-11-13 14:18:32');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\User', 1, 'auth_token', '1043c3b98f11fbbd1e6ce78db636a94641de1fdf36e8d78378bc719ce53bf13f', '[\"*\"]', NULL, '2025-11-13 14:18:41', '2025-11-13 14:18:41');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\User', 1, 'auth_token', 'd140b9341c3d73cb47c63554a477f6657b249a21afb5d0117a534333eef2c5d7', '[\"*\"]', NULL, '2025-11-13 14:18:48', '2025-11-13 14:18:48');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\User', 1, 'auth_token', '02cced8acea7eb7f5c1e1b2e94b998a1f58fcac48d1e5a3d5c3ba08c5fadd69c', '[\"*\"]', NULL, '2025-11-13 14:18:54', '2025-11-13 14:18:54');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\User', 1, 'auth_token', '2365d6c924c0b05da0fe6809628311f2ea09df4b4a20ecb886eed0801607b1ab', '[\"*\"]', NULL, '2025-11-13 14:19:15', '2025-11-13 14:19:15');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\User', 1, 'auth_token', 'c207861ab1503ecf28ad3be66840f4e1c29a452a3cd0d311b3ad275137ebdc59', '[\"*\"]', NULL, '2025-11-13 14:19:22', '2025-11-13 14:19:22');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\User', 1, 'auth_token', '392e29e9ba458ab24bdc355467461e68a5032832d3b9fefb04e314571ab073a9', '[\"*\"]', NULL, '2025-11-13 14:46:52', '2025-11-13 14:46:52');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\User', 1, 'auth_token', 'dcb9d636ed9bc105063a897f7a04e93d8feb4107862d8d86a5034e13b3da6034', '[\"*\"]', NULL, '2025-11-13 14:47:21', '2025-11-13 14:47:21');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\User', 1, 'auth_token', '85f10e9a989262de8224a7a6d85bc23889e66b0250e18cfa3ca827abb9dc0f39', '[\"*\"]', NULL, '2025-11-13 14:47:57', '2025-11-13 14:47:57');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\User', 1, 'auth_token', '9aac5a80ed05d001d1464f1dacc7f7c3cec7b4e52282147f025b524c0e93bce9', '[\"*\"]', NULL, '2025-11-13 14:49:08', '2025-11-13 14:49:08');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\User', 1, 'auth_token', '8939af4a74e8e3a68119e1fcf7b2e7e0ca5960accce67d412ee146153d3fa9c9', '[\"*\"]', NULL, '2025-11-13 14:50:58', '2025-11-13 14:50:58');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\User', 1, 'auth_token', '55cc6aaf7e15382e19b1a8ef4af9d521f081e6981f219ce3eeae31ffa9b26866', '[\"*\"]', NULL, '2025-11-13 14:53:12', '2025-11-13 14:53:12');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\User', 1, 'auth_token', '4a2019626a5589b3472ae1c104bd5f8b7585b5216b0333f8acf13eaf12aabbee', '[\"*\"]', NULL, '2025-11-13 14:56:29', '2025-11-13 14:56:29');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\User', 1, 'auth_token', '106ff68e8d0e8525040eb2a3f9cbdd979e5cf1fc41fa2fe31760e8def399caaa', '[\"*\"]', NULL, '2025-11-13 17:19:40', '2025-11-13 17:19:40');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\User', 1, 'auth_token', '5c6c248913379e3bd3c3c6daf8ba728b26fc84dc90eebdf8827d07041827da87', '[\"*\"]', NULL, '2025-11-13 17:19:40', '2025-11-13 17:19:40');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\User', 1, 'auth_token', 'f46e010e5494aab6d4423702f0795872fb9dd8d6a10246b89e40c22b820e7fa4', '[\"*\"]', NULL, '2025-11-13 17:19:41', '2025-11-13 17:19:41');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\User', 1, 'auth_token', '19b76590c71541954d524a2bf495363a914177ad749f0fcd474e84a0dec1fecc', '[\"*\"]', NULL, '2025-11-13 17:19:59', '2025-11-13 17:19:59');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\User', 1, 'auth_token', '157fd7e19eae25269a68aa3c0152910defb44892a4e189fba210de189f06f443', '[\"*\"]', NULL, '2025-11-13 17:20:20', '2025-11-13 17:20:20');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\User', 1, 'auth_token', 'd5a60a5285d4029e9f7006b32aa63fe75022b634c0c2b54f4d677d84177d56b8', '[\"*\"]', NULL, '2025-11-13 17:20:28', '2025-11-13 17:20:28');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\User', 1, 'auth_token', 'ed2601d14db7243f3bca5bea99d18737bef5c7858c8107310d7a8452327d3589', '[\"*\"]', NULL, '2025-11-13 17:21:31', '2025-11-13 17:21:31');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\User', 1, 'auth_token', 'a32db996bbea37c03df8053970ead4d376ebb4be589b6081d58d2e228becac84', '[\"*\"]', NULL, '2025-11-13 17:21:49', '2025-11-13 17:21:49');
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\User', 1, 'auth_token', 'cc1e7dbe04f7951001a7ce72c46c79015d46809ac1807ea5ba70106d3eee98a0', '[\"*\"]', NULL, '2025-11-14 06:58:44', '2025-11-14 06:58:44');
INSERT INTO `personal_access_tokens` VALUES (36, 'App\\User', 1, 'auth_token', '645485d9a7bb2fada3af564c07940638089aaf6e9f86952e3a50b31773e7d05d', '[\"*\"]', NULL, '2025-11-14 08:16:08', '2025-11-14 08:16:08');
INSERT INTO `personal_access_tokens` VALUES (37, 'App\\User', 1, 'auth_token', '87ea28b8cd70b5f7daee81f2124638445c2faa2fe3cd1ded244f23f47a0e045a', '[\"*\"]', NULL, '2025-11-14 08:16:09', '2025-11-14 08:16:09');
INSERT INTO `personal_access_tokens` VALUES (38, 'App\\User', 1, 'auth_token', '434233cefb08b177d2c9f0f28dffcc9645d7c65bc404aaceba9ec6cd540925f5', '[\"*\"]', NULL, '2025-11-14 08:16:34', '2025-11-14 08:16:34');
INSERT INTO `personal_access_tokens` VALUES (39, 'App\\User', 1, 'auth_token', '1823a65112f0d86f91b96ec19e99b412d7bbed7effb59beabcdddbdfe2d787f4', '[\"*\"]', NULL, '2025-11-14 08:17:11', '2025-11-14 08:17:11');
INSERT INTO `personal_access_tokens` VALUES (40, 'App\\User', 1, 'auth_token', 'aac134fe6ca374c1c2899ff786bbe5ac77340543b0c726f6486d0f06e326f9a3', '[\"*\"]', NULL, '2025-11-14 08:20:19', '2025-11-14 08:20:19');
INSERT INTO `personal_access_tokens` VALUES (41, 'App\\User', 1, 'auth_token', 'f4cc8df0fa1a830303f7869aef4b6cfa6e41f92cd380e6c55c4d37cdb785d7fb', '[\"*\"]', '2025-11-14 09:50:28', '2025-11-14 08:37:17', '2025-11-14 09:50:28');
INSERT INTO `personal_access_tokens` VALUES (42, 'App\\User', 1, 'auth_token', '215d353b81569177945528ce5fbdc04f46dd42870efa84ad469f50d1adebd67a', '[\"*\"]', NULL, '2025-11-14 09:47:38', '2025-11-14 09:47:38');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\User', 1, 'auth_token', '7fda6dc1588e1c809d9291f81f3a04e9bd7606fd1faa97701e41024fb42f84f1', '[\"*\"]', '2025-11-14 09:52:46', '2025-11-14 09:52:04', '2025-11-14 09:52:46');
INSERT INTO `personal_access_tokens` VALUES (44, 'App\\User', 1, 'auth_token', '04de1536dda82551e8cbd66c0fb6f12121baa1667ddac2aef81c13fd5d5d4cba', '[\"*\"]', '2025-11-14 09:57:37', '2025-11-14 09:55:08', '2025-11-14 09:57:37');
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\User', 2, 'auth_token', '2a0b875a9e2025201f72ce2d84ad75a0085d9081bf8581cec627ef8db9268066', '[\"*\"]', NULL, '2025-11-14 10:02:20', '2025-11-14 10:02:20');
INSERT INTO `personal_access_tokens` VALUES (46, 'App\\User', 2, 'auth_token', '31832279ecd246dade5b9d8da77223da87ef7ab7fce09ead31d34694e61c69c8', '[\"*\"]', NULL, '2025-11-14 10:03:16', '2025-11-14 10:03:16');
INSERT INTO `personal_access_tokens` VALUES (47, 'App\\User', 2, 'auth_token', '4d73fc2b9f3453041d65d5f087b30f945fff8bc83b00235d3467667c22655b77', '[\"*\"]', NULL, '2025-11-14 10:03:38', '2025-11-14 10:03:38');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\User', 2, 'auth_token', '43b30d66a7c13b08336fa0ac549bd51e765c925a7c5b814b39c785a97086b5bd', '[\"*\"]', NULL, '2025-11-14 10:05:02', '2025-11-14 10:05:02');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\User', 2, 'auth_token', 'cd3b18c62326c3c8262acf6f0034d4092f933d78cad857ab37e1218b25a179b3', '[\"*\"]', NULL, '2025-11-14 10:05:43', '2025-11-14 10:05:43');
INSERT INTO `personal_access_tokens` VALUES (50, 'App\\User', 2, 'auth_token', 'ece0a2d100b2d25c3e2f873acacb3330550cbebd6935675593d6e4cd16c38e90', '[\"*\"]', NULL, '2025-11-14 10:08:30', '2025-11-14 10:08:30');
INSERT INTO `personal_access_tokens` VALUES (51, 'App\\User', 2, 'auth_token', 'b738851ba059544325f5f10e1a24da46363d6658b250a3797b478e03833e4109', '[\"*\"]', NULL, '2025-11-14 10:09:36', '2025-11-14 10:09:36');
INSERT INTO `personal_access_tokens` VALUES (52, 'App\\User', 2, 'auth_token', '4f680a191d434a324b42d1979868cbdcdf0e822c6e22c5083e2cb735c0fcb1f6', '[\"*\"]', NULL, '2025-11-14 10:10:25', '2025-11-14 10:10:25');
INSERT INTO `personal_access_tokens` VALUES (57, 'App\\User', 1, 'auth_token', '9dd9a48c5cee3ac80126e2b45acc6d65f61c1682c08c40c699ab87aa326125f5', '[\"*\"]', '2025-11-14 10:38:10', '2025-11-14 10:36:24', '2025-11-14 10:38:10');
INSERT INTO `personal_access_tokens` VALUES (58, 'App\\User', 1, 'auth_token', '66ba5cc0147038903d1a6f399a75ebc4b910d327385e61170fb11cd3795e47a9', '[\"*\"]', '2025-11-14 10:39:40', '2025-11-14 10:38:47', '2025-11-14 10:39:40');
INSERT INTO `personal_access_tokens` VALUES (60, 'App\\User', 1, 'auth_token', '7a59b1b87e4da16a240bfed4ed639b73ccee8a7c4eff311c13fb9dd22d443820', '[\"*\"]', '2025-11-14 10:56:14', '2025-11-14 10:55:11', '2025-11-14 10:56:14');
INSERT INTO `personal_access_tokens` VALUES (62, 'App\\User', 1, 'auth_token', '1182d68ecac6a4832ac3bf0bdf2356ba0fab4aef142b721331ca8a32ae99e712', '[\"*\"]', '2025-11-14 13:01:51', '2025-11-14 11:38:49', '2025-11-14 13:01:51');
INSERT INTO `personal_access_tokens` VALUES (63, 'App\\User', 1, 'auth_token', 'c862dfe28484f787694450c1787d39da30b0fc1cfcc45a309b297a9bf0cf65e9', '[\"*\"]', '2025-11-14 12:54:50', '2025-11-14 12:54:17', '2025-11-14 12:54:50');
INSERT INTO `personal_access_tokens` VALUES (64, 'App\\User', 1, 'auth_token', 'fdc39c70ef8cdf0038005928f602941b664a805431424267fbea806cc94c29b0', '[\"*\"]', '2025-11-14 13:01:41', '2025-11-14 12:56:12', '2025-11-14 13:01:41');
INSERT INTO `personal_access_tokens` VALUES (67, 'App\\User', 1, 'auth_token', '509363d65e75bd6b0940326efd5c59df5a630baec75cb777ce68aeb4f75106a4', '[\"*\"]', '2025-11-14 13:02:29', '2025-11-14 13:02:18', '2025-11-14 13:02:29');
INSERT INTO `personal_access_tokens` VALUES (73, 'App\\User', 1, 'auth_token', '60c9b2a928f7968af74744c84b24550afec451acc92c0a5b4ab83635367b0adb', '[\"*\"]', '2025-11-14 15:21:51', '2025-11-14 15:21:37', '2025-11-14 15:21:51');
INSERT INTO `personal_access_tokens` VALUES (76, 'App\\User', 2, 'auth_token', 'f2b9d7501d868edcb67fd7fe7701db490e416f70a55501ffce316d36225f6249', '[\"*\"]', '2025-11-14 15:30:51', '2025-11-14 15:30:49', '2025-11-14 15:30:51');
INSERT INTO `personal_access_tokens` VALUES (79, 'App\\User', 1, 'auth_token', '404f0bda010424fedb43b7b475b6d6e0d4c21c527889a5c7533613c9297a7ed5', '[\"*\"]', '2025-11-14 15:39:36', '2025-11-14 15:39:10', '2025-11-14 15:39:36');
INSERT INTO `personal_access_tokens` VALUES (80, 'App\\User', 1, 'auth_token', 'f06857574c3155829f994b2922939b891c9170a222c51a611d1ab732f38a2964', '[\"*\"]', NULL, '2025-11-14 15:39:43', '2025-11-14 15:39:43');
INSERT INTO `personal_access_tokens` VALUES (81, 'App\\User', 1, 'auth_token', 'b74e91028f29f9917855b8dedac50c248da2d2d5463c70ee9ad3bec5f196a74e', '[\"*\"]', '2025-11-14 15:40:01', '2025-11-14 15:39:52', '2025-11-14 15:40:01');
INSERT INTO `personal_access_tokens` VALUES (82, 'App\\User', 2, 'auth_token', 'd8701728ea896cea827c8ff54fd18bcf7cc25a5b3d3a25b1e03785c61ab8b43d', '[\"*\"]', NULL, '2025-11-14 15:40:20', '2025-11-14 15:40:20');
INSERT INTO `personal_access_tokens` VALUES (83, 'App\\User', 1, 'auth_token', '48e9e3ba5f616162862dd4233cf105ce167b7cec4d99101c7585aa43522a0889', '[\"*\"]', NULL, '2025-11-14 15:40:26', '2025-11-14 15:40:26');
INSERT INTO `personal_access_tokens` VALUES (84, 'App\\User', 2, 'auth_token', '1f95ff0ebd51fd1cd5ceb3b454a44935b5e49c86899a59bf3c8a077390c1a5da', '[\"*\"]', '2025-11-14 15:40:38', '2025-11-14 15:40:30', '2025-11-14 15:40:38');
INSERT INTO `personal_access_tokens` VALUES (85, 'App\\User', 1, 'auth_token', '14002ad3c7468d5dce2e1692118f96dde88e21e6e4311a4b47be27976a655e14', '[\"*\"]', '2025-11-14 15:46:44', '2025-11-14 15:40:45', '2025-11-14 15:46:44');
INSERT INTO `personal_access_tokens` VALUES (88, 'App\\User', 1, 'auth_token', '90dd526ec8e52aec1cfc1b70998eb8f3729d5bed2d9c43d98d9c22c73d455c4e', '[\"*\"]', '2025-11-15 07:02:24', '2025-11-14 15:56:24', '2025-11-15 07:02:24');
INSERT INTO `personal_access_tokens` VALUES (89, 'App\\User', 1, 'auth_token', 'a6d92014d587f5d1c484c0b36ce81963fcdbe6a50a7640b496211066313f7658', '[\"*\"]', '2025-11-14 20:24:17', '2025-11-14 20:22:59', '2025-11-14 20:24:17');
INSERT INTO `personal_access_tokens` VALUES (94, 'App\\User', 1, 'auth_token', '3eb22459469cf3c17c3746e8bbdf4ce0291f39735bda265fdefdf24ae7441621', '[\"*\"]', '2025-11-15 16:39:49', '2025-11-15 16:34:14', '2025-11-15 16:39:49');
INSERT INTO `personal_access_tokens` VALUES (95, 'App\\User', 2, 'auth_token', '8a47d4bf15aacdd0c375dbc9f0440f79c240d2f2619b2b360287ffc659f9b64c', '[\"*\"]', '2025-11-15 16:40:51', '2025-11-15 16:40:18', '2025-11-15 16:40:51');
INSERT INTO `personal_access_tokens` VALUES (99, 'App\\User', 1, 'auth_token', '6f8847dd026233b5be399349da8ab5e170e1a07c83cd051b8903444d09eeffb5', '[\"*\"]', '2025-11-15 17:27:22', '2025-11-15 16:54:51', '2025-11-15 17:27:22');
INSERT INTO `personal_access_tokens` VALUES (100, 'App\\User', 2, 'auth_token', '7ed9a8791eed21f32ef483bf95ccd5a222b3d091ac99bcf92302d962b8fdec6b', '[\"*\"]', '2025-11-15 17:27:25', '2025-11-15 17:17:46', '2025-11-15 17:27:25');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `id_role` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`) USING BTREE,
  UNIQUE INDEX `role_user_role_unique`(`role` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (1, 'Admin', '2025-11-13 13:23:02', NULL, 'System', NULL);
INSERT INTO `role_user` VALUES (2, 'User', '2025-11-13 13:23:02', NULL, 'System', NULL);

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id_stock` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_barang` bigint UNSIGNED NOT NULL,
  `jumlah_stock` int NOT NULL DEFAULT 0,
  `harga_satuan` double(20, 2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_stock`) USING BTREE,
  INDEX `stock_id_barang_foreign`(`id_barang` ASC) USING BTREE,
  CONSTRAINT `stock_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `master_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (39, 4, 5, 1000.00, '2025-11-15 16:55:08', '2025-11-15 16:55:08', 'admin', NULL);
INSERT INTO `stock` VALUES (40, 1, 5, 2000.00, '2025-11-15 16:55:20', '2025-11-15 16:55:20', 'admin', NULL);
INSERT INTO `stock` VALUES (41, 4, 20, 2000.00, '2025-11-15 16:55:29', '2025-11-15 16:55:29', 'admin', NULL);
INSERT INTO `stock` VALUES (42, 2, 10, 1000.00, '2025-11-15 17:00:00', '2025-11-15 17:00:00', 'admin', NULL);

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_barang` bigint UNSIGNED NOT NULL,
  `id_jenis_transaksi` bigint UNSIGNED NOT NULL,
  `no_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tanggal_transaksi` date NULL DEFAULT NULL,
  `jumlah_barang` int NOT NULL DEFAULT 0,
  `harga_satuan` double(20, 2) NOT NULL DEFAULT 0.00,
  `approval` int NOT NULL DEFAULT 0,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '0 = blm approve, 1 = approve, 2 = tolak',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaksi_id_barang_foreign`(`id_barang` ASC) USING BTREE,
  INDEX `transaksi_id_jenis_transaksi_foreign`(`id_jenis_transaksi` ASC) USING BTREE,
  CONSTRAINT `transaksi_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `master_barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaksi_id_jenis_transaksi_foreign` FOREIGN KEY (`id_jenis_transaksi`) REFERENCES `jenis_transaksi` (`id_jenis_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (19, 1, 1, '000001/BARANGMASUK/WINGS/XI/2025', '2025-11-14', 5, 1000.00, 0, 'TES', '2025-11-14 14:52:42', '2025-11-15 06:40:39', 'user', 'admin');
INSERT INTO `transaksi` VALUES (20, 4, 2, '000001/BARANGKELUAR/WINGS/XI/2025', '2025-11-14', 10, 2000.00, 0, NULL, '2025-11-14 14:53:15', '2025-11-14 17:41:57', 'user', 'admin');
INSERT INTO `transaksi` VALUES (21, 2, 1, '000002/BARANGMASUK/WINGS/XI/2025', '2025-11-14', 10, 1000.00, 1, 'TES', '2025-11-14 15:10:19', '2025-11-15 17:00:00', 'user', 'admin');
INSERT INTO `transaksi` VALUES (22, 4, 1, '000003/BARANGMASUK/WINGS/XI/2025', '2025-11-14', 20, 2000.00, 1, 'TES', '2025-11-14 16:27:28', '2025-11-15 16:55:29', 'user', 'admin');
INSERT INTO `transaksi` VALUES (23, 4, 2, '000002/BARANGKELUAR/WINGS/XI/2025', '2025-11-15', 5, 1000.00, 0, 'TES', '2025-11-14 20:31:06', '2025-11-15 06:49:44', 'user', 'admin');
INSERT INTO `transaksi` VALUES (24, 1, 1, '000004/BARANGMASUK/WINGS/XI/2025', '2025-11-15', 5, 1000.00, 0, NULL, '2025-11-14 20:40:46', '2025-11-15 07:01:44', 'user', 'admin');
INSERT INTO `transaksi` VALUES (25, 1, 1, '000005/BARANGMASUK/WINGS/XI/2025', '2025-11-15', 5, 2000.00, 1, 'TES', '2025-11-14 20:45:03', '2025-11-15 16:55:20', 'user', 'admin');
INSERT INTO `transaksi` VALUES (26, 1, 2, '000003/BARANGKELUAR/WINGS/XI/2025', '2025-11-15', 3, 1000.00, 2, 'TES', '2025-11-14 20:46:35', '2025-11-15 17:27:22', 'user', 'admin');
INSERT INTO `transaksi` VALUES (27, 1, 2, '000004/BARANGKELUAR/WINGS/XI/2025', '2025-11-15', 3, 2500.00, 2, NULL, '2025-11-14 20:47:31', '2025-11-15 17:26:58', 'user', 'admin');
INSERT INTO `transaksi` VALUES (28, 4, 1, '000006/BARANGMASUK/WINGS/XI/2025', '2025-11-15', 5, 1000.00, 1, NULL, '2025-11-14 20:48:21', '2025-11-15 16:55:08', 'user', 'admin');
INSERT INTO `transaksi` VALUES (29, 1, 1, '000007/BARANGMASUK/WINGS/XI/2025', '2025-11-15', 12, 5000.00, 1, 'tes', '2025-11-14 21:44:51', '2025-11-15 16:15:04', 'user', 'admin');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id_user` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_role` bigint UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE,
  INDEX `users_id_role_foreign`(`id_role` ASC) USING BTREE,
  CONSTRAINT `users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `role_user` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'admin', '$2y$10$PumHk4EtR74x3IhZvSOeeOSEGeYENu6RTg5M4Pj7TYtfYylUF/Ak6', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 2, 'user', '$2y$10$q55cWMbl3gWloVLNnJiv/.zyoyp5II7wNGWDvY1807tu0h1svc7o6', NULL, NULL, NULL, NULL);

-- ----------------------------
-- View structure for v_stock
-- ----------------------------
DROP VIEW IF EXISTS `v_stock`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_stock` AS SELECT
  a.id_stock,
  a.id_barang,
  b.nama_barang,
  a.jumlah_stock,
  a.harga_satuan,
  a.created_at,
  a.created_by,
  a.updated_at,
  a.updated_by
FROM
  stock AS a
  INNER JOIN master_barang as b ON a.id_barang = b.id_barang ;

-- ----------------------------
-- View structure for v_transaksi
-- ----------------------------
DROP VIEW IF EXISTS `v_transaksi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_transaksi` AS SELECT
  a.id,
  c.jenis_transaksi,
  a.no_transaksi,
  a.tanggal_transaksi,
  b.nama_barang,
  a.jumlah_barang,
  a.harga_satuan,
  a.approval,
  a.keterangan,
  a.created_at,
  a.created_by,
  a.updated_at,
  a.updated_by
FROM
  transaksi AS a
  INNER JOIN master_barang as b ON a.id_barang = b.id_barang
  INNER JOIN jenis_transaksi as c ON a.id_jenis_transaksi = c.id_jenis_transaksi ;

-- ----------------------------
-- View structure for v_user
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_user` AS SELECT
                        a.id_user,
                        a.id_role,
                        b.role,
                        a.username,
                        a.`password`,
                        a.created_at,
                        a.created_by,
                        a.updated_at,
                        a.updated_by
                        FROM
                        users AS a
                        INNER JOIN role_user as b ON a.id_role = b.id_role ;

SET FOREIGN_KEY_CHECKS = 1;
