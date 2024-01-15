-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2024 at 07:31 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nutricycle_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `name`) VALUES
(1, 'Maxim'),
(2, 'Gojek'),
(3, 'Grab');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation_target`
--

CREATE TABLE `donation_target` (
  `id` int(11) NOT NULL,
  `posyandu_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `donation_received` varchar(255) NOT NULL,
  `motor_delay_id` int(11) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `parent_income` varchar(255) NOT NULL,
  `child_number` varchar(255) NOT NULL,
  `job_id` int(11) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donation_target`
--

INSERT INTO `donation_target` (`id`, `posyandu_id`, `name`, `age`, `donation_received`, `motor_delay_id`, `weight`, `height`, `parent_income`, `child_number`, `job_id`, `latitude`, `longitude`) VALUES
(5, 3, 'mari', '15', '0', 1, '15', '16', '500.000', '1', 1, '-6.214961', '106.988151'),
(6, 2, 'pandi', '2', '1', 2, '3', '10', '200,000', '2', 2, '-6.221834', '107.006728');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL DEFAULT '0',
  `price` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `expired` varchar(255) NOT NULL,
  `texture` varchar(255) NOT NULL,
  `food_condition` varchar(255) NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `restaurant_id`, `name`, `stock`, `price`, `description`, `expired`, `texture`, `food_condition`, `availability`) VALUES
(3, 1, 'kikil', '10', '5000', 'kikil goreng', '12/2/23', 'solid', 'good', 1),
(4, 1, 'daun pepaya', '10', '3000', 'papoy', '09/11/2025', 'daun', 'good', 1);

-- --------------------------------------------------------

--
-- Table structure for table `motor_delays`
--

CREATE TABLE `motor_delays` (
  `id` int(11) NOT NULL,
  `motor_delay` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `motor_delays`
--

INSERT INTO `motor_delays` (`id`, `motor_delay`) VALUES
(1, 'Walking'),
(2, 'Linguistic');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `total` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parent_jobs`
--

CREATE TABLE `parent_jobs` (
  `id` int(11) NOT NULL,
  `job` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent_jobs`
--

INSERT INTO `parent_jobs` (`id`, `job`) VALUES
(1, 'Farmer'),
(2, 'Pemulung');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`) VALUES
(1, 'Dana'),
(2, 'OVO'),
(3, 'Gopay');

-- --------------------------------------------------------

--
-- Table structure for table `posyandus`
--

CREATE TABLE `posyandus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `sufferer` varchar(255) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posyandus`
--

INSERT INTO `posyandus` (`id`, `name`, `address`, `sufferer`, `latitude`, `longitude`) VALUES
(1, 'posyandu sigma', 'jl kamboja', '4', '0.000000', '0.000000'),
(2, 'Posyandu alpha', 'jl sarkem', '3', '0.000000', '0.000000'),
(3, 'posyandu jawa', '3', '3', '-6.218423', '106.992760'),
(4, 'Posyandu Mangga', '\"Jl. Kaliabang Bungur No.8, RT.001/RW.002, Pejuang, Kecamatan Medan Satria, Kota Bks, Jawa Barat 17131\"', '3', '-6.196521', '106.988600'),
(5, 'Posyandu Flamboyan 1', '\"Jl. Lori Sakti No.56, RT.001/RW.001, Kaliabang Tengah, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17125\"', '3', '-6.201682', '107.002877'),
(6, 'Posyandu Garuda 19', '\"Jl. Raya Bulak Sentul, RT.007/RW.027, Harapan Jaya, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17124\"', '3', '-6.206380', '106.996092'),
(7, 'Posyandu Garuda 12', '\"Perum Jl. Intan 013, RT.008/RW.013, Harapan Jaya, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17124\"', '3', '-6.211549', '106.989602'),
(8, 'Posyandu Kenanga 6', '\"Jl. H. Syamsudin No.130, RT.008/RW.010, Kota Baru, Kec. Bekasi Bar., Kota Bks, Jawa Barat 17139\"', '3', '-6.220175', '106.963921'),
(9, 'Posyandu Merpati 3', '\"Jl. Kemiri Blok Swadaya No.16, RT.001/RW.004, Bintara, Kec. Bekasi Bar., Kota Bks, Jawa Barat 17134\"', '3', '-6.225070', '106.965180'),
(10, 'Posyandu Melati 2', '\"Gg. Rukun No.50, RT.002/RW.001, Kranji, Kec. Bekasi Bar., Kota Bks, Jawa Barat 17135\"', '3', '-6.224539', '106.975015'),
(11, 'Posyandu Kemuning 1', '\"Jl. Mawar 5, RT.003/RW.008, Kali Baru, Medan Satria, Bekasi, West Java\"', '3', '-6.221012', '106.982524'),
(12, 'Posyandu Raflesia', '\"Jl. Perwirasari, RT.011/RW.008, Perwira, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17124\"', '3', '-6.209133', '107.006199'),
(13, 'Posyandu Anggrek 1', '\"Jl. KH. Muchtar Tabrani No.45, RT.002/RW.004, Perwira, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17122\"', '3', '-6.211688', '107.003329'),
(14, 'Posyandu Apel', '\"Harapan Baru, Bekasi Utara, Bekasi, West Java\"', '3', '-6.215634', '107.018276'),
(15, 'Posyandu Cladiol', '\"Teluk Pucung, Bekasi Utara, Bekasi, West Java\"', '3', '-6.207740', '107.030825'),
(16, 'Posyandu Edelweis 3', '\"Jl. P.Jaya Soemantri No.2, RT.003/RW.008, Duren Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17111\"', '3', '-6.227380', '107.029341'),
(17, 'Posyandu Flamboyan 7', '\"Jl. Perum, RT.022/RW.004, Kedungwaringin, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17121\"', '3', '-6.209862', '107.028712'),
(18, 'Posyandu Amarilis', '\"Jl. Mangga II, RT.005/RW.014, Tlk. Pucung, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17121\"', '3', '-6.217362', '107.026194'),
(19, 'Posyandu Gardena', '\"Jl. Kamper II, Tlk. Pucung, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17121\"', '3', '-6.220549', '107.023942'),
(20, 'Posyandu Matahari', '\"JL Irigasi, RT 01 RW 21, Pekayon Jaya, RT.004/RW.008, Bekasi Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17148\"', '3', '-6.225273', '107.025759'),
(21, 'Posyandu Melon RW 01', '\"Jl. Raya Perjuangan, RT.002/RW.001, Harapan Baru, Kec. Bekasi Utara, Kota Bks, Jawa Barat 17123\"', '3', '-6.222705', '107.014162'),
(22, 'Posyandu Anyelir 2', '\"Jl. Kusuma Utara VI Blok 27 No.5, RT.010/RW.017, Duren Jaya, Bekasi Timur, Bekasi, West Java 17111\"', '3', '-6.231211', '107.033655'),
(23, 'Posyandu Alamanda 2', '\"Jl kalasan Raya, RT.014/RW.004, Aren Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17111\"', '3', '-6.235223', '107.036898'),
(24, 'Posyandu Dahlia 2', '\"Jl. P.Maluku 8, RT.001/RW.009, Aren Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17111\"', '3', '-6.244078', '107.039639'),
(25, 'Posyandu Sutra Ungu 1', '\"Jl. Pahlawan, RT.005/RW.004, Duren Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17111\"', '3', '-6.244105', '107.025823'),
(26, 'Posyandu Teratai 1', '\"Margahayu, Bekasi Timur, Bekasi, West Java\"', '3', '-6.250919', '107.012132'),
(27, 'Posyandu Raflesia 1', '\"Duren Jaya, Bekasi Timur, Bekasi, West Java\"', '3', '-6.240786', '107.020154'),
(28, 'Posyandu Catelia 1', '\"Jl. Agathis IV, RT.014/RW.010, Duren Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17111\"', '3', '-6.239313', '107.021303'),
(29, 'Posyandu Catelia 2', '\"RT.010/RW.010, Duren Jaya, Bekasi Timur, Bekasi, West Java 17111\"', '3', '-6.239788', '107.017092'),
(30, 'Posyandu Catelia 3', '\"RT.013/RW.010, Duren Jaya, Bekasi Timur, Bekasi, West Java 17111\"', '3', '-6.238604', '107.018121'),
(31, 'Posyandu Mawar 2', '\"Jl. Kusuma Timur IIIA, RT.003/RW.019, Aren Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17111\"', '3', '-6.236055', '107.030879'),
(32, 'Posyandu Irida 3', '\"Jl. Irida Tim. VII, RT.014/RW.014, Bekasi Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17112\"', '3', '-6.231639', '107.018310'),
(33, 'Posyandu Intan 1', '\"Jl. Tlk. Angsan Permai, RT.003/RW.012, Bekasi Jaya, Kec. Bekasi Tim., Kota Bks, Jawa Barat 17112\"', '3', '-6.229143', '107.021076'),
(34, 'Posyandu Elang 1', '\"Jl. H. Ramli, RT.002/RW.003, Pengasinan, Kec. Rawalumbu, Kota Bks, Jawa Barat 17115\"', '3', '-6.264967', '107.014813'),
(35, 'Posyandu Nirwana', '\"Jl. Tunas Klp. No.243, RT.001/RW.007, Sepanjang Jaya, Kec. Rawalumbu, Kota Bks, Jawa Barat 17114\"', '3', '-6.271697', '107.000591'),
(36, 'Posyandu Narogong', '\"Jl. Bojong Asri Raya No.24, RT.004/RW.004, Bojong Rawalumbu, Kec. Rawalumbu, Kota Bks, Jawa Barat 17116\"', '3', '-6.281887', '107.004123'),
(37, 'Posyandu Melati', '\"RT.006/RW.005, Bojong Rawalumbu, Rawa Lumbu, Bekasi, West Java 17116\"', '3', '-6.286129', '106.995882'),
(38, 'Posyandu Mawar 1', '\"Jl. Setia, RT.002/RW.002, Bojong Rawalumbu, Kec. Rawalumbu, Kota Bks, Jawa Barat 17116\"', '3', '-6.285300', '106.991299'),
(39, 'Posyandu Pisang Susu 1', '\"Jl. SMA 63 No.38 3, RT.3/RW.10, Petukangan Utara, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12260\"', '3', '-6.230450', '106.749428'),
(40, 'Posyandu Belut 1', '\"Jl. Halimah No.12 12, RT.12/RW.3, Ulujami, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12250\"', '3', '-6.236085', '106.764524'),
(41, 'Posyandu Anggrek 1', '\"Jl. Cipulir IV No.40 6, RT.6/RW.8, Cipulir, Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12230\"', '3', '-6.235218', '106.774348'),
(42, 'Posyandu Balita Jati 2', '\"Jl. Martimbang Raya, RT.4/RW.5, Gunung, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12120\"', '3', '-6.234773', '106.788582'),
(43, 'Posyandu Sawi 1', '\"Jl. Masjid Al Muflihun No.50 4, RT.4/RW.10, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.255356', '106.767524'),
(44, 'Posyandu Sawi 2', '\"Jl. Bintaro Mulia II No.18-19 6, RT.6/RW.1, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.259473', '106.766545'),
(45, 'Posyandu Sawi 3', '\"Gg. Hj. Amninah No.19 4, RT.4/RW.10, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.255897', '106.766796'),
(46, 'Posyandu Selada 1', '\"Jl. Bintaro Permai III No.9, RT.1/RW.9, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.258004', '106.763142'),
(47, 'Posyandu Selada 4', '\"Jl. Bintaro Permai III No.1 4, RT.4/RW.9, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.258791', '106.762916'),
(48, 'Posyandu Selada 3', '\"Gg. Mushola No.10, RT.10/RW.9, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.263807', '106.760564'),
(49, 'Posyandu Selada 5', '\"RT.13/RW.9, Bintaro, Pesanggrahan, South Jakarta City, Jakarta 12330\"', '3', '-6.261676', '106.762100'),
(50, 'Posyandu Kangkung 1', '\"RT.1/RW.5, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.282079', '106.764309'),
(51, 'Posyandu Kangkung 3', '\"Jl. Mawar III No.44 2, RT.7/RW.5, Bintaro, Kec. Pesanggrahan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12330\"', '3', '-6.280077', '106.767531');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `availability` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `name`, `address`, `latitude`, `longitude`, `availability`) VALUES
(1, 'Padang Sederhana', 'Jl. Etik MKMK rt 07 / rw 10', '0.000000', '0.000000', 1),
(2, 'Seblak mang uyur', 'Jl. in aja dulu ya ', '0.000000', '0.000000', 1),
(4, 'resto jaja', 'wikwik', '-6.221534', '107.006728', 1),
(5, 'warung marta', 'bantargebang', '0.000000', '0.000000', 1),
(6, 'Kopi Nako', 'SMB', '-6.221834', '106.995445', 1);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `rating` decimal(10,0) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status`) VALUES
(1, 'canceled'),
(2, 'unpaid'),
(3, 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'awwiqwal', 'awwiqwal@gmail.com', '$2b$10$4d/lcRRYusuLGxYume.F7eRQvAoTRAHhqQcqus.FERUMwSol9R3JC');

-- --------------------------------------------------------

--
-- Table structure for table `users_addresses`
--

CREATE TABLE `users_addresses` (
  `user_id` int(11) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `donation_target`
--
ALTER TABLE `donation_target`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posyandu_id` (`posyandu_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `motor_delay_id` (`motor_delay_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `motor_delays`
--
ALTER TABLE `motor_delays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- Indexes for table `parent_jobs`
--
ALTER TABLE `parent_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posyandus`
--
ALTER TABLE `posyandus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `users_addresses`
--
ALTER TABLE `users_addresses`
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation_target`
--
ALTER TABLE `donation_target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `motor_delays`
--
ALTER TABLE `motor_delays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `parent_jobs`
--
ALTER TABLE `parent_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posyandus`
--
ALTER TABLE `posyandus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `donations_ibfk_3` FOREIGN KEY (`target_id`) REFERENCES `donation_target` (`id`),
  ADD CONSTRAINT `donations_ibfk_4` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `donation_target`
--
ALTER TABLE `donation_target`
  ADD CONSTRAINT `donation_target_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `parent_jobs` (`id`),
  ADD CONSTRAINT `donation_target_ibfk_2` FOREIGN KEY (`posyandu_id`) REFERENCES `posyandus` (`id`),
  ADD CONSTRAINT `donation_target_ibfk_3` FOREIGN KEY (`motor_delay_id`) REFERENCES `motor_delays` (`id`);

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id`) REFERENCES `donors` (`review_id`),
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `review_ibfk_4` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
