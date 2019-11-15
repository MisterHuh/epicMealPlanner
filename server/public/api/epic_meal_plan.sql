-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2019 at 04:08 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MealPlan`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `meal_time` enum('breakfast','lunch','dinner') COLLATE utf8_unicode_ci NOT NULL,
  `recipe_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `recipe_label` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`id`, `date`, `meal_time`, `recipe_id`, `recipe_label`) VALUES
(1, '2019-09-08', 'lunch', 1, ''),
(2, '2019-09-10', 'breakfast', 2, ''),
(3, '2019-09-10', 'dinner', 3, ''),
(4, '2019-09-17', 'breakfast', 305, 'Double-Salmon D'),
(5, '2019-09-18', 'breakfast', 305, 'Double-Salmon D'),
(6, '2019-09-16', 'breakfast', 305, 'Double-Salmon D'),
(7, '2019-09-20', 'dinner', NULL, 'pizza'),
(8, '2019-09-21', 'lunch', NULL, 'pizza'),
(9, '2019-09-16', 'lunch', 10, 'Chicken Reuben'),
(10, '2019-09-17', 'lunch', 10, 'Chicken Reuben'),
(11, '2019-09-17', 'dinner', 10, 'Chicken Reuben'),
(12, '2019-09-18', 'dinner', 10, 'Chicken Reuben'),
(13, '2019-09-18', 'lunch', 10, 'Chicken Reuben'),
(14, '2019-11-12', 'breakfast', NULL, 'Chicken Parm'),
(15, '2019-11-12', 'lunch', 7, 'Smothered Chick'),
(16, '2019-11-12', 'dinner', 7, 'Smothered Chick'),
(17, '2019-11-14', 'lunch', 330, 'Italian Sausage'),
(18, '2019-11-14', 'dinner', 330, 'Italian Sausage'),
(19, '2019-11-14', 'breakfast', 330, 'Italian Sausage'),
(20, '2019-11-15', 'breakfast', NULL, 'Beer!'),
(21, '2019-11-15', 'lunch', NULL, 'Beer!'),
(22, '2019-11-19', 'lunch', NULL, 'Sandwich'),
(23, '2019-11-19', 'dinner', NULL, 'Sandwich'),
(24, '2019-11-18', 'lunch', NULL, 'Eggs'),
(25, '2019-11-18', 'dinner', NULL, 'Eggs'),
(26, '2019-11-13', 'breakfast', 330, 'Italian Sausage'),
(27, '2019-11-13', 'lunch', 330, 'Italian Sausage'),
(28, '2019-11-13', 'dinner', 330, 'Italian Sausage'),
(29, '2019-11-16', 'breakfast', 153, 'Barbecued Pork'),
(30, '2019-11-16', 'lunch', 153, 'Barbecued Pork'),
(31, '2019-11-16', 'dinner', 153, 'Barbecued Pork'),
(32, '2019-11-27', 'breakfast', NULL, 'Beer'),
(33, '2019-11-27', 'lunch', NULL, 'Beer'),
(34, '2019-11-27', 'dinner', NULL, 'Beer'),
(35, '2019-11-28', 'breakfast', NULL, 'PB & J'),
(36, '2019-11-28', 'dinner', NULL, 'PB & J'),
(37, '2019-11-28', 'lunch', NULL, 'PB & J'),
(38, '2019-12-02', 'breakfast', NULL, 'Eggs'),
(39, '2019-12-01', 'breakfast', NULL, 'Eggs'),
(40, '2019-12-03', 'breakfast', NULL, 'Eggs');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `recipe_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `recipe_id`) VALUES
(7, 1),
(10, 1),
(9, 2),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `directions_url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `serving_size` tinyint(4) NOT NULL,
  `label` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cooking_time` mediumint(9) NOT NULL,
  `categories` enum('favorites','gluten-free','vegan','keto','paleo','dairy-free') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `directions_url`, `image_url`, `serving_size`, `label`, `cooking_time`, `categories`) VALUES
(1, 'http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html', 'https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg', 4, 'Chicken Vesuvio', 60, NULL),
(2, 'http://www.latimes.com/food/la-fo-master-class-recipe3-20110908-story.html', 'https://www.edamam.com/web-img/980/9807d9d44544c2b1a92576ef4e409836', 1, 'Steak', 51, NULL),
(3, 'http://www.marthastewart.com/862754/pork-quesadillas', 'https://www.edamam.com/web-img/310/3109aa67eaebff453982004a29ae61f5.jpg', 4, 'Pork Quesadilla', 25, NULL),
(7, 'https://www.foodnetwork.com/recipes/sandra-lee/smothered-chicken-recipe-1950282', 'https://www.edamam.com/web-img/65a/65a7ad1b644869cd901aafd23aa3bf11.jpeg', 4, 'Smothered Chicken', 30, 'favorites'),
(10, 'http://www.marthastewart.com/851307/chicken-reuben', 'https://www.edamam.com/web-img/141/141f3159fe249dd51240b9f6ff8161ff.jpg', 4, 'Chicken Reuben', 15, 'favorites'),
(145, 'http://www.seriouseats.com/recipes/2011/02/creamy-tofu-sauce-recipe.html', 'https://www.edamam.com/web-img/d50/d5015f52972ebbf2746ae592d477dc4d.jpg', 2, 'Creamy Tofu Sauce Recipe', 10, 'vegan'),
(146, 'https://www.marthastewart.com/1049665/baked-tofu', 'https://www.edamam.com/web-img/b71/b710b321ef24d6dc06e437729fc954dd.jpg', 16, 'Baked Tofu', 70, 'vegan'),
(148, 'http://www.epicurious.com/recipes/food/views/marinated-tofu-51181210', 'https://www.edamam.com/web-img/a03/a036fb0b3e5e40dd1df4cc2b68b83330', 4, 'Marinated Tofu recipes', 45, 'vegan'),
(149, 'http://www.foodrepublic.com/recipes/crispy-pan-fried-tofu-recipe/', 'https://www.edamam.com/web-img/fbb/fbb0e7c450a36325a99619cb8e8057d6', 4, 'Crispy Pan-Fried Tofu recipes', 25, 'vegan'),
(150, 'http://www.cookingchanneltv.com/recipes/roger-mooking/tofu-fries.html', 'https://www.edamam.com/web-img/923/923a5695c21673352373147b02e69c52.jpg', 4, 'Tofu Fries', 25, 'vegan'),
(151, 'http://www.ditchthecarbs.com/2016/01/25/keto-crepes/', 'https://www.edamam.com/web-img/835/835f91bc0dac7f322f75b85b2eba3ce6', 4, 'Keto Crepes recipes', 20, 'keto'),
(152, 'http://fluffychixcook.com/keto-chocolate-cake/', 'https://www.edamam.com/web-img/962/962c283e4a2201b4ec71a5b1b6971f3d', 12, 'Keto Chocolate Cake recipes', 2, 'keto'),
(153, 'http://www.cookstr.com/recipes/barbecued-pork-nina-simonds', 'https://www.edamam.com/web-img/4b2/4b234f17846dabd0b06ee5c4b18043ba.jpg', 8, 'Barbecued Pork', 60, 'favorites'),
(154, 'https://www.chowhound.com/recipes/pork-chicharron-quesadillas-31531', 'https://www.edamam.com/web-img/bc2/bc2386d04da921a3250ff3e76aa037aa.jpg', 20, 'Pork Chicharron Quesadillas', 4, 'keto'),
(280, 'http://nomnompaleo.com/post/36060636540/paleo-sriracha', 'https://www.edamam.com/web-img/e50/e50584043c015a91a26a7a37f093d476', 2, 'Paleo Sriracha recipes', 20, 'paleo'),
(281, 'http://www.foodrepublic.com/recipes/holy-grail-status-perfect-paleo-pie-crust-recipe/', 'https://www.edamam.com/web-img/1ca/1cab9debb6ffa9230133b17eb123e210', 8, 'Perfect Paleo Pie Crust recipe', 15, 'paleo'),
(282, 'http://www.thekitchn.com/recipe-bacon-date-paleo-bites-232303', 'https://www.edamam.com/web-img/07b/07bf503e209ce697ff840e3c4d987349', 15, 'Bacon Date Paleo Bites recipes', 30, 'paleo'),
(283, 'https://www.chowhound.com/recipes/grain-free-cauliflower-fried-rice-31780', 'https://www.edamam.com/web-img/a08/a0871c36533ebb21415125931b6587ea.jpg', 4, 'Grain-Free Cauliflower Fried R', 45, 'paleo'),
(287, 'http://honestcooking.com/delicious-side-dish-baked-cauliflower/', 'https://www.edamam.com/web-img/505/50531df0f42014f1c35269289d529a38.jpg', 2, 'Baked cauliflower', 40, 'paleo'),
(289, 'http://www.thekitchn.com/recipe-dairyfree-nutella-recipes-from-the-kitchn-213608', 'https://www.edamam.com/web-img/804/804e22679610454e527cac4fa8cdcc2d', 2, 'Dairy-Free Nutella recipes', 30, 'dairy-free'),
(290, 'http://honestcooking.com/dairy-free-apple-pancakes-recipe/', 'https://www.edamam.com/web-img/0c4/0c49694ee37c9ce486ed8465d1ee3664.jpg', 2, 'Dairy-free Apple Pancakes', 25, 'dairy-free'),
(291, 'http://www.jamieoliver.com/recipes/dessert-recipes/almond-honey-dairy-free-ice-cream/', 'https://www.edamam.com/web-img/433/4331578930944ea50d624ca3783b062d.jpg', 6, 'Almond & honey dairy-free ice ', 15, 'dairy-free'),
(292, 'http://www.seriouseats.com/recipes/2012/06/gluten-free-cream-cheese-pancakes-recipe.html', 'https://www.edamam.com/web-img/9a7/9a7c1f32d17f6c660d6508165b136de9.jpg', 4, 'Gluten-Free Cream Cheese Panca', 20, 'dairy-free'),
(293, 'https://www.marthastewart.com/1164898/dairy-free-smashed-potatoes', 'https://www.edamam.com/web-img/bfe/bfecdf0b1d3d2ca9f56c7a47e989d29b.jpg', 8, 'Dairy-Free Smashed Potatoes', 30, 'dairy-free'),
(294, 'http://www.seriouseats.com/recipes/2011/11/gluten-free-tuesday-thanksgiving-stuffing.html', 'https://www.edamam.com/web-img/af4/af405d431723a6a5e400e05bcf353f33.jpg', 6, 'Gluten-Free Stuffing', 60, 'gluten-free'),
(295, 'http://honestcooking.com/gluten-free-mac-and-cheese/', 'https://www.edamam.com/web-img/789/78993859e05cf4e542720658ae78c80b.jpg', 14, 'Gluten-Free Mac and Cheese', 25, 'gluten-free'),
(296, 'http://www.jamieoliver.com/recipes/uncategorised-recipes/gluten-free-citrus-shortbread/', 'https://www.edamam.com/web-img/be9/be9a7ba855f40d1df3f76d18658b1136.jpg', 20, 'Gluten-free citrus shortbread', 30, 'gluten-free'),
(297, 'https://www.chowhound.com/recipes/gluten-free-almond-crinkle-cookies-31189', 'https://www.edamam.com/web-img/dfa/dfa0dd872fd439021b81f1a725adddb5.jpg', 16, 'Gluten-Free Almond Crinkle Coo', 40, 'gluten-free'),
(298, 'https://www.marthastewart.com/945295/gluten-free-oatmeal-cookies', 'https://www.edamam.com/web-img/573/573dfb503e70012138a4716f7bf74fc5.jpg', 36, 'Gluten-Free Oatmeal Cookies', 60, 'gluten-free'),
(304, 'http://www.marthastewart.com/315784/steamed-salmon', 'https://www.edamam.com/web-img/b93/b93bf26f0735017b39884b87438cb8d5.jpg', 1, 'Steamed Salmon', 40, NULL),
(305, 'http://www.epicurious.com/recipes/food/views/Double-Salmon-Dip-104796', 'https://www.edamam.com/web-img/596/5962421cc40b9a6ef508d2449afc87d8', 3, 'Double-Salmon Dip recipes', 35, NULL),
(306, 'http://www.thekitchn.com/recipe-simple-salmon-teriyaki-175311', 'https://www.edamam.com/web-img/46a/46af084445aefa86501824376d84345a', 4, 'Salmon Teriyaki recipes', 60, NULL),
(307, 'http://honestcooking.com/quick-meal-paprika-roasted-salmon/', 'https://www.edamam.com/web-img/bd5/bd50b9c0ea8b7580b5cbba60522be57f.jpg', 2, 'Quick Meal - Paprika Roasted S', 20, NULL),
(308, 'http://www.foodrepublic.com/recipes/smoked-salmon-goat-cheese-recipe/', 'https://www.edamam.com/web-img/db3/db3f7d20a83d2b1425b108de1f68d60b', 4, 'Smoked Salmon & Goat Cheese re', 20, NULL),
(309, 'http://www.tastingtable.com/entry_detail/chefs_recipes/14337/Smoky_Tea_Cured_Salmon_Two_Ways_from_the_Tasting_Table_Test.htm', 'https://www.edamam.com/web-img/085/085a340d85a4a22e02df620ab4ce5391', 8, 'Tea Time for Salmon recipes', 30, NULL),
(310, 'https://www.menshealth.com/recipes/salmon-toast', 'https://www.edamam.com/web-img/b82/b829b6215770820acdcdc13bd7753419.jpg', 4, 'Salmon Toast', 5, NULL),
(311, 'http://www.cookstr.com/recipes/smoked-salmon-spread-julee-rosso', 'https://www.edamam.com/web-img/171/171c774ae7ca0b52282c2b50477182fd.jpg', 6, 'Smoked Salmon Spread', 15, NULL),
(312, 'http://www.seriouseats.com/recipes/2012/05/tender-grilled-short-ribs.html', 'https://www.edamam.com/web-img/4b2/4b2e7953ff6f99118bd1c418d249bc87.jpg', 4, 'Tender Grilled Short Ribs Reci', 30, NULL),
(313, 'http://www.bbc.co.uk/food/recipes/jennysbarbecuesparer_70172', 'https://www.edamam.com/web-img/439/43935b922c6b19e33b0fcd353477c198.jpg', 6, 'Barbecue ribs', 60, NULL),
(314, 'http://www.epicurious.com/recipes/food/views/Chinese-Barbecued-Baby-Back-Ribs-240581', 'https://www.edamam.com/web-img/323/323d188c71c9ee213fcea802c58a3d5b', 4, 'Chinese Barbecued Baby Back Ri', 60, NULL),
(315, 'https://www.realsimple.com/food-recipes/browse-all-recipes/dry-rubbed-baby-back-ribs', 'https://www.edamam.com/web-img/c9d/c9de7422ba9110a76a9c1846f4985216.jpg', 4, 'Dry-Rubbed Baby-Back Ribs', 45, NULL),
(316, 'http://www.delish.com/cooking/recipe-ideas/recipes/a20656/hoisin-glazed-ribs-recipe-fw0113/', 'https://www.edamam.com/web-img/a43/a43596f8273ee676321177faeddd35a0.jpg', 2, 'Hoisin-Glazed Ribs', 10, NULL),
(318, 'http://www.foodrepublic.com/recipes/braised-beef-short-ribs-recipe/', 'https://www.edamam.com/web-img/d33/d33e1ec9380845a5123b3abe80581b6b', 4, 'Braised Beef Short Ribs recipe', 30, NULL),
(319, 'http://www.cookstr.com/recipes/brother-davidrsquos-grilled-chicken-and-ribs', 'https://www.edamam.com/web-img/475/475a5c773b1cd32212ea408e1be3c8de.jpg', 10, 'Brother David’s Grilled Chicke', 60, NULL),
(320, 'https://www.foodnetwork.com/recipes/parboiled-baby-back-ribs-3414663', 'https://www.edamam.com/web-img/38b/38b275483e22c4ab24adb85976b089fc.jpeg', 6, 'Parboiled Baby Back Ribs', 45, NULL),
(322, 'http://www.marthastewart.com/317400/perfect-grilled-steak', 'https://www.edamam.com/web-img/ec5/ec5b5a864df655b2bb9fea6630970fae.jpg', 2, 'Perfect Grilled Steak', 51, NULL),
(323, 'http://www.epicurious.com/recipes/food/views/Salt-And-Pepper-Steak-51236360', 'https://www.edamam.com/web-img/5c1/5c1b720140f2826304b9887b181df0c6', 6, 'Salt-And-Pepper Steak recipes', 30, NULL),
(324, 'http://thepioneerwoman.com/cooking/fried-round-steak/', 'https://www.edamam.com/web-img/c59/c5921a92bb33295e8d5ee2cffdd3a065', 6, 'Fried Round Steak recipes', 25, NULL),
(325, 'http://www.foodrepublic.com/recipes/how-to-grill-a-buffalo-steak/', 'https://www.edamam.com/web-img/12b/12bff1d2db0f7b01ed62e8546ee26d31', 4, 'How to Grill a Buffalo Steak r', 40, NULL),
(326, 'http://www.seriouseats.com/recipes/2012/07/fresh-rigatoni-and-steak-bolognese-recipe.html', 'https://www.edamam.com/web-img/fb8/fb87a89c25fa5e963ae594e6ad2c74b6.jpg', 2, 'Fresh Rigatoni with Marinara a', 30, NULL),
(327, 'http://www.cookingchanneltv.com/recipes/alton-brown/sirloin-steak.html', 'https://www.edamam.com/web-img/8a5/8a5875a907188624b91cdf5fdc3592ee.jpg', 4, 'Sirloin Steak', 23, NULL),
(328, 'http://redcook.net/2008/03/05/stir-fry-1/', 'https://www.edamam.com/web-img/1f9/1f994636a9fc09d525de4bdab1cc4e7b.jpg', 6, 'Stir-fry Pepper Steak', 35, NULL),
(329, 'https://www.realsimple.com/food-recipes/browse-all-recipes/grilled-flank-steak', 'https://www.edamam.com/web-img/fea/feac9229126ed5b8cda5b417cf6f3593.jpg', 6, 'Grilled Flank Steak', 25, NULL),
(330, 'https://www.chowhound.com/recipes/italian-sausage-panini-31839', 'https://www.edamam.com/web-img/8f3/8f3784d591b88414dfcab6b8c79db7e5.jpg', 2, 'Italian Sausage Panini', 20, 'favorites'),
(331, 'http://www.marthastewart.com/315725/italian-style-breadcrumbs', 'https://www.edamam.com/web-img/2e7/2e706b7038b4c367b7bf245b83a4e81f', 2, 'Italian-Style Breadcrumbs reci', 30, NULL),
(332, 'http://honestcooking.com/italian-prune-plum-galette/', 'https://www.edamam.com/web-img/def/def703fd92c64098324fcd4cfc1dca20.jpg', 4, 'Italian Prune Plum Galette', 50, NULL),
(333, 'http://www.cookingchanneltv.com/recipes/giada-de-laurentiis/sgroppino-italian-cocktail.html', 'https://www.edamam.com/web-img/9ca/9ca6e781faa2151d20035ae1f0db9da3.jpg', 2, 'Sgroppino (Italian cocktail)', 3, NULL),
(334, 'http://www.epicurious.com/recipes/food/views/Italian-Sausage-Meatball-Heroes-238290', 'https://www.edamam.com/web-img/69d/69d4b23b8edf342dae48871d8eb21551', 4, 'Italian Sausage Meatball Heroe', 60, NULL),
(335, 'https://www.menshealth.com/recipes/20-minute-italian', 'https://www.edamam.com/web-img/775/775042749ab7172008b28b93b3c376c3.jpg', 10, '20-Minute Italian', 30, NULL),
(336, 'http://www.kitchendaily.com/recipe/italian-burger', 'https://www.edamam.com/web-img/bc1/bc1af81ce409ee50a6f8776b42193ac5.jpg', 4, 'Italian Burger', 20, NULL),
(337, 'http://www.delish.com/cooking/recipe-ideas/recipes/a35708/perfectly-cooked-italian-sausages-recipe-wdy0813/', 'https://www.edamam.com/web-img/f42/f422c13b1af8dd079358b992389443c7.jpg', 4, 'Perfectly Cooked Italian Sausa', 15, NULL),
(338, 'http://www.eatingwell.com/recipe/251114/italian-turkey-meatballs/', 'https://www.edamam.com/web-img/d92/d928b2b9643e4b838072a682174ec404', 6, 'Italian Turkey Meatballs recip', 50, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `recipe_id` mediumint(9) UNSIGNED NOT NULL,
  `ingredients_desc` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredients_desc`) VALUES
(1, 2, '1 porterhouse'),
(2, 2, 'flank'),
(3, 2, 'Coarse salt'),
(11, 7, '3 1/2 pounds whole cut-up chicken'),
(12, 7, '2 (5-ounce) packets chicken fry coating'),
(20, 10, '8 slices rye bread'),
(21, 10, '4 ounces sliced swiss cheese'),
(22, 10, 'roasted chicken breast'),
(837, 145, '1/4 to 1/3 large block silken or firm tofu, about 4 ounces'),
(838, 145, '2 teaspoons sweet, light miso, preferably Saikyo miso'),
(839, 145, 'Pinch of salt'),
(840, 145, 'Drop of mirin'),
(841, 146, '14-oz package drained firm tofu'),
(842, 146, '2 tablespoons tamari'),
(843, 146, '1 1/2 tablespoons extra-virgin olive oil'),
(844, 146, 'Coarse salt and freshly ground black pepper'),
(849, 148, '1 pound extra-firm tofu'),
(850, 148, '2 tablespoons low-sodium soy sauce'),
(851, 148, '1 tablespoon orange juice'),
(852, 148, '2 teaspoons sesame oil'),
(853, 148, '1 teaspoon canola oil'),
(854, 148, 'cooking spray'),
(855, 149, '2 to 3 tablespoons neutral oil'),
(856, 149, '1 to 2 pounds tofu, sliced crosswise 1/4 to 1 inch thick and patted dry'),
(857, 149, 'salt'),
(862, 150, 'Vegetable oil, for frying'),
(863, 150, '1/2 cup cornstarch'),
(864, 150, '1 1/4 pounds extra-firm tofu, drained, cut into 3/4-inch sticks'),
(865, 150, 'Salt'),
(890, 151, '2 large eggs'),
(891, 151, '6 large egg whites'),
(892, 151, '2 tbs coconut flour'),
(893, 151, '1 tbs psyllium husk or ground chia seeds'),
(894, 151, '90ml / 3 fl oz coconut milk, cream or almond milk'),
(895, 151, 'Â½ tsp baking soda'),
(896, 151, '1 tsp cream of tartar'),
(897, 151, '2 tbs ghee or coconut oil'),
(898, 151, '2 tsp garlic powder (omit if making a sweet keto crepe and add sweetener to taste instead)'),
(899, 151, 'salt'),
(900, 152, '1 serving Keto Chocolate Cake Mix'),
(901, 152, '2 tablespoons carton egg whitesâ€”or 1 large egg'),
(902, 152, '2 tablespoons carton egg whitesâ€”or 1 large egg'),
(903, 152, '1 tablespoon sour creamâ€”or Greek yogurt'),
(904, 152, '1/4-1/2 teaspoon vanilla extract, to taste'),
(905, 152, '1/2 tablespoon unfiltered extra virgin olive oil (optional)'),
(906, 152, '1 tablespoon waterâ€”or heavy cream, if needed'),
(907, 153, '1½ pounds center cut pork loin, pork tenderloin, or pork steak'),
(908, 153, '½ cup hoisin sauce'),
(909, 153, '2 tablespoons soy sauce'),
(910, 153, '1½ tablespoons ketchup'),
(911, 153, '1 tablespoon minced garlic'),
(912, 153, '3 tablespoons water'),
(913, 154, '¼ to ½ pound pork chicharron'),
(914, 154, '4 fresh corn tortillas'),
(915, 154, '½ pound Oaxaca, Asadero, Quesillo, or Monterey jack cheese, cut into cubes or torn into small pieces'),
(1869, 280, '1½ pounds fresh red jalapeño peppers, stemmed, seeded, and roughly chopped'),
(1870, 280, '8 garlic cloves, peeled and smashed'),
(1871, 280, '⅓ cup apple cider vinegar'),
(1872, 280, '3 tablespoons tomato paste'),
(1873, 280, '3 tablespoons honey'),
(1874, 280, '2 tablespoons Paleo-friendly fish sauce (Red Boat!)'),
(1875, 280, '1½ teaspoons kosher salt'),
(1890, 281, '1 cup almond flour'),
(1891, 281, '1/2 cup coconut flour'),
(1892, 281, '1/2 cup arrowroot or tapioca flour, plus more for rolling out dough'),
(1893, 281, '1/2 teaspoon finely ground sea salt'),
(1894, 281, '1/2 cup cold butter, palm shortening or lard (very cold)'),
(1895, 281, '1 egg'),
(1896, 281, '1 egg white plus 1 teaspoon water to make egg wash'),
(1897, 282, '1 pound dried dates, pitted'),
(1898, 282, '1 pound bacon, cooked, extra grease patted off, cooled, and crumbled'),
(1899, 282, '1 teaspoon toasted sesame oil'),
(1900, 282, '2 teaspoons sesame seeds'),
(1901, 283, '1 head of cauliflower'),
(1902, 283, '3 slices of bacon'),
(1903, 283, '2 egg whites and 1 egg'),
(1904, 283, '1 small onion, finely diced'),
(1905, 283, '1 carrot, finely diced'),
(1906, 283, '1 red pepper, finely diced'),
(1907, 283, '1 cup broccoli florets, finely chopped'),
(1908, 283, '1 tablespoon coconut aminos (paleo substitute for soy sauce)'),
(1909, 283, '1/4 teaspoon fish sauce'),
(1910, 283, '1 tablespoon ghee (or other oil of choice)'),
(1911, 283, 'Salt and pepper to taste'),
(1923, 287, '1 head of cauliflower, washed, trimmed, cored and thinly sliced'),
(1924, 287, 'Olive oil'),
(1925, 287, 'Salt'),
(1926, 287, 'Pepper'),
(1927, 287, '2 cloves garlic'),
(1928, 287, 'Fresh, chopped parsley'),
(1929, 287, 'If you wish: some chili pepper flakes, to sprinkle'),
(1937, 289, '2 cups raw hazelnuts'),
(1938, 289, '1/4 teaspoon salt'),
(1939, 289, '1 (13.5 oz) can full fat coconut milk'),
(1940, 289, '1/2 cup coconut sugar (or regular cane sugar if you prefer)'),
(1941, 289, '1 (10 oz) package dairy-free chocolate chips (I like this brand)'),
(1942, 290, '1 cup spelt flour'),
(1943, 290, '1 egg'),
(1944, 290, '1 cup soya milk (jamie used whole milk)'),
(1945, 290, '1 tsp baking powder'),
(1946, 290, '½ tsp salt'),
(1947, 290, '½ apple, grated'),
(1948, 291, '500 ml almond milk'),
(1949, 291, '500 ml hazelnut milk'),
(1950, 291, '4 tablespoons sugar'),
(1951, 291, '4 tablespoons runny honey'),
(1952, 291, '500 g soya yoghurt'),
(1953, 291, '1 spash of amaretto , optional'),
(1954, 292, '1 cup (4 ounces) white rice flour'),
(1955, 292, '1/2 cup (2 ounces) cornstarch'),
(1956, 292, '1/2 cup (2 ounces) sweet rice flour'),
(1957, 292, '1/4 cup (1.75 ounces) granulated sugar'),
(1958, 292, '1 tablespoon baking powder'),
(1959, 292, '1/2 teaspoon salt'),
(1960, 292, '1/4 teaspoon xanthan gum'),
(1961, 292, '2 large eggs'),
(1962, 292, '1 cup milk (for dairy-free, replace with dairy-free milk)'),
(1963, 292, '1/4 cup vegetable oil'),
(1964, 292, '1 teaspoon vanilla extract'),
(1965, 292, '2 ounces cream cheese, cut into 1/2 teaspoon size pieces or 1/2 cup ricotta cheese'),
(1966, 293, '5 pounds baby red potatoes \n\n\n\n\n\n\n\nPotatoes Organic Red\n\n$2.49 thru 11/23'),
(1967, 293, 'Kosher salt and freshly ground pepper'),
(1968, 293, '1/2 cup extra-virgin olive oil'),
(1969, 293, '4 garlic cloves, peeled and smashed'),
(1970, 293, '3 sprigs fresh rosemary'),
(1971, 293, '1 1/2 cups chicken broth, warmed'),
(1972, 294, '1 loaf gluten-free bread, cut into bite-size cubes (8-9 cups)'),
(1973, 294, '2 tablespoons olive oil'),
(1974, 294, '4 links (about 10 ounces) sweet italian sausage, removed from casing and broken into small pieces.'),
(1975, 294, '2 cups chopped celery (about 4 large stalks)'),
(1976, 294, '2 cups chopped onion (about 1 large onion)'),
(1977, 294, '2 tablespoons minced garlic (about four cloves)'),
(1978, 294, '1 1/2 teaspoons dried basil'),
(1979, 294, '1 teaspoon dried oregano'),
(1980, 294, '1/2 teaspoon ground sage'),
(1981, 294, '1/2 teaspoon dried thyme leaves'),
(1982, 294, '1 teaspoon kosher salt'),
(1983, 294, '1/2 teaspoon freshly ground black pepper'),
(1984, 294, '4 cups gluten-free turkey, chicken, or vegetable stock, divided'),
(1985, 295, '1 lb gluten-free pasta'),
(1986, 295, '¼ cup butter'),
(1987, 295, '½ cup gluten free flour'),
(1988, 295, '¼ tsp xanthan gum'),
(1989, 295, '1 tsp garlic powder'),
(1990, 295, '1 tsp onion powder'),
(1991, 295, '1 tsp salt, or to taste'),
(1992, 295, '4 cups milk'),
(1993, 295, '2 cups grated cheese, such as jarlsberg, a part-skim milk swiss-style cheese'),
(1994, 296, '200 g butter , softened'),
(1995, 296, '125 g icing sugar'),
(1996, 296, '1/2 orange , the grated zest of'),
(1997, 296, '1 small lemon , the grated zest of'),
(1998, 296, '1 lime , the grated zest of'),
(1999, 296, '350 g gluten-free flour'),
(2000, 296, '1 tsp gluten-free baking powder'),
(2001, 296, 'sugar , to serve'),
(2002, 297, '7 ounces almond paste'),
(2003, 297, '1/2 cup granulated sugar'),
(2004, 297, '1⁄4 teaspoon kosher salt'),
(2005, 297, '1 large egg white'),
(2006, 297, '1⁄3 cup gluten-free powdered sugar'),
(2007, 297, '1 cup bittersweet chocolate chips (optional)'),
(2008, 298, '4 1/2 cups gluten-free old-fashioned oats, divided'),
(2009, 298, '2 tablespoons cornstarch'),
(2010, 298, '1 1/2 teaspoons ground cinnamon'),
(2011, 298, '1 teaspoon gluten-free baking powder'),
(2012, 298, '1/2 teaspoon fine salt'),
(2013, 298, '2 sticks unsalted butter, room temperature'),
(2014, 298, '3/4 cup granulated sugar'),
(2015, 298, '1/2 cup packed light-brown sugar'),
(2016, 298, '2 large eggs'),
(2017, 298, '2 teaspoons pure vanilla extract'),
(2018, 298, '3/4 cup chocolate chips'),
(2019, 298, '3/4 cup raisins'),
(2051, 304, '1 center-cut boneless salmon fillet (4 ounces), skin on'),
(2052, 304, 'Lemon wedge, for serving'),
(2053, 305, '2 8-ounce containers whipped cream cheese'),
(2054, 305, '3 tablespoons whole milk'),
(2055, 305, '4 ounces thinly sliced smoked salmon, cut into 1/2-inch pieces'),
(2056, 305, '2 tablespoons chopped fresh chives'),
(2057, 305, '1 2-ounce jar red salmon caviar'),
(2058, 306, '1 pound salmon'),
(2059, 306, '1/2 cup soy sauce'),
(2060, 306, '2 tablespoons mirin'),
(2061, 306, '2 teaspoons sugar'),
(2062, 306, '1 tablespoon vegetable oil (optional)'),
(2063, 307, 'For the oven-baked paprika salmon:'),
(2064, 307, '2 (130g or thereabouts) salmon fillets'),
(2065, 307, '1 tbsp olive oil, plus extra'),
(2066, 307, '1 tbsp smoky paprika'),
(2067, 307, '(2 vines of truss cherry tomatoes)'),
(2068, 308, '4 ounces goat cheese'),
(2069, 308, '1/2 teaspoon cayenne pepper*'),
(2070, 308, 'Juice of one lime'),
(2071, 308, '6 ounces smoked salmon (12 pieces), thinly sliced'),
(2072, 308, '1/2 ounce salmon caviar'),
(2073, 308, '12 chives, snipped finely'),
(2074, 309, '¼ cup kosher salt'),
(2075, 309, '3 tablespoons granulated sugar'),
(2076, 309, 'One 1¼-pound piece center-cut, skin-on salmon, pin bones removed'),
(2077, 309, '1 piece Lapsang souchong-cured salmon'),
(2078, 309, '2 to 3 cups extra-virgin olive oil, plus extra for serving'),
(2079, 309, 'salt'),
(2080, 310, '6 oz atlantic salmon (try bumble bee wild salmon.)'),
(2081, 310, '1 slice whole wheat toast'),
(2082, 311, '8 ounces cream cheese, room temperature'),
(2083, 311, '¼ cup heavy or whipping cream'),
(2084, 311, '1 scallion (green onion, white part and 3 inches green), thinly sliced'),
(2085, 311, '1 teaspoon fresh lemon juice'),
(2086, 311, 'Dash Tabasco sauce'),
(2087, 311, '4 ounces smoked salmon, gently shredded'),
(2088, 311, '2 tablespoons red salmon caviar'),
(2089, 312, '2 pounds boneless short ribs or 4 pounds English-cut short ribs (see note above)'),
(2090, 312, 'Kosher salt and freshly ground black pepper'),
(2091, 313, '12 pork spare ribs'),
(2092, 313, '2 tbsp olive oil'),
(2093, 313, '1 onion, finely chopped'),
(2094, 313, '2 x 400g cans chopped tomatoes'),
(2095, 313, '3 garlic cloves, finely chopped'),
(2096, 313, '50g/2oz light muscovado sugar'),
(2097, 313, '4 tbsp malt vinegar'),
(2098, 313, '3 tbsp worcestershire sauce'),
(2099, 313, '1 tbsp tomato purée'),
(2100, 313, '2 tsp chinese five spice powder'),
(2101, 313, '1 tsp ground cumin'),
(2102, 313, 'Salt and freshly ground black pepper'),
(2103, 314, '3 tablespoons chopped peeled ginger'),
(2104, 314, '2 tablespoons chopped garlic'),
(2105, 314, '1/3 cup soy sauce'),
(2106, 314, '2 tablespoons vegetable oil'),
(2107, 314, '1/2 cup hoisin sauce'),
(2108, 314, '2 tablespoons honey'),
(2109, 314, '4 pounds baby back ribs (2 to 4 racks)'),
(2110, 315, '4  cloves garlic, chopped'),
(2111, 315, '2 tablespoons brown sugar'),
(2112, 315, '1 teaspoon chili powder'),
(2113, 315, '½ teaspoon cayenne pepper'),
(2114, 315, 'kosher salt and black pepper'),
(2115, 315, '2 racks baby-back ribs (about 3 pounds)'),
(2116, 316, '2 tbsp. hoisin sauce'),
(2117, 316, '½ tsp. sambal oelek'),
(2118, 316, '½ tsp. toasted sesame oil'),
(2119, 316, 'Rack of roast ribs from Asian-Brined Pork Loin'),
(2124, 318, '4 pounds beef short ribs'),
(2125, 318, '3 cups Zinfandel'),
(2126, 318, '1/2 cup sugar'),
(2127, 318, '3/4 cup canned diced tomatoes'),
(2128, 318, '2 cups beef broth'),
(2129, 318, '1 teaspoon garlic, minced'),
(2130, 318, '3 sprigs fresh thyme, leaves only'),
(2131, 318, '2 bay leaves'),
(2132, 318, '6 teaspoons canola oil'),
(2133, 318, '1 large onion, diced'),
(2134, 318, '2 carrots, diced'),
(2135, 318, '2 stalks celery, diced'),
(2136, 318, '2 ounces dried mushrooms, preferably porcini'),
(2137, 319, '¼ cup olive oil'),
(2138, 319, '3 pounds chicken pieces, skin on (thighs, drumsticks, breasts)'),
(2139, 319, '3 pounds pork ribs on the slab'),
(2140, 319, 'Salt and pepper to taste'),
(2141, 319, '¼ cup garlic powder'),
(2142, 319, '2 recipes Sweet & Tangy Barbecue Sauce'),
(2143, 320, '1 full rack baby back ribs'),
(2144, 320, '2 lemons'),
(2145, 320, '1 cup kosher salt'),
(2146, 320, '2 tablespoons black peppercorns'),
(2147, 320, '2 bay leaves'),
(2148, 320, 'Prepared glaze, for finishing, optional'),
(2155, 322, '1 porterhouse, flank, or rib-eye steak, 1 3/4 pounds and 1 1/2 inch thick'),
(2156, 322, 'Coarse salt and ground pepper'),
(2157, 323, '1 1/2 pound skirt steak, cut into 4 pieces'),
(2158, 323, 'salt'),
(2159, 323, 'pepper'),
(2160, 325, '1 12-ounce buffalo steak'),
(2161, 325, '1 tablespoon olive oil'),
(2162, 325, 'salt'),
(2163, 325, 'pepper'),
(2164, 326, '1 8 ounce beef tenderloin steak, flap meat steak, or hanger steak'),
(2165, 326, 'Kosher salt and freshly ground black pepper'),
(2166, 326, '1 tablespoon vegetable oil'),
(2167, 326, '1 medium carrot, roughly chopped (about 3/4 cup)'),
(2168, 326, '1 small yellow onion, roughly chopped (about 1 cup)'),
(2169, 326, '4 cloves garlic'),
(2170, 326, '2 tablespoons olive oil'),
(2171, 326, '1 tablespoon fresh thyme leaves'),
(2172, 326, '2 cups jarred jarred tomato sauce'),
(2173, 326, '1 pound rigatoni pasta'),
(2174, 326, 'Grated Parmigiano Reggiano'),
(2175, 327, '1 1/2 pounds sirloin steak, 1 to 1 1/4-inches thick'),
(2176, 327, '2 teaspoons olive oil'),
(2177, 327, 'Salt and freshly ground black pepper'),
(2178, 328, '1 lb. flank steak or sirloin steak'),
(2179, 328, '2 cups shredded italian green peppers (about 2 medium peppers)'),
(2180, 328, '1 tablespoon minced garlic'),
(2181, 328, '1 tablespoon thinly shredded ginger'),
(2182, 328, '1 tablespoon light soy sauce'),
(2183, 328, '2 tablespoons shaoxing wine'),
(2184, 328, '1 tablespoon cornstarch'),
(2185, 328, '1 tablespoon vegetable oil for marinate'),
(2186, 328, '3 tablespoons vegetable oil for stir-frying'),
(2187, 329, '1 1/2 pounds flank steak'),
(2188, 329, '1/2 teaspoon kosher salt'),
(2189, 329, '1/4 teaspoon freshly ground black pepper'),
(2190, 330, '1 red bell pepper, thinly sliced'),
(2191, 330, '1 tablespoon olive oil'),
(2192, 330, '4 slices Italian bread, sliced 1/2-inch thick'),
(2193, 330, '4 slices provolone cheese'),
(2194, 330, '2 pre-cooked Italian sausages, sliced 1/2-inch thick'),
(2195, 330, '1 cup fresh baby spinach'),
(2196, 330, 'olive oil for brushing'),
(2197, 331, '1 loaf Italian bread, torn into 2-inch pieces'),
(2198, 331, '1 1/2 tablespoons extra-virgin olive oil'),
(2199, 331, '1 teaspoon finely chopped garlic'),
(2200, 331, '1 tablespoon lemon zest'),
(2201, 331, '1 1/2 tablespoons chopped flat-leaf parsley'),
(2202, 331, '2 teaspoons coarse sea salt'),
(2203, 331, '1 teaspoon freshly ground black pepper'),
(2204, 332, '¾ to 1 pound (350-450g) italian prune plums'),
(2205, 332, '5 tablespoons sugar'),
(2206, 332, 'Zest of one lemon'),
(2207, 332, '10 ounces puff pastry (about 285 grams), defrosted overnight in the fridge'),
(2208, 333, '1 cup chilled prosecco (italian sparkling white wine)'),
(2209, 333, '2 tablespoons chilled vodka'),
(2210, 333, '1/3 cup frozen lemon sorbet'),
(2211, 333, '1/4 teaspoon chopped fresh mint leaves'),
(2212, 334, '1 pound spicy or sweet Italian sausages, casings removed'),
(2213, 334, '1 (23- to 24-ounce) container purchased fresh marinara sauce, divided'),
(2214, 334, '1/2 cup freshly grated Parmesan cheese (about 1 1/2 ounces)'),
(2215, 334, '1/3 cup chopped fresh Italian parsley, divided'),
(2216, 334, '1/3 cup chopped fresh basil, divided'),
(2217, 334, '4 (5- to 6-inch-long) pieces French baguette, split horizontally'),
(2218, 334, '1 cup (packed) coarsely grated whole-milk mozzarella cheese'),
(2219, 335, '1 lb precooked polenta roll (refrigerated produce case or dried pasta aisle)'),
(2220, 335, '3/4 C shredded Italian cheese blend (we used Sargento 6 Cheese Italian)'),
(2221, 335, '1/2 lb Lean ground beef (meat case)'),
(2222, 335, '2 C chunky pasta sauce (we used Muir Glen Organic)'),
(2223, 336, '4 MorningStar Farms® Tomato & Basil Pizza Burgers'),
(2224, 336, '¼ cup herb pasta sauce'),
(2225, 336, '4 thin slices Provolone cheese (about 3 oz. total)'),
(2226, 336, '½ medium red bell pepper, cut into 1/4-inch-wide strips'),
(2227, 336, '½ medium green bell pepper, cut into 1/4-inch-wide strips'),
(2228, 336, '¼ large sweet onion, cut into slivers'),
(2229, 336, '½ tsp dried Italian seasoning'),
(2230, 336, '1 tsp olive oil'),
(2231, 336, '4 hamburger buns, split and toasted'),
(2232, 337, '4 large sweet or hot Italian sausage links'),
(2233, 337, '1 tbsp. olive oil'),
(2234, 338, '8 ounces mushrooms, chopped'),
(2235, 338, '1 small onion, chopped'),
(2236, 338, '1 stalk celery, sliced'),
(2237, 338, '4 cloves garlic'),
(2238, 338, '1 tablespoon extra-virgin olive oil'),
(2239, 338, '1/2 cup fine dry breadcrumbs'),
(2240, 338, '1/2 cup finely chopped Italian parsley'),
(2241, 338, '1/4 cup grated Parmesan cheese'),
(2242, 338, '2 teaspoons Italian seasoning'),
(2243, 338, '1/2 teaspoon salt'),
(2244, 338, '1/2 teaspoon ground pepper'),
(2245, 338, '1 pound lean ground turkey');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_list`
--

CREATE TABLE `shopping_list` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ingredients_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `ingredient_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shopping_list`
--

INSERT INTO `shopping_list` (`id`, `ingredients_id`, `is_completed`, `ingredient_text`) VALUES
(22, NULL, 0, '4 slices Italian bread, sliced 1/2-inch thick'),
(23, NULL, 0, '1 tablespoon olive oil'),
(24, NULL, 0, '1 red bell pepper, thinly sliced'),
(25, NULL, 0, 'olive oil for brushing'),
(26, NULL, 0, '1 cup fresh baby spinach'),
(27, NULL, 0, 'Olive Oil'),
(28, NULL, 0, 'Meat'),
(29, NULL, 0, '4 slices Italian bread, sliced 1/2-inch thick'),
(30, NULL, 0, '1 tablespoon olive oil'),
(31, NULL, 0, '1 red bell pepper, thinly sliced'),
(32, NULL, 0, 'olive oil for brushing'),
(33, NULL, 0, '1 cup fresh baby spinach'),
(34, NULL, 0, '2 pre-cooked Italian sausages, sliced 1/2-inch thick'),
(35, NULL, 0, '4 slices provolone cheese'),
(36, NULL, 0, 'peanut butter'),
(37, NULL, 0, 'bread'),
(38, NULL, 0, 'jelly');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipeId` (`recipe_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipeId` (`recipe_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label` (`label`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipeId` (`recipe_id`);

--
-- Indexes for table `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredientsId` (`ingredients_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;
--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2246;
--
-- AUTO_INCREMENT for table `shopping_list`
--
ALTER TABLE `shopping_list`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `calendar_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD CONSTRAINT `shopping_list_ibfk_1` FOREIGN KEY (`ingredients_id`) REFERENCES `recipe_ingredients` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
