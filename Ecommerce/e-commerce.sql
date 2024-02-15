-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2021 at 08:30 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '1=> active  2=>not active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `status`, `created_at`, `update_at`) VALUES
(1, 'Natural herbs', 'أعشاب طبيعية', 1, '2021-04-10 12:23:31', '2021-04-10 14:45:51'),
(2, 'Herbal drinks', 'مشروبات عشبية', 1, '2021-04-10 12:23:31', '2021-04-10 14:46:19'),
(3, 'Decorative herbs', 'أعشاب زينة', 1, '2021-04-10 12:26:22', '2021-04-10 14:46:41'),
(5, 'Decorative herbs', 'أعشاب زينة', 0, '2021-04-10 12:27:02', '2021-04-10 14:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(2500) NOT NULL DEFAULT 'default.jpg',
  `title` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` smallint(10) DEFAULT 1 COMMENT '1->not active , 2->active',
  `discount` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `photo`, `title`, `details`, `start_date`, `end_date`, `status`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'banner-1.png', 'Ramadan discounts', '', '2021-04-12', '2021-04-30', 2, 50, '2021-04-12 17:50:19', '2021-04-12 18:13:11'),
(2, 'banner-2.png', 'Eid discounts', '', '2021-04-12', '2021-05-12', 1, 75, '2021-04-12 17:51:11', '2021-04-12 18:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `offers_products`
--

CREATE TABLE `offers_products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `offer_id` int(10) UNSIGNED NOT NULL,
  `priceafterdiscount` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers_products`
--

INSERT INTO `offers_products` (`product_id`, `offer_id`, `priceafterdiscount`) VALUES
(3, 1, '500.00'),
(6, 2, '2000.00'),
(7, 1, '1000.00'),
(8, 2, '500.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` smallint(5) NOT NULL DEFAULT 1,
  `total` decimal(8,2) NOT NULL,
  `time` time NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `status`, `total`, `time`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '0000-00-00', 1, '22000.00', '18:05:01', 25, '2021-04-12 16:06:58', '2021-04-12 16:06:58'),
(2, '0000-00-00', 1, '18000.00', '18:30:00', 21, '2021-04-12 16:06:58', '2021-04-12 16:06:58'),
(3, '0000-00-00', 1, '1000.00', '18:05:01', 30, '2021-04-12 16:08:52', '2021-04-12 16:08:52'),
(4, '0000-00-00', 1, '5400.00', '18:30:00', 29, '2021-04-12 16:08:52', '2021-04-12 16:08:52'),
(5, '0000-00-00', 1, '1200.00', '18:05:01', 32, '2021-04-12 16:10:24', '2021-04-12 16:10:24'),
(6, '0000-00-00', 1, '6900.00', '18:30:00', 33, '2021-04-12 16:10:24', '2021-04-12 16:10:24'),
(7, '0000-00-00', 1, '6555.00', '19:00:00', 31, '2021-04-12 16:10:24', '2021-04-12 16:10:24'),
(8, '0000-00-00', 1, '6578.00', '20:02:30', 27, '2021-04-12 16:10:24', '2021-04-12 16:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `details_ar` text NOT NULL,
  `details_en` text NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT 1,
  `photo` varchar(255) DEFAULT 'default.jpg',
  `price` decimal(8,2) NOT NULL,
  `subcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `created_id` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_id` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ar`, `name_en`, `details_ar`, `details_en`, `stock`, `status`, `photo`, `price`, `subcategory_id`, `created_id`, `updated_id`) VALUES
(1, 'النغت المنشاري', 'The prismatic trance', 'النبات شجري والبراعم حرشفية ذات عنق في غالب الأحيان والأوراق بسيطة ذات عنق متساقطة متبادلة منشارية أو مسننة ونادرا كاملة الإزهار وحيدة الجنس بشكل نورات زهرية أحادية المسكن وتظهر الأزهار قبل الأوراق. الأزهار الذكرية حمراء اللون ومن هنا أخذ النبات اسمه والثمار متعددة الوجوه منضغطة لها جناح مجتمعة بشكل مخروط بيضوي الشكل قصير وله حراشف خشبية سميكة ودائمة تحمل كل حرشفة في قاعدتها من الداخل ثمرتين وتنضج الثمار خلال سنة واحدة', 'The plant is arboreal, and the buds are mostly scaly-necked. The leaves are simple with a deciduous, reciprocal or serrate-neck, rarely full-bloom and unisexual in the form of single-netted flower inflorescences. Flowers appear before the leaves. The male flowers are red in color and from here the plant took its name, and the fruits are multifaceted, compressed, have a wing combined in the shape of a short oval cone and have thick and permanent woody scales that bear two fruits at their base from the inside, and the fruits ripen within one year.\r\n', 10, 1, '1.jpg', '10000.00', 1, '2021-04-10 15:14:58', '2021-04-10 15:46:18'),
(2, 'نعناع', 'mint', 'يستخدم كعشب طبي لعلاج بعض نزلات البرد', 'It is used as medicinal flavor to treat some colds', 10, 1, '2.jpg', '1000.00', 12, '2021-04-10 15:24:28', '2021-04-10 15:47:29'),
(3, 'شاي أسود', 'Black tea', 'ويحضر من أوراق الشاي الأخضر بعد القيام بعملية الأكسدة، وكلا النوعين بهما كافيين طبيعي ضار ومركبات أكسدة وينشطان الجهاز العصبي بصورة سلبية عبر تعطيل مستقبلات عصبية في المخ كما أنهما يذيبان بعض الدهون ويحرقان سعرات حرارية عالية. والشاي به مضادات أكسدة ورغم أن الشاي منبه لوجود الكافيين إلا أنه ُيمكن أن يسبب لبعض متناوليه شعوراً بالوهن والضعف والإمساك وسوء الهضم والأرق.', 'It is prepared from green tea leaves after the oxidation process, and both types contain harmful natural caffeine and oxidation compounds and activate the nervous system negatively by disrupting nerve receptors in the brain as they dissolve some fats and burn high calories. Tea has antioxidants, and although tea is a stimulant to the presence of caffeine, it can cause some of its users to feel weak, weak, constipated, poor digestion and insomnia.\r\n', 100, 1, '9.jpg', '1500.00', 11, '2021-04-10 15:29:45', '2021-04-12 16:02:39'),
(4, 'الشاي الأخضر', 'green tea', '\r\nأوراق الشاي الأخضر  لم تخمر فتظل موادها كما هي. ولذلك فهو أنفع قليلاً من الشاي الأسود (الأحمر) وأقل ضرراً منه إلا أن كليهما ضار أضراراً لا ينبغي تجاهلها بسبب مادة الكافيين. إلا أن بعض الصينيين يستخدم الشاي الأخضر كعلاج للصداع النصفي لاعتقادهم أن له تأثيراً عليه. وهناك اعتقاد أن الشاي له بعض الفوائد للأسنان لوجود مادة الفلورايد به. وهناك اعتقاد أن الشاي يساعد علي احتراق الدهون بالجسم وينظم سكر الدم ومعدل هرمون الإنسولين\r\n', 'Green tea leaves are not fermented, so their substances remain the same. Therefore, it is slightly more beneficial than black tea (red) and less harmful than it, but both are harmful and should not be ignored due to caffeine. However, some Chinese people use green tea as a treatment for migraines, because they believe it has an effect on it. There is a belief that tea has some benefits for the teeth due to the presence of fluoride in it. There is a belief that tea helps to burn fats in the body and regulates blood sugar and insulin hormone levels', 100, 1, '7.jpg', '1500.00', 11, '2021-04-10 15:29:45', '2021-04-10 15:47:50'),
(5, 'شاي الألونج', 'Oolong tea', 'نوع من أنواع الشاي الذي يتعرض إلى عملية أكسدة خفيفة ولـيست كاملة مثل الشاي الأسود (الأحمر)، ويكتسب خصائص معتدلة ما بين الشاي الأخضر الذي لا يتعرض للاكسدة، والشاي الأسود (الأحمر) الذي يتعرض إلى الاكسدة الكاملة', 'A type of tea that undergoes a light oxidation process and is not complete, like black (red) tea, and has moderate properties between green tea that does not undergo oxidation, and black (red) tea that undergoes complete oxidation', 50, 1, '1.jpg', '15000.00', 11, '2021-04-10 15:32:12', '2021-04-12 17:22:33'),
(6, 'الشاي الأبيض', 'White tea', 'الشاي الأبيض\r\nيعتبر الشاي الأبيض من أندر أنواع الشاي، وهو مشروب خفيف الطعم، ولإنتاجه يتم قطف البراعم الصغيرة لشجرة الشاي وكذلك الأوراق الصغيرة بعناية ورفق، ويتم تجاهل الأوراق الكبيرة والعادية، ويتم تجفيفها بعد ذلك بعناية أيضاً.', 'White tea\r\nWhite tea is one of the rarest types of tea, and it is a mild drink. To produce it, the young shoots of the tea tree, as well as the young leaves, are carefully and gently harvested. The large and regular leaves are discarded, and they are dried carefully after that as well.', 50, 1, '3.jpg', '6000.00', 11, '2021-04-10 15:32:12', '2021-04-10 15:48:06'),
(7, 'الزعتر', 'Thyme', 'ينتمي الى عائلة النباتات الشفويةوعادةً ما يتم استخدام أوراق الزعتر كتوابل، بينما يستخدم زيتها كمادة طبيةويتراوح طول نبات الزعتر ما بين 0.30 إلى 0.50 متر، ومن الجدير بالذكر أنه يمكن زراعة الزعتر في أحواض المنزل، كما يجب اختيار أحواض كبيرة مناسبة لحجم جذور الزعتر، ويجب أيضًا القيام بتبديل التربة كل عامين', 'It belongs to the family of oral plants, and thyme leaves are usually used as a spice, while its oil is used as a medicinal substance. The length of the thyme plant ranges between 0.30 to 0.50 meters. Do soil replacements every two years', 50, 1, '4.jpg', '7000.00', 1, '2021-04-10 15:35:23', '2021-04-10 15:48:12'),
(8, 'القرع المر', 'Bitter gourd', 'ان القرع المر نوع من الخضروات المشهورة في الهند وبعض الدول الاسيوية، وتستخدم ثمار وبذور هذا النبات من أجل صنع الدواء، يتم استخدام القرع المر في العديد من الأغراض الدوائية والعلاجية، إذ يحتوي القرع المر على مادة كيميائية تشبه عمل الإنسولين إلى حد كبير.', 'The bitter gourd is a type of vegetable popular in India and some Asian countries, and the fruits and seeds of this plant are used to make medicine. Bitter gourd is used in many medicinal and therapeutic purposes, as bitter gourd contains a chemical similar to the action of insulin to a large extent.', 10, 1, '5.jpg', '10000.00', 9, '2021-04-10 15:38:07', '2021-04-10 15:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `quntity` int(11) NOT NULL,
  `priceAfterOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_orders`
--

INSERT INTO `products_orders` (`product_id`, `order_id`, `quntity`, `priceAfterOrder`) VALUES
(1, 4, 2, 11122),
(2, 5, 5, 60000),
(3, 6, 5, 60000),
(3, 7, 2, 13000),
(5, 1, 2, 13000),
(5, 3, 2, 11122),
(5, 4, 7, 60000),
(6, 8, 2, 13000),
(7, 1, 5, 60000),
(7, 2, 1, 60000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_reviwes`
-- (See below for the actual view)
--
CREATE TABLE `products_reviwes` (
`id` int(10) unsigned
,`name_ar` varchar(100)
,`name_en` varchar(100)
,`details_ar` text
,`details_en` text
,`stock` int(11)
,`status` smallint(6)
,`photo` varchar(255)
,`price` decimal(8,2)
,`subcategory_id` int(10) unsigned
,`created_id` timestamp
,`updated_id` timestamp
,`subcatName` varchar(50)
,`catName` varchar(50)
,`reviewsAvg` decimal(5,0)
,`reviewsCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `products_specs`
--

CREATE TABLE `products_specs` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `spec_id` int(10) UNSIGNED NOT NULL,
  `value_en` varchar(255) NOT NULL,
  `value_ar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `value` tinyint(5) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`product_id`, `user_id`, `value`, `comment`, `date`) VALUES
(1, 26, 5, '', '2021-04-10 21:14:42'),
(1, 27, 5, '', '2021-04-10 21:14:42'),
(1, 31, 4, '', '2021-04-10 21:14:42'),
(2, 25, 5, '', '2021-04-10 21:13:47'),
(2, 28, 5, '', '2021-04-10 21:13:47'),
(2, 30, 5, '', '2021-04-10 21:13:47'),
(2, 32, 5, '', '2021-04-10 21:13:47'),
(3, 21, 5, '', '2021-04-10 21:16:23'),
(4, 33, 2, '', '2021-04-10 21:16:31'),
(5, 25, 3, '', '2021-04-10 21:14:07'),
(5, 28, 5, '', '2021-04-10 21:14:07'),
(6, 25, 5, '', '2021-04-10 21:12:20'),
(6, 26, 4, '', '2021-04-10 21:13:06'),
(6, 28, 3, '', '2021-04-10 21:12:20'),
(6, 30, 2, '', '2021-04-10 21:13:06'),
(6, 31, 5, '', '2021-04-10 21:13:06'),
(6, 32, 4, '', '2021-04-10 21:13:06'),
(6, 33, 5, '', '2021-04-10 21:13:06'),
(7, 21, 5, '', '2021-04-10 21:11:05'),
(7, 25, 4, '', '2021-04-10 21:10:36'),
(7, 27, 4, '', '2021-04-10 21:12:00'),
(7, 28, 3, '', '2021-04-10 21:10:36'),
(7, 29, 5, '', '2021-04-10 21:12:00'),
(7, 30, 2, '', '2021-04-10 21:11:05'),
(7, 32, 2, '', '2021-04-10 21:11:36'),
(8, 21, 1, '', '2021-04-10 21:15:37'),
(8, 23, 1, '', '2021-04-10 21:15:37'),
(8, 28, 2, '', '2021-04-10 21:15:37'),
(8, 29, 1, '', '2021-04-10 21:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_ar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>active 2=>notactive',
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name_en`, `name_ar`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Mountain herbs', 'أعشاب جبلية', 1, 1, '2021-04-10 12:28:32', '2021-04-10 14:48:09'),
(2, 'Herbalists', 'أعشاب طبية', 1, 1, '2021-04-10 12:28:32', '2021-04-10 14:48:41'),
(8, 'Cosmetic herbs', 'أعشاب تجميلية', 1, 1, '2021-04-10 12:30:39', '2021-04-10 14:49:06'),
(9, 'Desert herbs', 'أعشاب صحراوية', 1, 1, '2021-04-10 12:31:29', '2021-04-10 14:49:22'),
(11, 'Tea', 'الشاي', 1, 2, '2021-04-10 12:33:22', '2021-04-10 14:50:30'),
(12, 'Medicinal herbal drinks', 'مشروبات عشبية طبية', 1, 2, '2021-04-10 12:33:22', '2021-04-10 14:50:56'),
(18, 'African', 'افريقية', 1, 3, '2021-04-10 12:37:02', '2021-04-10 14:55:39'),
(19, 'Asian', 'اسيوية', 1, 3, '2021-04-10 12:37:02', '2021-04-10 14:56:51'),
(23, 'European', 'أوروبية', 1, 3, '2021-04-10 12:41:14', '2021-04-10 14:56:05'),
(24, 'American', 'امريكية', 1, 3, '2021-04-10 12:41:14', '2021-04-10 14:56:37'),
(25, 'Australian', 'استرالية', 1, 3, '2021-04-10 12:41:34', '2021-04-10 14:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `code` mediumint(5) DEFAULT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'm',
  `status` tinyint(5) NOT NULL DEFAULT 2 COMMENT '1=>verified user 0=>not active  2=>not verified',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `photo`, `code`, `gender`, `status`, `created_at`, `updated_at`) VALUES
(21, 'Reem', '01149275511', 'reem.monier1994@yahoo.com', '6971214ea195fb5a2b0dcb5c902155b6042ec3b3', 'default.jpg', 88548, 'f', 1, '2021-04-08 19:16:04', '2021-04-09 17:29:47'),
(23, 'tasneem', '01000040001', 'reem.monier1994@gmail.com', '289ee4dd396cf3af2026ec792305e451932a430e', 'default.jpg', 29029, 'f', 1, '2021-04-08 19:18:21', '2021-04-08 19:18:42'),
(25, 'Ahmad', '01149980190', 'eng.ahmad34@gmail.com', '7fe51404222314cab162f37ad78541883f62a4b3', 'default.jpg', 76275, 'm', 1, '2021-04-09 13:05:23', '2021-04-09 13:06:17'),
(26, 'mohamed', '011111111', 'moh@gmail.com', '2344rfdsf454t5t54cf45645645t46', 'default.jpg', 45676, 'm', 1, '2021-04-10 21:04:54', '2021-04-10 21:05:26'),
(27, 'rama', '0122222222', 'rama@gmail.com', 'ertgfgbfb54ytthb567b65b65yv65vy765y7657y', 'default.jpg', 34567, 'f', 1, '2021-04-10 21:04:54', '2021-04-10 21:05:30'),
(28, 'assem', '013333333', 'assem@gmail.com', 'sgfdhbfb567b56yvrtfghgfhbfgvghfghfghgf', 'default.jpg', 23156, 'm', 1, '2021-04-10 21:06:35', '2021-04-10 21:06:35'),
(29, 'yaser', '0124444444', 'yaser@gmail.com', 'rtgtfhfghfh5y56yb6y56b65yb65', 'default.jpg', 25896, 'm', 1, '2021-04-10 21:06:35', '2021-04-10 21:06:35'),
(30, 'esraa', '01444444', 'esraa@gmail.com', 'efgv456v5v4y5b65u56uvy6crtr6t', 'default.jpg', 12365, 'f', 1, '2021-04-10 21:07:32', '2021-04-10 21:07:32'),
(31, 'hadeer', '018888888', 'hadeer@gmail.com', 'rtv467y65756767h57h', 'default.jpg', 25874, 'f', 1, '2021-04-10 21:07:32', '2021-04-10 21:07:32'),
(32, 'galal', '01555555', 'galal@gmail.com', '34243242534654363634', 'default.jpg', 45689, 'm', 1, '2021-04-10 21:09:43', '2021-04-10 21:09:43'),
(33, 'mostafa', '02555555', 'mostafa@gmail.com', 'fg;dkf;lsdfk;sdlfk;sdfk,df', 'default.jpg', 14598, 'm', 1, '2021-04-10 21:09:43', '2021-04-10 21:09:43'),
(34, 'Reem Monier', '01111111111', 'ree@gmail.com', '9281d8d222a9aba60d952017510a36a7afec0103', 'default.jpg', 29942, 'f', 1, '2021-04-11 00:38:37', '2021-04-11 00:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure for view `products_reviwes`
--
DROP TABLE IF EXISTS `products_reviwes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_reviwes`  AS   (select `products`.`id` AS `id`,`products`.`name_ar` AS `name_ar`,`products`.`name_en` AS `name_en`,`products`.`details_ar` AS `details_ar`,`products`.`details_en` AS `details_en`,`products`.`stock` AS `stock`,`products`.`status` AS `status`,`products`.`photo` AS `photo`,`products`.`price` AS `price`,`products`.`subcategory_id` AS `subcategory_id`,`products`.`created_id` AS `created_id`,`products`.`updated_id` AS `updated_id`,`subcategories`.`name_en` AS `subcatName`,`categories`.`name_en` AS `catName`,if(round(avg(`reviews`.`value`),0) is null,0,round(avg(`reviews`.`value`),0)) AS `reviewsAvg`,count(`reviews`.`product_id`) AS `reviewsCount` from (((`products` left join `reviews` on(`products`.`id` = `reviews`.`product_id`)) left join `subcategories` on(`subcategories`.`id` = `products`.`subcategory_id`)) left join `categories` on(`categories`.`id` = `subcategories`.`category_id`)) group by `products`.`id`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `user_cart_FK` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers_products`
--
ALTER TABLE `offers_products`
  ADD PRIMARY KEY (`product_id`,`offer_id`),
  ADD KEY `offers_offers_products_FK` (`offer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_orders_FK` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `products_subcategories_FK` (`subcategory_id`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD PRIMARY KEY (`product_id`,`order_id`),
  ADD KEY `order_products_order_fk` (`order_id`);

--
-- Indexes for table `products_specs`
--
ALTER TABLE `products_specs`
  ADD PRIMARY KEY (`product_id`,`spec_id`),
  ADD KEY `specs_products_specs_FK` (`spec_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `user_reviews_FK` (`user_id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_categories_FK` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `product_wishlist_FK` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `products_carts_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_cart_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offers_products`
--
ALTER TABLE `offers_products`
  ADD CONSTRAINT `offers_offers_products_FK` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_offers_products_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `users_orders_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_subcategories_FK` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `order_products_order_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_products_order_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_specs`
--
ALTER TABLE `products_specs`
  ADD CONSTRAINT `products_products_specs_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specs_products_specs_FK` FOREIGN KEY (`spec_id`) REFERENCES `specs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `product_reviews_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_reviews_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_categories_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `product_wishlist_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_wishlist_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
