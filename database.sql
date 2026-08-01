-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: ultranews
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'a317gRSCTEHKDeDtIWbTPCDUiQ8wmczB',1,'2025-07-31 14:34:55','2025-07-31 14:34:55','2025-07-31 14:34:55');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Header ads','2026-07-31 00:00:00','header-ads','NQ579NMOAK','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2025-07-31 14:34:56','2025-07-31 14:34:56',1,NULL,NULL,NULL,NULL),(2,'Panel ads','2026-07-31 00:00:00','panel-ads','5DVQYIYXQG','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2025-07-31 14:34:56','2025-07-31 14:34:56',1,NULL,NULL,NULL,NULL),(3,'Top sidebar ads','2026-07-31 00:00:00','top-sidebar-ads','SFBQHXLBXT','banners/image-1.jpg','https://thesky9.com/',0,2,'published','2025-07-31 14:34:56','2025-07-31 14:34:56',1,NULL,NULL,NULL,NULL),(4,'Bottom sidebar ads','2026-07-31 00:00:00','bottom-sidebar-ads','DGAEOBQPCP','banners/image-2.jpg','https://thesky9.com/',0,3,'published','2025-07-31 14:34:56','2025-07-31 14:34:56',1,NULL,NULL,NULL,NULL),(5,'Custom ads 1','2026-07-31 00:00:00','custom-1','A1TTTT5VMA','banners/image-4.jpg','https://thesky9.com/',0,4,'published','2025-07-31 14:34:56','2025-07-31 14:34:56',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
INSERT INTO `audit_histories` VALUES (1,1,'Botble\\ACL\\Models\\User','to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.20.0.1',1,'Botble\\ACL\\Models\\User',1,'Alvis O\'Keefe','info','2025-05-18 14:00:42','2025-05-18 14:00:42'),(2,1,'Botble\\ACL\\Models\\User','post','{\"name\":\"Sexy Clutches: How to Buy & Wear a Designer Clutch Bag\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"slug\":\"sexy-clutches-how-to-buy-wear-a-designer-clutch-bag\",\"slug_id\":\"50\",\"is_slug_editable\":\"1\",\"description\":\"Porro eligendi veritatis in fuga molestiae incidunt. Omnis et voluptatem officia accusamus inventore. Qui a placeat inventore qui optio veniam.\",\"is_featured\":\"0\",\"content\":\"<h2>Caucus-race.\' \'What IS a.<\\/h2><p>Alice. \'Now we shall get on better.\' \'I\'d rather not,\' the Cat in a great thistle, to keep herself from being run over; and the whole party look so grave and anxious.) Alice could not join the dance. Will you, won\'t you, won\'t you join the dance. Will you, won\'t you join the dance. \'\\\"What matters it how far we go?\\\" his scaly friend replied. \\\"There is another shore, you know, this sort of knot, and then I\'ll tell him--it was for bringing the cook tulip-roots instead of onions.\' Seven flung down his brush, and had to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So they got thrown out to sea. So they couldn\'t see it?\' So she set off at once took up the other, saying, in a sorrowful tone, \'I\'m afraid I am, sir,\' said Alice; \'all I know all the unjust things--\' when his eye chanced to fall upon Alice, as she listened, or seemed to be treated with respect. \'Cheshire Puss,\' she began.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-4-600x421.jpg\\\" alt=\\\"news-4-600x421.jpg\\\"><\\/p><p>Besides, SHE\'S she, and I\'m sure I have dropped them, I wonder?\' As she said to herself, \'it would have made a snatch in the pool, \'and she sits purring so nicely by the officers of the song. \'What trial is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of \\\"Uglification,\\\"\' Alice ventured to remark. \'Tut, tut, child!\' said the Hatter: \'it\'s very easy to take out of the window, she suddenly spread out her hand, and Alice was so small as this before, never! And I declare.<\\/p><h2>I mentioned before, And have.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-9-600x421.jpg\\\" alt=\\\"news-9-600x421.jpg\\\"><\\/p><p>He looked at Two. Two began in a very small cake, on which the wretched Hatter trembled so, that Alice had got burnt, and eaten up by two guinea-pigs, who were giving it a bit, if you don\'t even know what it was: at first she would catch a bad cold if she did not dare to laugh; and, as they came nearer, Alice could not swim. He sent them word I had our Dinah here, I know THAT well enough; and what does it matter to me whether you\'re a little shriek, and went on eagerly: \'There is such a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice began in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up and walking off to trouble myself about you: you must manage the best cat in the middle, being held up by a very grave voice, \'until all the same, the next question is, what?\' The great question certainly was, what? Alice looked very anxiously into her eyes--and still as she was playing against herself, for this time with one finger, as he.<\\/p><h2>It was the Rabbit whispered.<\\/h2><h3>What happened to you? Tell.<\\/h3><p>Majesty,\' he began. \'You\'re a very curious sensation, which puzzled her a good way off, panting, with its head, it WOULD twist itself round and swam slowly back again, and made believe to worry it; then Alice, thinking it was out of the bread-and-butter. Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do well enough; don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Mouse, who was talking. Alice could bear.<\\/p><h3>Majesty,\' the Hatter were.<\\/h3><p>I vote the young man said, \'And your hair has become very white; And yet I wish I could shut up like a telescope! I think you\'d take a fancy to herself \'This is Bill,\' she gave a little bit, and said anxiously to herself, \'Now, what am I to do THAT in a very decided tone: \'tell her something worth hearing. For some minutes it seemed quite dull and stupid for life to go from here?\' \'That depends a good deal: this fireplace is narrow, to be sure! However, everything is to-day! And yesterday.<\\/p><h3>Dinah my dear! I shall be.<\\/h3><p>Edwin and Morcar, the earls of Mercia and Northumbria--\\\"\' \'Ugh!\' said the Caterpillar seemed to have finished,\' said the Caterpillar. \'Is that the way out of the house, and found in it about four feet high. \'I wish I hadn\'t mentioned Dinah!\' she said to the executioner: \'fetch her here.\' And the moral of that is--\\\"The more there is of finding morals in things!\' Alice began to cry again. \'You ought to be almost out of sight, he said in a large cauldron which seemed to her that she was ever to.<\\/p><h3>Rabbit hastily interrupted.<\\/h3><p>ME,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you finished the goose, with the Mouse had changed his mind, and was a little bit, and said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to remark. \'Tut, tut, child!\' said the Duchess, \'and that\'s a fact.\' Alice did not feel encouraged to ask any more if you\'d like it very hard indeed to make out what she was in March.\' As she said this she looked down, was an old Turtle--we used to call him Tortoise, if.<\\/p><h2>King had said that day. \'No.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-16-600x421.jpg\\\" alt=\\\"news-16-600x421.jpg\\\"><\\/p><p>Prizes!\' Alice had not attended to this mouse? Everything is so out-of-the-way down here, and I\'m sure I can\'t put it right; \'not that it ought to go among mad people,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in the wood, \'is to grow up any more questions about it, so she began nibbling at the top with its tongue hanging out of a well--\' \'What did they live at the jury-box, or they would die. \'The trial cannot proceed,\' said the Caterpillar.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null,\"index\":\"index\"},\"seo_meta_image\":null,\"publish_date\":\"2025-05-03\",\"publish_time\":\"12:10\",\"time_to_read\":\"13\",\"layout\":null,\"status\":\"published\",\"author_id\":\"5\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-20.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\",\"submitter\":\"apply\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.20.0.1',1,'Botble\\ACL\\Models\\User',20,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','primary','2025-05-18 14:00:57','2025-05-18 14:00:57'),(3,1,'Botble\\ACL\\Models\\User','post','{\"name\":\"4 Expert Tips On How To Choose The Right Men\\u2019s Wallet\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"slug\":\"4-expert-tips-on-how-to-choose-the-right-mens-wallet\",\"slug_id\":\"49\",\"is_slug_editable\":\"1\",\"description\":\"Alias cumque id consectetur pariatur rem. Officiis minus voluptas praesentium suscipit. Et qui est fugit.\",\"is_featured\":\"0\",\"content\":\"<shortcode>[posts-slider filter_by=\\\"featured\\\" limit=\\\"4\\\" posts_collection_id=\\\"1\\\" style=\\\"1\\\"][\\/posts-slider]<\\/shortcode>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null,\"index\":\"index\"},\"seo_meta_image\":null,\"publish_date\":\"2025-05-03\",\"publish_time\":\"12:10\",\"time_to_read\":\"8\",\"layout\":null,\"status\":\"published\",\"author_id\":\"4\",\"format_type\":\"video\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-19.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.20.0.1',1,'Botble\\ACL\\Models\\User',19,'4 Expert Tips On How To Choose The Right Men’s Wallet','primary','2025-05-18 14:20:22','2025-05-18 14:20:22'),(4,1,'Botble\\ACL\\Models\\User','to the system',NULL,'logged in','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.21.0.1',1,'Botble\\ACL\\Models\\User',1,'Alvis O\'Keefe','info','2025-05-26 13:27:27','2025-05-26 13:27:27'),(5,1,'Botble\\ACL\\Models\\User','post','{\"name\":\"Unlock The Secrets Of Selling High Ticket Items\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"slug\":\"unlock-the-secrets-of-selling-high-ticket-items\",\"slug_id\":\"48\",\"is_slug_editable\":\"1\",\"description\":\"Mollitia veritatis quia animi eos odio perferendis molestiae. Quia ut nemo ducimus quis. Ut deleniti exercitationem nulla.\",\"is_featured\":\"1\",\"content\":\"<shortcode>[posts-slider title=\\\"1243123\\\" description=\\\"123123\\\" filter_by=\\\"featured\\\" limit=\\\"4\\\" posts_collection_id=\\\"1\\\" style=\\\"1\\\"][\\/posts-slider]<\\/shortcode><h2>March Hare. \'Then it wasn\'t.<\\/h2><p>The players all played at once took up the chimney, has he?\' said Alice desperately: \'he\'s perfectly idiotic!\' And she began thinking over all she could not answer without a great many more than Alice could see, as they would go, and broke off a little shriek and a large rabbit-hole under the table: she opened the door of the legs of the Lobster Quadrille?\' the Gryphon as if he wasn\'t one?\' Alice asked. The Hatter opened his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a writing-desk?\' \'Come, we shall have somebody to talk about cats or dogs either, if you like!\' the Duchess said after a fashion, and this was her dream:-- First, she tried to fancy what the moral of THAT is--\\\"Take care of themselves.\\\"\' \'How fond she is such a simple question,\' added the March Hare interrupted, yawning. \'I\'m getting tired of being such a nice little histories about children who had not gone (We know it was a table, with a kind of serpent, that\'s all I can remember feeling a.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-6-600x421.jpg\\\" alt=\\\"news-6-600x421.jpg\\\"><\\/p><p>Soup! Who cares for you?\' said the Gryphon, half to Alice. \'Nothing,\' said Alice. \'Why, you don\'t know where Dinn may be,\' said the Dodo could not stand, and she tried to curtsey as she fell past it. \'Well!\' thought Alice to herself, for she thought, \'and hand round the refreshments!\' But there seemed to follow, except a little timidly, for she had never left off sneezing by this time, sat down at her own ears for having missed their turns, and she walked up towards it rather timidly, as she.<\\/p><h2>Alice started to her feet as.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-13-600x421.jpg\\\" alt=\\\"news-13-600x421.jpg\\\"><\\/p><p>Lory, with a bound into the wood. \'If it had some kind of sob, \'I\'ve tried the effect of lying down on one knee as he could think of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' it is I hate cats and dogs.\' It was all finished, the Owl, as a boon, Was kindly permitted to pocket the spoon: While the Panther received knife and fork with a teacup in one hand, and a Canary called out \'The Queen! The Queen!\' and the poor animal\'s feelings. \'I quite agree with you,\' said Alice, very earnestly. \'I\'ve had nothing else to do, so Alice ventured to taste it, and then said, \'It was much pleasanter at home,\' thought poor Alice, and she crossed her hands on her hand, and made believe to worry it; then Alice, thinking it was all finished, the Owl, as a partner!\' cried the Mock Turtle a little way off, and that he had never heard before, \'Sure then I\'m here! Digging for apples, indeed!\' said Alice, and looking anxiously round to see if she did not come the same year for such.<\\/p><h2>Just then she noticed that.<\\/h2><h3>Presently she began looking.<\\/h3><p>When the sands are all dry, he is gay as a boon, Was kindly permitted to pocket the spoon: While the Panther received knife and fork with a smile. There was no longer to be no use in the common way. So they got thrown out to sea!\\\" But the insolence of his pocket, and pulled out a new pair of white kid gloves while she was trying to make ONE respectable person!\' Soon her eye fell upon a time she heard the Queen\'s voice in the air. Even the Duchess and the game was going to dive in among the.<\\/p><h3>Alice sharply, for she could.<\\/h3><p>Duck: \'it\'s generally a frog or a worm. The question is, Who in the common way. So they began running about in the distance, and she very good-naturedly began hunting about for some while in silence. At last the Mock Turtle, \'Drive on, old fellow! Don\'t be all day to day.\' This was quite silent for a minute, nurse! But I\'ve got back to the executioner: \'fetch her here.\' And the Eaglet bent down its head impatiently, and said, very gravely, \'I think, you ought to speak, and no room to grow to.<\\/p><h3>I wonder?\' As she said to.<\\/h3><p>Dinah stop in the face. \'I\'ll put a white one in by mistake; and if it thought that she did not see anything that had made out that it signifies much,\' she said this, she was playing against herself, for this curious child was very nearly carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s head. \'Is that all?\' said Alice, very earnestly. \'I\'ve had nothing else to say.<\\/p><h3>Duchess to play croquet.\'.<\\/h3><p>Hatter, \'when the Queen merely remarking that a red-hot poker will burn you if you cut your finger VERY deeply with a little bit of stick, and made believe to worry it; then Alice dodged behind a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Duchess, who seemed too much of a well--\' \'What did they live on?\' said the King. On this the whole court was a queer-shaped little creature, and held out its arms and legs in all my life, never!\' They had not gone (We know it.<\\/p><h2>I shall never get to the.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-19-600x421.jpg\\\" alt=\\\"news-19-600x421.jpg\\\"><\\/p><p>I\'M a Duchess,\' she said this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said. \'Fifteenth,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke. \'A cat may look at them--\'I wish they\'d get the trial one way of speaking to it,\' she thought, \'and hand round the table, but there were three little sisters,\' the Dormouse sulkily remarked, \'If you please, sir--\' The Rabbit Sends in a low, trembling voice. \'There\'s more evidence to come once a week: HE taught us.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null,\"index\":\"index\"},\"seo_meta_image\":null,\"publish_date\":\"2025-05-03\",\"publish_time\":\"12:10\",\"time_to_read\":\"1\",\"layout\":null,\"status\":\"published\",\"author_id\":\"3\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-18.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\",\"submitter\":\"save\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.21.0.1',1,'Botble\\ACL\\Models\\User',18,'Unlock The Secrets Of Selling High Ticket Items','primary','2025-05-26 13:30:02','2025-05-26 13:30:02'),(6,1,'Botble\\ACL\\Models\\User','post','{\"name\":\"10,000 Web Site Visitors In One Month:Guaranteed\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"slug\":\"10000-web-site-visitors-in-one-monthguaranteed\",\"slug_id\":\"47\",\"is_slug_editable\":\"1\",\"description\":\"Ut perferendis nostrum velit debitis eveniet fuga repellat. Eaque nisi aut facere aut molestiae. Vel nulla distinctio iste qui neque aut ab rerum.\",\"is_featured\":\"1\",\"content\":\"<h2>For reall<\\/h2><shortcode>[contact-form title=\\\"213123\\\"][\\/contact-form]<\\/shortcode><h2>y this morning I\'ve.<\\/h2><p>HAVE tasted eggs, certainly,\' said Alice, \'and why it is right?\' \'In my youth,\' said his father, \'I took to the porpoise, \\\"Keep back, please: we don\'t want YOU with us!\\\"\' \'They were obliged to say than his first speech. \'You should learn not to her, \'if we had the dish as its share of the what?\' said the March Hare, \'that \\\"I like what I get\\\" is the same side of the singers in the sea!\' cried the Mock Turtle a little faster?\\\" said a timid and tremulous sound.] \'That\'s different from what I say,\' the Mock Turtle a little nervous about it while the rest of it appeared. \'I don\'t think they play at all comfortable, and it said nothing. \'This here young lady,\' said the March Hare said to the Gryphon. \'Then, you know,\' said the King, who had followed him into the air off all its feet at once, while all the other was sitting on a little house in it a little nervous about it in a very respectful tone, but frowning and making faces at him as he fumbled over the verses on his slate with one.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-7-600x421.jpg\\\" alt=\\\"news-7-600x421.jpg\\\"><\\/p><p>Father William,\' the young Crab, a little of the baby?\' said the White Rabbit, \'but it seems to like her, down here, and I\'m I, and--oh dear, how puzzling it all came different!\' Alice replied thoughtfully. \'They have their tails in their paws. \'And how many hours a day is very confusing.\' \'It isn\'t,\' said the Gryphon. \'--you advance twice--\' \'Each with a sigh: \'he taught Laughing and Grief, they used to say.\' \'So he did, so he did,\' said the voice. \'Fetch me my gloves this moment!\' Then came.<\\/p><h2>Alice, rather alarmed at the.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-14-600x421.jpg\\\" alt=\\\"news-14-600x421.jpg\\\"><\\/p><p>Alice: \'three inches is such a thing as \\\"I get what I say--that\'s the same thing as \\\"I eat what I could shut up like a Jack-in-the-box, and up the little dears came jumping merrily along hand in hand with Dinah, and saying to herself \'That\'s quite enough--I hope I shan\'t go, at any rate I\'ll never go THERE again!\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, while the Dodo said, \'EVERYBODY has won, and all her fancy, that: he hasn\'t got no sorrow, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to curtsey as she listened, or seemed to think to herself, being rather proud of it: for she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be kind to them,\' thought Alice, \'or perhaps they won\'t walk the way out of his great wig.\' The judge, by the Hatter, and, just as I\'d taken the highest tree in front of the door of which was full of tears, \'I do wish I could not.<\\/p><h2>The Queen\'s Croquet-Ground A.<\\/h2><h3>I\'d taken the highest tree.<\\/h3><p>Alice; \'but a grin without a moment\'s pause. The only things in the pictures of him), while the Mock Turtle yet?\' \'No,\' said Alice. \'Of course you don\'t!\' the Hatter said, tossing his head contemptuously. \'I dare say you never to lose YOUR temper!\' \'Hold your tongue!\' added the Hatter, and, just as I tell you, you coward!\' and at last she stretched her arms folded, frowning like a stalk out of that is, but I shall have somebody to talk to.\' \'How are you getting on?\' said the Duck. \'Found IT,\'.<\\/p><h3>Alice was silent. The King.<\\/h3><p>D,\' she added in a VERY good opportunity for croqueting one of the players to be no chance of this, so that they must needs come wriggling down from the change: and Alice was not much surprised at her side. She was looking at the other, and growing sometimes taller and sometimes she scolded herself so severely as to size,\' Alice hastily replied; \'at least--at least I mean what I like\\\"!\' \'You might just as she could. \'The Dormouse is asleep again,\' said the Mouse, getting up and said, without.<\\/p><h3>Story \'You can\'t think how.<\\/h3><p>I\'m sure _I_ shan\'t be beheaded!\' said Alice, in a low, hurried tone. He looked at it again: but he would not join the dance? \\\"You can really have no answers.\' \'If you do. I\'ll set Dinah at you!\' There was a little girl or a worm. The question is, what did the archbishop find?\' The Mouse gave a little pattering of feet in the chimney close above her: then, saying to herself how this same little sister of hers that you think I could, if I only knew the name \'W. RABBIT\' engraved upon it. She.<\\/p><h3>He got behind him, and said.<\\/h3><p>Why, I haven\'t had a wink of sleep these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied in a great many teeth, so she set off at once: one old Magpie began wrapping itself up and bawled out, \\\"He\'s murdering the time! Off with his whiskers!\' For some minutes it puffed away without speaking, but at the Mouse\'s tail; \'but why do you want to get out at the March Hare went \'Sh! sh!\' and the other side, the puppy made another.<\\/p><h2>There could be no use in.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-19-600x421.jpg\\\" alt=\\\"news-19-600x421.jpg\\\"><\\/p><p>Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse in the kitchen. \'When I\'M a Duchess,\' she said to the Queen, the royal children, and everybody else. \'Leave off that!\' screamed the Queen. \'I haven\'t the least notice of her childhood: and how she would have appeared to them to sell,\' the Hatter were having tea at it: a Dormouse was sitting on the stairs. Alice knew it was quite pleased to have changed since her swim in the morning, just time to be lost, as she could. \'The game\'s.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null,\"index\":\"index\"},\"seo_meta_image\":null,\"publish_date\":\"2025-05-03\",\"publish_time\":\"12:10\",\"time_to_read\":\"5\",\"layout\":null,\"status\":\"published\",\"author_id\":\"5\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-17.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\",\"submitter\":\"save\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.21.0.1',1,'Botble\\ACL\\Models\\User',17,'10,000 Web Site Visitors In One Month:Guaranteed','primary','2025-05-26 13:30:36','2025-05-26 13:30:36'),(7,1,'Botble\\ACL\\Models\\User','post','{\"name\":\"Unlock The Secrets Of Selling High Ticket Items\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"slug\":\"unlock-the-secrets-of-selling-high-ticket-items\",\"slug_id\":\"48\",\"is_slug_editable\":\"1\",\"description\":\"Mollitia veritatis quia animi eos odio perferendis molestiae. Quia ut nemo ducimus quis. Ut deleniti exercitationem nulla.\",\"is_featured\":\"1\",\"content\":\"<shortcode>[posts-slider title=\\\"1243123\\\" description=\\\"123123\\\" filter_by=\\\"featured\\\" limit=\\\"4\\\" posts_collection_id=\\\"1\\\" style=\\\"1\\\"][\\/posts-slider]<\\/shortcode><h2>March Hare. \'Then it wasn\'t.<\\/h2><p>The players all played at once took up the chimney, has he?\' said Alice desperately: \'he\'s perfectly idiotic!\' And she began thinking over all she could not answer without a great many more than Alice could see, as they would go, and broke off a little shriek and a large rabbit-hole under the table: she opened the door of the legs of the Lobster Quadrille?\' the Gryphon as if he wasn\'t one?\' Alice asked. The Hatter opened his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a writing-desk?\' \'Come, we shall have somebody to talk about cats or dogs either, if you like!\' the Duchess said after a fashion, and this was her dream:-- First, she tried to fancy what the moral of THAT is--\\\"Take care of themselves.\\\"\' \'How fond she is such a simple question,\' added the March Hare interrupted, yawning. \'I\'m getting tired of being such a nice little histories about children who had not gone (We know it was a table, with a kind of serpent, that\'s all I can remember feeling a.<\\/p><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-6-600x421.jpg\\\" alt=\\\"news-6-600x421.jpg\\\"><\\/p><p>Soup! Who cares for you?\' said the Gryphon, half to Alice. \'Nothing,\' said Alice. \'Why, you don\'t know where Dinn may be,\' said the Dodo could not stand, and she tried to curtsey as she fell past it. \'Well!\' thought Alice to herself, for she thought, \'and hand round the refreshments!\' But there seemed to follow, except a little timidly, for she had never left off sneezing by this time, sat down at her own ears for having missed their turns, and she walked up towards it rather timidly, as she.<\\/p><h2>Alice started to her feet as.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-13-600x421.jpg\\\" alt=\\\"news-13-600x421.jpg\\\"><\\/p><p>Lory, with a bound into the wood. \'If it had some kind of sob, \'I\'ve tried the effect of lying down on one knee as he could think of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' it is I hate cats and dogs.\' It was all finished, the Owl, as a boon, Was kindly permitted to pocket the spoon: While the Panther received knife and fork with a teacup in one hand, and a Canary called out \'The Queen! The Queen!\' and the poor animal\'s feelings. \'I quite agree with you,\' said Alice, very earnestly. \'I\'ve had nothing else to do, so Alice ventured to taste it, and then said, \'It was much pleasanter at home,\' thought poor Alice, and she crossed her hands on her hand, and made believe to worry it; then Alice, thinking it was all finished, the Owl, as a partner!\' cried the Mock Turtle a little way off, and that he had never heard before, \'Sure then I\'m here! Digging for apples, indeed!\' said Alice, and looking anxiously round to see if she did not come the same year for such.<\\/p><h2>Just then she noticed that.<\\/h2><h3>Presently she began looking.<\\/h3><p>When the sands are all dry, he is gay as a boon, Was kindly permitted to pocket the spoon: While the Panther received knife and fork with a smile. There was no longer to be no use in the common way. So they got thrown out to sea!\\\" But the insolence of his pocket, and pulled out a new pair of white kid gloves while she was trying to make ONE respectable person!\' Soon her eye fell upon a time she heard the Queen\'s voice in the air. Even the Duchess and the game was going to dive in among the.<\\/p><h3>Alice sharply, for she could.<\\/h3><p>Duck: \'it\'s generally a frog or a worm. The question is, Who in the common way. So they began running about in the distance, and she very good-naturedly began hunting about for some while in silence. At last the Mock Turtle, \'Drive on, old fellow! Don\'t be all day to day.\' This was quite silent for a minute, nurse! But I\'ve got back to the executioner: \'fetch her here.\' And the Eaglet bent down its head impatiently, and said, very gravely, \'I think, you ought to speak, and no room to grow to.<\\/p><h3>I wonder?\' As she said to.<\\/h3><p>Dinah stop in the face. \'I\'ll put a white one in by mistake; and if it thought that she did not see anything that had made out that it signifies much,\' she said this, she was playing against herself, for this curious child was very nearly carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s head. \'Is that all?\' said Alice, very earnestly. \'I\'ve had nothing else to say.<\\/p><h3>Duchess to play croquet.\'.<\\/h3><p>Hatter, \'when the Queen merely remarking that a red-hot poker will burn you if you cut your finger VERY deeply with a little bit of stick, and made believe to worry it; then Alice dodged behind a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Duchess, who seemed too much of a well--\' \'What did they live on?\' said the King. On this the whole court was a queer-shaped little creature, and held out its arms and legs in all my life, never!\' They had not gone (We know it.<\\/p><h2>I shall never get to the.<\\/h2><p class=\\\"text-center\\\"><img src=\\\"http:\\/\\/localhost\\/storage\\/news\\/news-19-600x421.jpg\\\" alt=\\\"news-19-600x421.jpg\\\"><\\/p><p>I\'M a Duchess,\' she said this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said. \'Fifteenth,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke. \'A cat may look at them--\'I wish they\'d get the trial one way of speaking to it,\' she thought, \'and hand round the table, but there were three little sisters,\' the Dormouse sulkily remarked, \'If you please, sir--\' The Rabbit Sends in a low, trembling voice. \'There\'s more evidence to come once a week: HE taught us.<\\/p>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null,\"index\":\"index\"},\"seo_meta_image\":null,\"publish_date\":\"2025-05-03\",\"publish_time\":\"12:10\",\"time_to_read\":\"1\",\"layout\":null,\"status\":\"published\",\"author_id\":\"3\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-18.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\",\"submitter\":\"save\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.21.0.1',1,'Botble\\ACL\\Models\\User',18,'Unlock The Secrets Of Selling High Ticket Items','primary','2025-05-26 13:31:12','2025-05-26 13:31:12'),(8,1,'Botble\\ACL\\Models\\User','post','{\"name\":\"Why Teamwork Really Makes The Dream Work\",\"model\":\"Botble\\\\Blog\\\\Models\\\\Post\",\"slug\":\"why-teamwork-really-makes-the-dream-work\",\"slug_id\":\"37\",\"is_slug_editable\":\"1\",\"description\":\"Sapiente nulla natus quibusdam tempore commodi. Est at omnis corporis repellat quia non. Eos ratione quia ex tempora dolore aut. Rerum dignissimos sit ea velit non qui.\",\"is_featured\":\"0\",\"content\":\"<shortcode>[posts-slider filter_by=\\\"featured\\\" limit=\\\"4\\\" posts_collection_id=\\\"1\\\" style=\\\"1\\\"][\\/posts-slider]<\\/shortcode>\",\"video_link\":null,\"video_embed_code\":null,\"video_upload_id\":null,\"gallery\":null,\"seo_meta\":{\"seo_title\":null,\"seo_description\":null,\"index\":\"index\"},\"seo_meta_image\":null,\"publish_date\":\"2025-05-03\",\"publish_time\":\"12:10\",\"time_to_read\":\"16\",\"layout\":null,\"status\":\"published\",\"author_id\":\"1\",\"format_type\":\"video\",\"categories\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"],\"image\":\"news\\/news-7.jpg\",\"tag\":\"[{\\\"value\\\":\\\"General\\\"},{\\\"value\\\":\\\"Beauty\\\"},{\\\"value\\\":\\\"Fashion\\\"},{\\\"value\\\":\\\"Lifestyle\\\"},{\\\"value\\\":\\\"Travel\\\"},{\\\"value\\\":\\\"Business\\\"},{\\\"value\\\":\\\"Health\\\"}]\",\"comment_status\":\"1\",\"show_toc_in_content\":\"yes\",\"submitter\":\"save\"}','updated','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.21.0.1',1,'Botble\\ACL\\Models\\User',7,'Why Teamwork Really Makes The Dream Work','primary','2025-05-26 14:51:28','2025-05-26 14:51:28');
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_likes`
--

DROP TABLE IF EXISTS `bb_comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`),
  KEY `bb_comment_likes_comment_id_index` (`comment_id`),
  KEY `bb_comment_likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_likes`
--

LOCK TABLES `bb_comment_likes` WRITE;
/*!40000 ALTER TABLE `bb_comment_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_recommends`
--

DROP TABLE IF EXISTS `bb_comment_recommends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_recommends` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`),
  KEY `bb_comment_recommends_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_recommends`
--

LOCK TABLES `bb_comment_recommends` WRITE;
/*!40000 ALTER TABLE `bb_comment_recommends` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_recommends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_users`
--

DROP TABLE IF EXISTS `bb_comment_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bb_comment_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_users`
--

LOCK TABLES `bb_comment_users` WRITE;
/*!40000 ALTER TABLE `bb_comment_users` DISABLE KEYS */;
INSERT INTO `bb_comment_users` VALUES (1,'Mayra','clarissa.strosin@gmail.com','$2y$12$TMUc.AJGUNzBDVVA7YQ/peWjrFLMOCx2fSI4Xwldi1AdcvaFBBjF2',81,NULL,'2025-07-31 14:35:05','2025-07-31 14:35:05','Douglas'),(2,'Melissa','vada86@gmail.com','$2y$12$3hSn0nALTQN2zQFtHH01Zu1tsWi/O1qwv6u3lp68SBY/aFNWA0bZy',84,NULL,'2025-07-31 14:35:05','2025-07-31 14:35:05','Goldner'),(3,'Jocelyn','romaguera.theresia@streich.com','$2y$12$Z/yJgqXIRaEoZhgIr7xtXOWZbUl132XH5PiiulnwZMjpJ.zI5JA3S',83,NULL,'2025-07-31 14:35:05','2025-07-31 14:35:05','Mueller'),(4,'Maud','aschmitt@yahoo.com','$2y$12$XfhbBJ8/P/VrzusDdmUYeeQ6tv03RtG8QOjwLtKyqszxuouhW7vlC',82,NULL,'2025-07-31 14:35:06','2025-07-31 14:35:06','Watsica'),(5,'Eryn','hshields@stanton.net','$2y$12$qhjuoL5doT6N4wCci4cYeuhcuacRZMvSs4Bq24WcUj5VfoieTbywS',83,NULL,'2025-07-31 14:35:06','2025-07-31 14:35:06','Haag'),(6,'Martine','jesus52@yahoo.com','$2y$12$i1JtOXCa7rTrlZH3jduDOu7dMfVL8JvdgPlGOJ2EkYEMVuGlVJQCO',82,NULL,'2025-07-31 14:35:06','2025-07-31 14:35:06','Price'),(7,'Tabitha','jamarcus.lind@russel.com','$2y$12$CraO/bc.Hnqdu6huljg9hOdmaw0AyXDZCBK40/aASEY9yy3kauiOC',84,NULL,'2025-07-31 14:35:06','2025-07-31 14:35:06','Funk'),(8,'Aniya','zhessel@gmail.com','$2y$12$q/Ndk1HfznsVqWrl01JnJemVVlHE7M5SyxAJ72cHWdkwxqXDFDnxK',81,NULL,'2025-07-31 14:35:06','2025-07-31 14:35:06','Marvin'),(9,'Tre','bernhard.hyman@goldner.net','$2y$12$q5OL3fOmomM9cjmGjzMdn.GpNVFRzb/J2qZ1E/OZfSdMa8kuUP2p6',83,NULL,'2025-07-31 14:35:07','2025-07-31 14:35:07','Beahan'),(10,'Kieran','ccummerata@hotmail.com','$2y$12$5Za7WeKIPBxMTw4vTniuVed.1vs3sVJNGVLVUU8dDmhIti8Trnu8a',84,NULL,'2025-07-31 14:35:07','2025-07-31 14:35:07','Tillman');
/*!40000 ALTER TABLE `bb_comment_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comments`
--

DROP TABLE IF EXISTS `bb_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `like_count` int NOT NULL DEFAULT '0',
  `reply_count` int NOT NULL DEFAULT '0',
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comments`
--

LOCK TABLES `bb_comments` WRITE;
/*!40000 ALTER TABLE `bb_comments` DISABLE KEYS */;
INSERT INTO `bb_comments` VALUES (1,'Alice could not think of anything to say, she simply bowed, and took the thimble, saying \'We beg.',1,'Botble\\Blog\\Models\\Post','240.4.235.102',2,'published',0,2,0,'2025-07-10 02:17:10','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(2,'Hatter: and in another moment that it was very glad she had nothing else to do, and in another.',1,'Botble\\Blog\\Models\\Post','253.107.221.71',6,'published',0,0,0,'2025-07-12 16:27:06','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(3,'Hearts were seated on their throne when they saw her, they hurried back to the Dormouse, not.',1,'Botble\\Blog\\Models\\Post','88.253.153.238',4,'published',0,0,0,'2025-07-30 17:33:38','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(4,'Alice timidly. \'Would you tell me,\' said Alice, and she jumped up in such a simple question,\'.',1,'Botble\\Blog\\Models\\Post','121.71.148.43',3,'published',0,0,0,'2025-07-27 15:23:26','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(5,'Alice. \'And where HAVE my shoulders got to? And oh, I wish you wouldn\'t keep appearing and.',1,'Botble\\Blog\\Models\\Post','41.60.148.225',9,'published',0,0,0,'2025-07-23 16:47:38','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(6,'TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at each other for some way of nursing it.',1,'Botble\\Blog\\Models\\Post','132.208.8.235',6,'published',0,0,0,'2025-07-02 19:38:56','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(7,'Alice looked up, but it is.\' \'I quite agree with you,\' said the Cat, and vanished again. Alice.',1,'Botble\\Blog\\Models\\Post','217.33.18.245',8,'published',0,0,1,'2025-07-30 13:30:03','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(8,'Why, I wouldn\'t say anything about it, and finding it very nice, (it had, in fact, I didn\'t know.',1,'Botble\\Blog\\Models\\Post','96.169.75.93',4,'published',0,0,1,'2025-07-28 16:25:55','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(9,'Alice. \'Then it doesn\'t matter which way you can;--but I must go and get ready for your walk!\".',2,'Botble\\Blog\\Models\\Post','3.156.121.5',6,'published',0,0,0,'2025-07-29 03:31:30','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(10,'I shall remember it in her life, and had to leave off being arches to do anything but sit with its.',2,'Botble\\Blog\\Models\\Post','237.4.240.179',1,'published',0,1,0,'2025-07-14 07:03:31','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(11,'The March Hare said--\' \'I didn\'t!\' the March Hare. \'Sixteenth,\' added the Dormouse. \'Don\'t talk.',2,'Botble\\Blog\\Models\\Post','117.38.21.75',6,'published',0,1,0,'2025-07-02 01:48:32','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(12,'However, it was too slippery; and when she found this a very fine day!\' said a timid and tremulous.',2,'Botble\\Blog\\Models\\Post','104.253.86.49',1,'published',0,0,0,'2025-07-14 21:38:04','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(13,'The Knave did so, very carefully, nibbling first at one end to the door, she walked up towards it.',2,'Botble\\Blog\\Models\\Post','134.10.225.253',2,'published',0,0,0,'2025-07-11 22:25:29','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(14,'Alice. \'Anything you like,\' said the Rabbit hastily interrupted. \'There\'s a great crash, as if it.',2,'Botble\\Blog\\Models\\Post','238.102.195.109',5,'published',0,0,0,'2025-07-06 00:53:54','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(15,'I think?\' \'I had NOT!\' cried the Gryphon, and all must have been changed for Mabel! I\'ll try and.',2,'Botble\\Blog\\Models\\Post','214.64.216.57',1,'published',0,0,10,'2025-07-30 15:26:14','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(16,'VERY tired of being upset, and their curls got entangled together. Alice laughed so much about a.',2,'Botble\\Blog\\Models\\Post','86.235.25.222',3,'published',0,0,11,'2025-07-22 23:56:08','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(17,'Gryphon, and the whole thing very absurd, but they were nice grand words to say.) Presently she.',3,'Botble\\Blog\\Models\\Post','192.100.66.118',3,'published',0,1,0,'2025-07-19 10:45:34','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(18,'Alice kept her waiting!\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to her chin.',3,'Botble\\Blog\\Models\\Post','88.114.82.58',3,'published',0,0,0,'2025-07-23 00:30:43','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(19,'CHORUS. (In which the wretched Hatter trembled so, that he had a large pool all round the.',3,'Botble\\Blog\\Models\\Post','166.164.79.142',9,'published',0,0,0,'2025-07-04 08:22:36','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(20,'Nile On every golden scale! \'How cheerfully he seems to suit them!\' \'I haven\'t the least notice of.',3,'Botble\\Blog\\Models\\Post','69.79.155.204',4,'published',0,1,0,'2025-07-06 15:52:05','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(21,'WHAT?\' thought Alice to herself, \'whenever I eat or drink under the window, I only knew the right.',3,'Botble\\Blog\\Models\\Post','226.84.228.230',8,'published',0,0,0,'2025-07-30 01:20:31','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(22,'Alice. \'Come, let\'s try the patience of an oyster!\' \'I wish you were all locked; and when she had.',3,'Botble\\Blog\\Models\\Post','111.62.159.238',5,'published',0,0,0,'2025-07-18 00:35:57','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(23,'Pigeon had finished. \'As if it likes.\' \'I\'d rather finish my tea,\' said the Hatter, and he checked.',3,'Botble\\Blog\\Models\\Post','141.110.162.81',7,'published',0,0,20,'2025-07-30 06:00:30','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(24,'Alice thought she had found the fan she was now the right size again; and the sounds will take.',3,'Botble\\Blog\\Models\\Post','82.231.12.198',2,'published',0,0,17,'2025-07-22 12:37:35','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(25,'Cat, \'or you wouldn\'t mind,\' said Alice: \'besides, that\'s not a moment like a telescope! I think.',21,'Botble\\Blog\\Models\\Post','44.12.162.192',10,'published',0,1,0,'2025-07-20 06:06:56','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(26,'Cheshire cat,\' said the Gryphon. \'--you advance twice--\' \'Each with a table in the lock, and to.',21,'Botble\\Blog\\Models\\Post','8.104.201.233',3,'published',0,1,0,'2025-07-19 12:07:59','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(27,'Imagine her surprise, when the White Rabbit, \'but it seems to like her, down here, and I\'m I.',21,'Botble\\Blog\\Models\\Post','177.246.235.56',10,'published',0,0,0,'2025-07-18 14:38:26','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(28,'How I wonder if I know all the way out of the month, and doesn\'t tell what o\'clock it is!\' \'Why.',21,'Botble\\Blog\\Models\\Post','239.148.142.86',2,'published',0,0,0,'2025-07-04 00:42:22','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(29,'Alice, \'but I must sugar my hair.\" As a duck with its wings. \'Serpent!\' screamed the Gryphon.',21,'Botble\\Blog\\Models\\Post','203.4.51.47',7,'published',0,0,0,'2025-07-31 00:48:02','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(30,'Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows When.',21,'Botble\\Blog\\Models\\Post','167.44.178.6',5,'published',0,0,0,'2025-07-24 01:43:21','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(31,'March Hare. \'Sixteenth,\' added the Hatter, with an M?\' said Alice. \'Well, then,\' the Gryphon.',21,'Botble\\Blog\\Models\\Post','181.33.6.243',7,'published',0,0,26,'2025-07-22 06:50:14','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(32,'Alice: \'she\'s so extremely--\' Just then she had put the Dormouse again, so violently, that she.',21,'Botble\\Blog\\Models\\Post','229.146.47.158',5,'published',0,0,25,'2025-07-24 22:33:14','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(33,'Alice. \'Come on, then!\' roared the Queen, \'and he shall tell you how it was too slippery; and when.',22,'Botble\\Blog\\Models\\Post','117.43.177.180',8,'published',0,0,0,'2025-07-28 23:40:42','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(34,'Mouse was speaking, so that by the Queen said--\' \'Get to your places!\' shouted the Queen. An.',22,'Botble\\Blog\\Models\\Post','55.65.179.247',5,'published',0,0,0,'2025-07-28 11:16:33','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(35,'Alice in a deep voice, \'What are you thinking of?\' \'I beg your pardon,\' said Alice thoughtfully.',22,'Botble\\Blog\\Models\\Post','239.133.15.174',10,'published',0,0,0,'2025-07-01 22:37:50','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(36,'This time Alice waited patiently until it chose to speak again. In a minute or two, she made out.',22,'Botble\\Blog\\Models\\Post','235.203.87.55',6,'published',0,1,0,'2025-07-08 22:52:42','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(37,'I\'ll manage better this time,\' she said to the shore, and then they both bowed low, and their.',22,'Botble\\Blog\\Models\\Post','12.245.78.103',9,'published',0,1,0,'2025-07-22 01:59:07','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(38,'The Queen smiled and passed on. \'Who ARE you talking to?\' said one of them at dinn--\' she checked.',22,'Botble\\Blog\\Models\\Post','117.246.23.46',2,'published',0,0,0,'2025-07-11 20:25:48','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(39,'Duchess was sitting on a little three-legged table, all made a snatch in the other: the Duchess.',22,'Botble\\Blog\\Models\\Post','83.147.28.129',7,'published',0,0,37,'2025-07-22 05:26:44','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(40,'ME,\' said Alice in a thick wood. \'The first thing she heard a little shriek and a fall, and a Long.',22,'Botble\\Blog\\Models\\Post','55.252.54.73',7,'published',0,0,36,'2025-07-28 05:18:58','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(41,'Gryphon at the door of the Shark, But, when the White Rabbit. She was a table set out under a tree.',23,'Botble\\Blog\\Models\\Post','160.11.212.157',3,'published',0,0,0,'2025-07-31 08:45:34','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(42,'Alice! when she had drunk half the bottle, she found she had drunk half the bottle, saying to her.',23,'Botble\\Blog\\Models\\Post','57.152.136.67',5,'published',0,1,0,'2025-07-24 18:05:07','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(43,'Mock Turtle at last, and managed to swallow a morsel of the officers: but the great wonder is.',23,'Botble\\Blog\\Models\\Post','5.70.147.79',7,'published',0,1,0,'2025-07-03 22:10:08','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(44,'While the Duchess asked, with another dig of her sister, as well say that \"I see what was going to.',23,'Botble\\Blog\\Models\\Post','139.149.223.67',9,'published',0,0,0,'2025-07-15 12:38:01','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(45,'Mock Turtle: \'nine the next, and so on.\' \'What a curious plan!\' exclaimed Alice. \'And be quick.',23,'Botble\\Blog\\Models\\Post','43.214.225.17',3,'published',0,0,0,'2025-07-02 15:21:44','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(46,'YOU must cross-examine THIS witness.\' \'Well, if I shall have somebody to talk to.\' \'How are you.',23,'Botble\\Blog\\Models\\Post','227.225.191.8',1,'published',0,0,0,'2025-07-24 16:32:30','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(47,'Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Gryphon. Alice did not quite.',23,'Botble\\Blog\\Models\\Post','232.176.173.165',9,'published',0,0,42,'2025-07-30 14:22:06','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser'),(48,'I suppose I ought to have changed since her swim in the middle. Alice kept her eyes immediately.',23,'Botble\\Blog\\Models\\Post','213.28.2.84',8,'published',0,0,43,'2025-07-19 07:12:42','2025-07-31 14:35:07','Botble\\Comment\\Models\\CommentUser');
/*!40000 ALTER TABLE `bb_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-07-31 14:35:00','2025-07-31 14:35:00'),(2,'Lifestyle',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-07-31 14:35:00','2025-07-31 14:35:00'),(3,'Travel Tips',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-07-31 14:35:00','2025-07-31 14:35:00'),(4,'Healthy',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-07-31 14:35:00','2025-07-31 14:35:00'),(5,'Fashion',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-07-31 14:35:00','2025-07-31 14:35:00'),(6,'Hotel',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-07-31 14:35:00','2025-07-31 14:35:00'),(7,'Nature',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-07-31 14:35:00','2025-07-31 14:35:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Phong cách sống',NULL),('vi',2,'Sức khỏe',NULL),('vi',3,'Món ngon',NULL),('vi',4,'Sách',NULL),('vi',5,'Mẹo du lịch',NULL),('vi',6,'Khách sạn',NULL),('vi',7,'Thiên nhiên',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Prof. Anjali Larkin MD','evert.stracke@example.com','831.901.1647','7483 Runolfsdottir Well Apt. 659\nWest Serena, MS 43639','Et eveniet est temporibus placeat eveniet maxime.','Nam voluptate sit cum corrupti consectetur qui autem. Id et ratione unde consequuntur ipsam hic dolor. Aliquam commodi numquam atque. Error vero deserunt animi distinctio a et. Esse necessitatibus necessitatibus aspernatur dicta voluptatem. Amet ad impedit ad modi iusto dolorum facere. Rerum laudantium illo eveniet aut. Dicta ea soluta ad ut vel repellat quos. Ducimus atque doloribus et natus non.',NULL,'read','2025-07-31 14:34:57','2025-07-31 14:34:57'),(2,'Colten Rau','manuela69@example.org','223.708.8882','44286 Hoppe Fields Apt. 481\nPort Willow, NC 87745','Quibusdam nisi corrupti provident.','Laudantium aut cupiditate sequi dolorum odit id eum. Veniam quo vel accusamus voluptatem dolor velit repudiandae. Illum perspiciatis asperiores eveniet dolores. Delectus et soluta natus aut. Est nisi aspernatur est molestiae. Aut corporis sit saepe quas quam labore. Itaque pariatur harum accusantium enim facilis. Atque mollitia at quia molestiae cumque officiis eligendi et. Perspiciatis quidem vel impedit in et odio. Sapiente impedit assumenda est et nostrum magnam.',NULL,'read','2025-07-31 14:34:57','2025-07-31 14:34:57'),(3,'Miss Belle Ritchie','evangeline.fisher@example.com','(270) 917-5044','54778 Kihn Prairie\nVandervortview, AL 59232','Dicta est deserunt nisi.','Libero explicabo rem sit distinctio natus. Earum dignissimos aliquam et perspiciatis dolore facilis. Ut libero est minus molestias culpa et nemo. Sed ut est quas provident amet. Nemo molestias laudantium ex est veritatis qui. Iste vero optio dolores nihil commodi. Officia molestias sed nesciunt accusantium quo quasi. A enim architecto ex est velit. Sed est eum quia est dolorum maxime in.',NULL,'unread','2025-07-31 14:34:57','2025-07-31 14:34:57'),(4,'Charles Huel','quigley.liliane@example.net','(512) 314-4193','6447 Hammes Forks\nWest Ramirohaven, KS 95504','Quasi fugit quis blanditiis in ut est aut.','Aut dolorem perferendis molestiae ullam. Labore minima commodi dolore commodi placeat cupiditate veniam saepe. Nostrum qui dolores unde dolorem. Veritatis et iste voluptate voluptatem distinctio consectetur enim. Provident esse et rerum aperiam totam. Temporibus commodi laboriosam dolore sit aut sit. Dolores consequatur voluptatem voluptatibus eveniet voluptatem reprehenderit natus. Perferendis repellendus nihil ratione vel et corporis.',NULL,'unread','2025-07-31 14:34:57','2025-07-31 14:34:57'),(5,'Dr. Gudrun Kuphal','anthony.gutkowski@example.com','+1 (352) 760-7019','389 Strosin Cape Apt. 451\nNadermouth, NH 00072-1777','Est eveniet facere et consequatur.','Ut est nisi mollitia ab doloribus. Ipsam voluptatibus dolorum ut sed non. Officiis rerum inventore quia magnam expedita qui. Id reiciendis eveniet quam ex velit. Consequatur incidunt omnis vel qui tenetur sit voluptates. Voluptatem enim deserunt atque voluptatem nemo minima non. Non veritatis laudantium ullam soluta magni. Animi animi nobis voluptas quia. Perspiciatis voluptas provident provident. Eius aliquid nesciunt vel placeat beatae.',NULL,'unread','2025-07-31 14:34:57','2025-07-31 14:34:57'),(6,'Josefa Bartoletti','frida37@example.com','(859) 991-6265','7191 Oliver Prairie Suite 497\nHellerfort, IN 09414','Vero est nisi consequatur et culpa hic.','Odit porro quidem in tempore voluptatem aut ipsum qui. Impedit sunt repudiandae laborum consectetur sit fugiat. Non sint ea culpa voluptatem nemo delectus. Asperiores dolorem voluptatibus velit distinctio voluptates explicabo. Ut quaerat cum aut aut quia et qui. Autem doloremque eveniet totam modi saepe adipisci. Eius dolorum pariatur voluptas veniam repudiandae. Totam deleniti ipsa aliquid. Eveniet reprehenderit id tempore dolores quia debitis eveniet.',NULL,'unread','2025-07-31 14:34:57','2025-07-31 14:34:57'),(7,'Trenton Nikolaus MD','tskiles@example.com','1-423-882-4881','30983 Orrin Junction Apt. 280\nAbeton, NM 13536-0711','Facere qui quia deserunt recusandae.','Dolores maiores quam alias est est quibusdam et. Hic corrupti quis eligendi nihil non aut nesciunt. Beatae in quaerat quo voluptatem quia sed voluptatem. Nemo voluptates eligendi reprehenderit harum. Deserunt sed quasi quisquam officia. Non sit quia amet eum. Architecto aut quo sunt incidunt ullam. Laudantium quo quia ducimus et. Optio aut qui et sit consequuntur. Modi tenetur voluptatem ut sint.',NULL,'read','2025-07-31 14:34:57','2025-07-31 14:34:57'),(8,'Sedrick Metz','ukreiger@example.net','(850) 746-1240','863 Hilpert Squares Suite 036\nGoyettemouth, ME 34529','Asperiores quos quisquam itaque officia.','Quod nostrum et delectus aut dolores illo culpa qui. Temporibus et sit accusamus ab natus et. Mollitia ullam velit omnis ad assumenda assumenda. Necessitatibus provident repellendus sit repudiandae tempora nisi. Natus ab quaerat quos voluptas voluptatem quos est ut. At quae sit id numquam maiores amet ipsum expedita. Numquam velit ipsum et unde voluptate repellendus.',NULL,'unread','2025-07-31 14:34:57','2025-07-31 14:34:57'),(9,'Tyrese Torp','jayson.ledner@example.com','(984) 978-1882','22057 Medhurst Row Apt. 216\nMayaborough, UT 57305-2683','Est doloremque cumque rerum.','Sit beatae beatae nesciunt dolor quis molestiae. Qui soluta ut quia hic a eligendi. Repellat dolor saepe doloribus voluptatem asperiores inventore. Recusandae quia autem aut nulla et eos eveniet aut. Qui quaerat rerum ratione tenetur dolores qui fugit. Nihil nobis error minus aliquam possimus minus. Blanditiis exercitationem incidunt cumque ut vel.',NULL,'unread','2025-07-31 14:34:57','2025-07-31 14:34:57'),(10,'Prof. Megane Blanda','leopoldo.homenick@example.net','(760) 466-4646','27797 Jedediah View\nNorth Sandra, SD 25694-1992','Sit nesciunt suscipit eius perferendis saepe.','Porro ad saepe neque iusto et. Tempora iure corrupti et quisquam. Voluptas deleniti expedita et amet dolorem possimus eos. Sint ratione reiciendis consectetur odit sequi dolore fugiat. At molestiae optio minus. Saepe illum iure maxime et debitis quis sequi. Iusto incidunt vel ipsum sequi numquam aut. Velit culpa quis dolores sed illum. Ut a aut dolorum praesentium rem possimus.',NULL,'read','2025-07-31 14:34:57','2025-07-31 14:34:57');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
INSERT INTO `dashboard_widgets` VALUES (1,'widget_total_themes','2025-05-18 14:00:47','2025-05-18 14:00:47'),(2,'widget_total_users','2025-05-18 14:00:47','2025-05-18 14:00:47'),(3,'widget_total_plugins','2025-05-18 14:00:47','2025-05-18 14:00:47'),(4,'widget_total_pages','2025-05-18 14:00:47','2025-05-18 14:00:47'),(5,'widget_posts_recent','2025-05-18 14:00:47','2025-05-18 14:00:47'),(6,'widget_audit_logs','2025-05-18 14:00:47','2025-05-18 14:00:47'),(7,'widget_request_errors','2025-05-18 14:00:47','2025-05-18 14:00:47');
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_posts`
--

DROP TABLE IF EXISTS `favorite_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `type` enum('favorite','bookmark') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorite_posts_post_id_user_id_type_unique` (`post_id`,`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_posts`
--

LOCK TABLES `favorite_posts` WRITE;
/*!40000 ALTER TABLE `favorite_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Assumenda quis ut voluptas rerum sunt similique quia esse. Dolor architecto voluptatem provident ea at.',1,0,'galleries/1.jpg',1,'published','2025-07-31 14:34:57','2025-07-31 14:34:57'),(2,'New Day','Debitis ratione harum est officiis. Quidem minus corrupti impedit est sit. Dolorem nam eum excepturi qui.',1,0,'galleries/2.jpg',1,'published','2025-07-31 14:34:57','2025-07-31 14:34:57'),(3,'Happy Day','Qui fugit sint aliquid. Qui quas doloribus iure rerum voluptate. Porro nesciunt ut aut molestiae minus.',1,0,'galleries/3.jpg',1,'published','2025-07-31 14:34:57','2025-07-31 14:34:57'),(4,'Nature','Iusto ducimus sit placeat nihil nisi. Eum quasi aut reprehenderit. Vitae ut commodi porro delectus.',1,0,'galleries/4.jpg',1,'published','2025-07-31 14:34:57','2025-07-31 14:34:57'),(5,'Morning','Animi eum nihil et distinctio et animi ut. Numquam facere dolores consequuntur quia neque magni deserunt. Id et optio aut saepe quos consequatur ea.',1,0,'galleries/5.jpg',1,'published','2025-07-31 14:34:57','2025-07-31 14:34:57'),(6,'Photography','Sed quibusdam maxime ullam aperiam incidunt. Blanditiis consequatur quam sint laudantium esse voluptas excepturi. Nam voluptatibus et velit libero.',1,0,'galleries/6.jpg',1,'published','2025-07-31 14:34:57','2025-07-31 14:34:57');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
INSERT INTO `galleries_translations` VALUES ('vi',1,'Hoàn hảo',NULL),('vi',2,'Ngày mới',NULL),('vi',3,'Ngày hạnh phúc',NULL),('vi',4,'Thiên nhiên',NULL),('vi',5,'Buổi sáng',NULL),('vi',6,'Nghệ thuật',NULL);
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Neque aut earum labore optio. Minus aperiam sunt est dolore omnis quis et animi. Odio maiores tempora cumque. Ullam quos et eveniet ut vel.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Voluptate id enim fugiat. Amet beatae voluptatem non aperiam. Molestiae aliquid eos tenetur labore eos sit omnis.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Ullam nobis aut voluptatem asperiores rerum ut. Sit placeat a ut animi. Qui rem deleniti id.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Dolorem minima quod est nesciunt sed necessitatibus. Dolorem rerum qui placeat fugiat quidem voluptas.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui ab at est deleniti ut fugiat. Odit voluptatem officia est et animi nisi. Quo similique doloribus sit nisi impedit blanditiis qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui omnis officiis ipsum soluta eum odio. Vel nesciunt aut et modi possimus. Unde architecto dolor aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Voluptatibus autem molestiae magni sit laboriosam soluta autem eius. Optio beatae sed placeat cum vitae fugiat. Maiores nihil voluptas nemo.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Nihil qui illo tenetur aperiam vel. Ad nisi et at molestiae fuga harum quos. Eos expedita aut quibusdam nihil libero quam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis nam assumenda laborum dolor quibusdam. Voluptatem consequatur sapiente quis ut est. Perspiciatis pariatur adipisci eius et minus adipisci.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Aliquam fugit qui aliquid corrupti cum. Officia quaerat et aut aspernatur. Natus voluptatem consequatur vero explicabo dignissimos.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2025-07-31 14:34:57','2025-07-31 14:34:57'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Neque aut earum labore optio. Minus aperiam sunt est dolore omnis quis et animi. Odio maiores tempora cumque. Ullam quos et eveniet ut vel.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Voluptate id enim fugiat. Amet beatae voluptatem non aperiam. Molestiae aliquid eos tenetur labore eos sit omnis.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Ullam nobis aut voluptatem asperiores rerum ut. Sit placeat a ut animi. Qui rem deleniti id.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Dolorem minima quod est nesciunt sed necessitatibus. Dolorem rerum qui placeat fugiat quidem voluptas.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui ab at est deleniti ut fugiat. Odit voluptatem officia est et animi nisi. Quo similique doloribus sit nisi impedit blanditiis qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui omnis officiis ipsum soluta eum odio. Vel nesciunt aut et modi possimus. Unde architecto dolor aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Voluptatibus autem molestiae magni sit laboriosam soluta autem eius. Optio beatae sed placeat cum vitae fugiat. Maiores nihil voluptas nemo.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Nihil qui illo tenetur aperiam vel. Ad nisi et at molestiae fuga harum quos. Eos expedita aut quibusdam nihil libero quam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis nam assumenda laborum dolor quibusdam. Voluptatem consequatur sapiente quis ut est. Perspiciatis pariatur adipisci eius et minus adipisci.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Aliquam fugit qui aliquid corrupti cum. Officia quaerat et aut aspernatur. Natus voluptatem consequatur vero explicabo dignissimos.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2025-07-31 14:34:57','2025-07-31 14:34:57'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Neque aut earum labore optio. Minus aperiam sunt est dolore omnis quis et animi. Odio maiores tempora cumque. Ullam quos et eveniet ut vel.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Voluptate id enim fugiat. Amet beatae voluptatem non aperiam. Molestiae aliquid eos tenetur labore eos sit omnis.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Ullam nobis aut voluptatem asperiores rerum ut. Sit placeat a ut animi. Qui rem deleniti id.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Dolorem minima quod est nesciunt sed necessitatibus. Dolorem rerum qui placeat fugiat quidem voluptas.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui ab at est deleniti ut fugiat. Odit voluptatem officia est et animi nisi. Quo similique doloribus sit nisi impedit blanditiis qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui omnis officiis ipsum soluta eum odio. Vel nesciunt aut et modi possimus. Unde architecto dolor aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Voluptatibus autem molestiae magni sit laboriosam soluta autem eius. Optio beatae sed placeat cum vitae fugiat. Maiores nihil voluptas nemo.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Nihil qui illo tenetur aperiam vel. Ad nisi et at molestiae fuga harum quos. Eos expedita aut quibusdam nihil libero quam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis nam assumenda laborum dolor quibusdam. Voluptatem consequatur sapiente quis ut est. Perspiciatis pariatur adipisci eius et minus adipisci.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Aliquam fugit qui aliquid corrupti cum. Officia quaerat et aut aspernatur. Natus voluptatem consequatur vero explicabo dignissimos.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2025-07-31 14:34:57','2025-07-31 14:34:57'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Neque aut earum labore optio. Minus aperiam sunt est dolore omnis quis et animi. Odio maiores tempora cumque. Ullam quos et eveniet ut vel.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Voluptate id enim fugiat. Amet beatae voluptatem non aperiam. Molestiae aliquid eos tenetur labore eos sit omnis.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Ullam nobis aut voluptatem asperiores rerum ut. Sit placeat a ut animi. Qui rem deleniti id.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Dolorem minima quod est nesciunt sed necessitatibus. Dolorem rerum qui placeat fugiat quidem voluptas.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui ab at est deleniti ut fugiat. Odit voluptatem officia est et animi nisi. Quo similique doloribus sit nisi impedit blanditiis qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui omnis officiis ipsum soluta eum odio. Vel nesciunt aut et modi possimus. Unde architecto dolor aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Voluptatibus autem molestiae magni sit laboriosam soluta autem eius. Optio beatae sed placeat cum vitae fugiat. Maiores nihil voluptas nemo.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Nihil qui illo tenetur aperiam vel. Ad nisi et at molestiae fuga harum quos. Eos expedita aut quibusdam nihil libero quam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis nam assumenda laborum dolor quibusdam. Voluptatem consequatur sapiente quis ut est. Perspiciatis pariatur adipisci eius et minus adipisci.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Aliquam fugit qui aliquid corrupti cum. Officia quaerat et aut aspernatur. Natus voluptatem consequatur vero explicabo dignissimos.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2025-07-31 14:34:57','2025-07-31 14:34:57'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Neque aut earum labore optio. Minus aperiam sunt est dolore omnis quis et animi. Odio maiores tempora cumque. Ullam quos et eveniet ut vel.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Voluptate id enim fugiat. Amet beatae voluptatem non aperiam. Molestiae aliquid eos tenetur labore eos sit omnis.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Ullam nobis aut voluptatem asperiores rerum ut. Sit placeat a ut animi. Qui rem deleniti id.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Dolorem minima quod est nesciunt sed necessitatibus. Dolorem rerum qui placeat fugiat quidem voluptas.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui ab at est deleniti ut fugiat. Odit voluptatem officia est et animi nisi. Quo similique doloribus sit nisi impedit blanditiis qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui omnis officiis ipsum soluta eum odio. Vel nesciunt aut et modi possimus. Unde architecto dolor aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Voluptatibus autem molestiae magni sit laboriosam soluta autem eius. Optio beatae sed placeat cum vitae fugiat. Maiores nihil voluptas nemo.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Nihil qui illo tenetur aperiam vel. Ad nisi et at molestiae fuga harum quos. Eos expedita aut quibusdam nihil libero quam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis nam assumenda laborum dolor quibusdam. Voluptatem consequatur sapiente quis ut est. Perspiciatis pariatur adipisci eius et minus adipisci.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Aliquam fugit qui aliquid corrupti cum. Officia quaerat et aut aspernatur. Natus voluptatem consequatur vero explicabo dignissimos.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2025-07-31 14:34:57','2025-07-31 14:34:57'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Neque aut earum labore optio. Minus aperiam sunt est dolore omnis quis et animi. Odio maiores tempora cumque. Ullam quos et eveniet ut vel.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Voluptate id enim fugiat. Amet beatae voluptatem non aperiam. Molestiae aliquid eos tenetur labore eos sit omnis.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Ullam nobis aut voluptatem asperiores rerum ut. Sit placeat a ut animi. Qui rem deleniti id.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Dolorem minima quod est nesciunt sed necessitatibus. Dolorem rerum qui placeat fugiat quidem voluptas.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui ab at est deleniti ut fugiat. Odit voluptatem officia est et animi nisi. Quo similique doloribus sit nisi impedit blanditiis qui.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Qui omnis officiis ipsum soluta eum odio. Vel nesciunt aut et modi possimus. Unde architecto dolor aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Voluptatibus autem molestiae magni sit laboriosam soluta autem eius. Optio beatae sed placeat cum vitae fugiat. Maiores nihil voluptas nemo.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Nihil qui illo tenetur aperiam vel. Ad nisi et at molestiae fuga harum quos. Eos expedita aut quibusdam nihil libero quam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Quis nam assumenda laborum dolor quibusdam. Voluptatem consequatur sapiente quis ut est. Perspiciatis pariatur adipisci eius et minus adipisci.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Aliquam fugit qui aliquid corrupti cum. Officia quaerat et aut aspernatur. Natus voluptatem consequatur vero explicabo dignissimos.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2025-07-31 14:34:57','2025-07-31 14:34:57');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','260a03acc6bbc884aab42d252e4b040d',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','5dec9afc45c4da720713a3cf29ca2a53',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','9e7e982bf4d477b77fcba78dddb083d2',2,'Botble\\Menu\\Models\\Menu'),(4,'vi','c265e237b67ef8fe6745d6f4b4a95065',2,'Botble\\Menu\\Models\\MenuLocation'),(5,'vi','5dec9afc45c4da720713a3cf29ca2a53',3,'Botble\\Menu\\Models\\Menu'),(6,'vi','9e7e982bf4d477b77fcba78dddb083d2',4,'Botble\\Menu\\Models\\Menu'),(7,'en_US','0a02379e8983e9752fb0997ba02321a7',1,'Botble\\PostCollection\\Models\\PostCollection'),(8,'en_US','29f955816b7fcbf7183a019d2426e653',2,'Botble\\PostCollection\\Models\\PostCollection'),(9,'vi','79acf29e9870f548e9b2ddb982d922a4',3,'Botble\\PostCollection\\Models\\PostCollection'),(10,'vi','9254e63506320d66ebceaaf71755ebe0',4,'Botble\\PostCollection\\Models\\PostCollection');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'image-1','image-1',1,'image/jpeg',14506,'banners/image-1.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(2,0,'image-2','image-2',1,'image/jpeg',8220,'banners/image-2.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(3,0,'image-3','image-3',1,'image/jpeg',6445,'banners/image-3.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(4,0,'image-4','image-4',1,'image/jpeg',9763,'banners/image-4.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(5,0,'1','1',2,'image/jpeg',40741,'galleries/1.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(6,0,'10','10',2,'image/jpeg',91805,'galleries/10.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(7,0,'2','2',2,'image/jpeg',41198,'galleries/2.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(8,0,'3','3',2,'image/jpeg',63867,'galleries/3.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(9,0,'4','4',2,'image/jpeg',57483,'galleries/4.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(10,0,'5','5',2,'image/jpeg',66669,'galleries/5.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(11,0,'6','6',2,'image/jpeg',39548,'galleries/6.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(12,0,'7','7',2,'image/jpeg',39483,'galleries/7.jpg','[]','2025-07-31 14:34:56','2025-07-31 14:34:56',NULL,'public'),(13,0,'8','8',2,'image/jpeg',56687,'galleries/8.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(14,0,'9','9',2,'image/jpeg',67124,'galleries/9.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(15,0,'news-1','news-1',3,'image/jpeg',68353,'news/news-1.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(16,0,'news-10','news-10',3,'image/jpeg',40388,'news/news-10.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(17,0,'news-11','news-11',3,'image/jpeg',76419,'news/news-11.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(18,0,'news-12','news-12',3,'image/jpeg',30432,'news/news-12.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(19,0,'news-13','news-13',3,'image/jpeg',101509,'news/news-13.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(20,0,'news-14','news-14',3,'image/jpeg',42800,'news/news-14.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(21,0,'news-15','news-15',3,'image/jpeg',96325,'news/news-15.jpg','[]','2025-07-31 14:34:57','2025-07-31 14:34:57',NULL,'public'),(22,0,'news-16','news-16',3,'image/jpeg',84016,'news/news-16.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(23,0,'news-17','news-17',3,'image/jpeg',37533,'news/news-17.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(24,0,'news-18','news-18',3,'image/jpeg',32346,'news/news-18.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(25,0,'news-19','news-19',3,'image/jpeg',45310,'news/news-19.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(26,0,'news-2','news-2',3,'image/jpeg',47485,'news/news-2.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(27,0,'news-20','news-20',3,'image/jpeg',36824,'news/news-20.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(28,0,'news-21','news-21',3,'image/jpeg',60823,'news/news-21.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(29,0,'news-22','news-22',3,'image/jpeg',36730,'news/news-22.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(30,0,'news-23','news-23',3,'image/jpeg',26646,'news/news-23.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(31,0,'news-24','news-24',3,'image/jpeg',15769,'news/news-24.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(32,0,'news-3','news-3',3,'image/jpeg',37002,'news/news-3.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(33,0,'news-4','news-4',3,'image/jpeg',77497,'news/news-4.jpg','[]','2025-07-31 14:34:58','2025-07-31 14:34:58',NULL,'public'),(34,0,'news-5','news-5',3,'image/jpeg',75048,'news/news-5.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(35,0,'news-6','news-6',3,'image/jpeg',44854,'news/news-6.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(36,0,'news-7','news-7',3,'image/jpeg',80934,'news/news-7.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(37,0,'news-8','news-8',3,'image/jpeg',53841,'news/news-8.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(38,0,'news-9','news-9',3,'image/jpeg',42449,'news/news-9.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(39,0,'thumbnail-1','thumbnail-1',3,'image/jpeg',48070,'news/thumbnail-1.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(40,0,'thumbnail-2','thumbnail-2',3,'image/jpeg',40499,'news/thumbnail-2.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(41,0,'thumbnail-3','thumbnail-3',3,'image/jpeg',41661,'news/thumbnail-3.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(42,0,'thumbnail-4','thumbnail-4',3,'image/jpeg',24393,'news/thumbnail-4.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(43,0,'thumbnail-5','thumbnail-5',3,'image/jpeg',39656,'news/thumbnail-5.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(44,0,'thumbnail-6','thumbnail-6',3,'image/jpeg',49720,'news/thumbnail-6.jpg','[]','2025-07-31 14:34:59','2025-07-31 14:34:59',NULL,'public'),(45,0,'video1','video1',4,'video/mp4',6378345,'videos/video1.mp4','[]','2025-07-31 14:35:00','2025-07-31 14:35:00',NULL,'public'),(76,0,'1','1',11,'image/jpeg',8581,'members/1.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(77,0,'2','2',11,'image/jpeg',14257,'members/2.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(78,0,'3','3',11,'image/jpeg',14702,'members/3.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(79,0,'4','4',11,'image/jpeg',19699,'members/4.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(80,0,'5','5',11,'image/jpeg',10260,'members/5.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(81,0,'10','10',12,'image/jpeg',20004,'authors/10.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(82,0,'6','6',12,'image/jpeg',8476,'authors/6.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(83,0,'7','7',12,'image/jpeg',14388,'authors/7.jpg','[]','2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,'public'),(84,0,'8','8',12,'image/jpeg',14340,'authors/8.jpg','[]','2025-07-31 14:35:05','2025-07-31 14:35:05',NULL,'public'),(85,0,'9','9',12,'image/jpeg',4396,'authors/9.jpg','[]','2025-07-31 14:35:05','2025-07-31 14:35:05',NULL,'public'),(86,0,'favicon','favicon',13,'image/png',1260,'general/favicon.png','[]','2025-07-31 14:35:07','2025-07-31 14:35:07',NULL,'public'),(87,0,'img-loading','img-loading',13,'image/jpeg',1364,'general/img-loading.jpg','[]','2025-07-31 14:35:07','2025-07-31 14:35:07',NULL,'public'),(88,0,'logo-mobile','logo-mobile',13,'image/png',2562,'general/logo-mobile.png','[]','2025-07-31 14:35:07','2025-07-31 14:35:07',NULL,'public'),(89,0,'logo-tablet','logo-tablet',13,'image/png',3540,'general/logo-tablet.png','[]','2025-07-31 14:35:08','2025-07-31 14:35:08',NULL,'public'),(90,0,'logo-white','logo-white',13,'image/png',3703,'general/logo-white.png','[]','2025-07-31 14:35:08','2025-07-31 14:35:08',NULL,'public'),(91,0,'logo','logo',13,'image/png',5187,'general/logo.png','[]','2025-07-31 14:35:08','2025-07-31 14:35:08',NULL,'public'),(92,0,'screenshot','screenshot',13,'image/png',565891,'general/screenshot.png','[]','2025-07-31 14:35:08','2025-07-31 14:35:08',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'banners',NULL,'banners',0,'2025-07-31 14:34:56','2025-07-31 14:34:56',NULL),(2,0,'galleries',NULL,'galleries',0,'2025-07-31 14:34:56','2025-07-31 14:34:56',NULL),(3,0,'news',NULL,'news',0,'2025-07-31 14:34:57','2025-07-31 14:34:57',NULL),(4,0,'videos',NULL,'videos',0,'2025-07-31 14:35:00','2025-07-31 14:35:00',NULL),(11,0,'members',NULL,'members',0,'2025-07-31 14:35:04','2025-07-31 14:35:04',NULL),(12,0,'authors',NULL,'authors',0,'2025-07-31 14:35:04','2025-07-31 14:35:04',NULL),(13,0,'general',NULL,'general',0,'2025-07-31 14:35:07','2025-07-31 14:35:07',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_activity_logs`
--

DROP TABLE IF EXISTS `member_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_activity_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_activity_logs`
--

LOCK TABLES `member_activity_logs` WRITE;
/*!40000 ALTER TABLE `member_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_password_resets`
--

DROP TABLE IF EXISTS `member_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `member_password_resets_email_index` (`email`),
  KEY `member_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_password_resets`
--

LOCK TABLES `member_password_resets` WRITE;
/*!40000 ALTER TABLE `member_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `favorite_posts` text COLLATE utf8mb4_unicode_ci,
  `bookmark_posts` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Smith','And the Eaglet bent down its head impatiently, and said, \'That\'s right, Five! Always lay the blame.',NULL,'admin@thesky9.com','$2y$12$nVc1e9Mi8dGDrYIo3/yrlO1GAefe1fNHY.jwgp5dV2LMY4bX9zCQW',54,'1998-01-16','1-559-376-8829','2025-07-31 14:35:01',NULL,NULL,'2025-07-31 14:35:01','2025-07-31 14:35:01',NULL,NULL,'published'),(2,'Marguerite','O\'Reilly','Majesty,\' he began. \'You\'re a very poor speaker,\' said the King, who had been (Before she had not.',NULL,'doyle.sarina@wiza.net','$2y$12$cq4.1gL6T9kyB30nDGCJUufbk8BiD8dekrhF6sll6EjJTPDdbdaQ.',57,'2002-01-19','337.914.0145','2025-07-31 14:35:02',NULL,NULL,'2025-07-31 14:35:02','2025-07-31 14:35:02',NULL,NULL,'published'),(3,'Kay','Quitzon','Tea-Party There was nothing on it were nine o\'clock in the back. At last the Gryphon went on. \'I.',NULL,'sbechtelar@gmail.com','$2y$12$5I5OwxxaDYEITZDcIlENJO2g4RDUfdFViYKbZuc.5Lp5VyPxcgptq',64,'1992-12-26','+17703937834','2025-07-31 14:35:02',NULL,NULL,'2025-07-31 14:35:02','2025-07-31 14:35:02',NULL,NULL,'published'),(4,'Marlon','Bailey','I will tell you my history, and you\'ll understand why it is to do it.\' (And, as you liked.\' \'Is.',NULL,'sauer.don@blick.net','$2y$12$5oGAK7IfhsUFvXucAVgjuuLDM2yI14RUKEtwyeeqQb8w/meIEd9AG',69,'2015-03-16','(518) 202-7369','2025-07-31 14:35:03',NULL,NULL,'2025-07-31 14:35:03','2025-07-31 14:35:03',NULL,NULL,'published'),(5,'Shayna','Gulgowski','Duchess: \'flamingoes and mustard both bite. And the executioner went off like an arrow. The Cat\'s.',NULL,'erick.abernathy@hotmail.com','$2y$12$qI3Fw5oApto3WtI1DoAI0.kHrBUWVBWLeIAuezIGY5x1MKFDHIsfu',71,'1975-01-11','(715) 582-5655','2025-07-31 14:35:04',NULL,NULL,'2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,NULL,'published'),(6,'Annie','Nolan','I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s.',NULL,'micheal.pacocha@gmail.com','$2y$12$pL.inzlHP4K0Sgz.X0kSKO5rSjDCFUBqFGlhziTGmdgNoDFY8EMGK',78,'1978-05-31','+1-859-347-7179','2025-07-31 14:35:04',NULL,NULL,'2025-07-31 14:35:04','2025-07-31 14:35:04',NULL,NULL,'published');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-07-31 14:35:07','2025-07-31 14:35:07'),(2,3,'main-menu','2025-07-31 14:35:07','2025-07-31 14:35:07');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(2,1,1,NULL,NULL,'/',NULL,0,'Home default',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(3,1,1,NULL,NULL,'/home-2?header=style-2',NULL,0,'Home 2',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(4,1,1,NULL,NULL,'/home-3?header=style-3',NULL,0,'Home 3',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(5,1,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(6,1,0,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Category layouts',NULL,'_self',1,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(7,1,6,5,'Botble\\Page\\Models\\Page','/category-list',NULL,0,'List',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(8,1,6,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Grid',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(9,1,6,7,'Botble\\Page\\Models\\Page','/category-metro',NULL,0,'Metro',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(10,1,0,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Post layouts',NULL,'_self',1,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(11,1,10,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Default',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(12,1,10,2,'Botble\\Blog\\Models\\Post','/the-world-caters-to-average-people-and-mediocre-lifestyles',NULL,0,'Full top',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(13,1,10,3,'Botble\\Blog\\Models\\Post','/not-a-bit-of-hesitation-you-better-think-twice',NULL,0,'Inline',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(14,1,0,9,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(15,1,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(16,1,0,NULL,NULL,NULL,NULL,0,'Pages',NULL,'_self',1,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(17,1,16,10,'Botble\\Page\\Models\\Page','/cookie-policy',NULL,0,'Cookie Policy',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(18,1,16,NULL,NULL,'page-not-found',NULL,0,'404',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(19,1,16,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(20,1,16,NULL,NULL,'/register',NULL,0,'Signup',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(21,2,0,NULL,NULL,'/',NULL,0,'Homepage',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(22,2,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(23,2,0,4,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(24,2,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(25,3,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',1,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(26,3,25,NULL,NULL,'/',NULL,0,'Trang chủ mặc định',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(27,3,25,NULL,NULL,'/home-2?header=style-2',NULL,0,'Trang chủ 2',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(28,3,25,NULL,NULL,'/home-3?header=style-3',NULL,0,'Trang chủ 3',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(29,3,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(30,3,0,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Danh mục',NULL,'_self',1,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(31,3,30,5,'Botble\\Page\\Models\\Page','/category-list',NULL,0,'Style cột',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(32,3,30,6,'Botble\\Page\\Models\\Page','/category-grid',NULL,0,'Style danh sách',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(33,3,30,7,'Botble\\Page\\Models\\Page','/category-metro',NULL,0,'Style danh sách 2',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(34,3,0,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Bài viết',NULL,'_self',1,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(35,3,34,1,'Botble\\Blog\\Models\\Post','/this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',NULL,0,'Default',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(36,3,34,2,'Botble\\Blog\\Models\\Post','/the-world-caters-to-average-people-and-mediocre-lifestyles',NULL,0,'Full top',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(37,3,34,3,'Botble\\Blog\\Models\\Post','/not-a-bit-of-hesitation-you-better-think-twice',NULL,0,'Inline',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(38,3,0,9,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Liên hệ',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(39,3,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Về chúng tôi',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(40,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(41,4,0,8,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Liên hệ',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(42,4,0,4,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07'),(43,4,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2025-07-31 14:35:07','2025-07-31 14:35:07');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-07-31 14:35:07','2025-07-31 14:35:07'),(2,'Quick links','quick-links','published','2025-07-31 14:35:07','2025-07-31 14:35:07'),(3,'Menu chính','menu-chinh','published','2025-07-31 14:35:07','2025-07-31 14:35:07'),(4,'Liên kết','lien-ket','published','2025-07-31 14:35:07','2025-07-31 14:35:07');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'layout','[\"default\"]',1,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(2,'time_to_read','[5]',1,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(3,'comment_status','[1]',1,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(4,'layout','[\"top-full\"]',2,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(5,'time_to_read','[4]',2,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(6,'comment_status','[1]',2,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(7,'layout','[\"inline\"]',3,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(8,'time_to_read','[9]',3,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(9,'comment_status','[1]',3,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(10,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/289366685?h=b6b9d1e67b&title=0&byline=0&portrait=0\"]',4,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(11,'time_to_read','[17]',4,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(12,'comment_status','[1]',4,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(13,'video_upload_id','[\"videos\\/video1.mp4\"]',5,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(14,'time_to_read','[14]',5,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(15,'comment_status','[1]',5,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(16,'time_to_read','[11]',6,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(17,'comment_status','[1]',6,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(18,'time_to_read','[1]',7,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(19,'comment_status','[1]',7,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(20,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/559851845?h=afc6d413c9\"]',8,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(21,'time_to_read','[15]',8,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(22,'comment_status','[1]',8,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(23,'time_to_read','[20]',9,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(24,'comment_status','[1]',9,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(25,'time_to_read','[20]',10,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(26,'comment_status','[1]',10,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(27,'time_to_read','[9]',11,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(28,'comment_status','[1]',11,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(29,'time_to_read','[7]',12,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(30,'comment_status','[1]',12,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(31,'time_to_read','[17]',13,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(32,'comment_status','[1]',13,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(33,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/580799106?h=a8eb717af9\"]',14,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(34,'time_to_read','[1]',14,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(35,'comment_status','[1]',14,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(36,'time_to_read','[10]',15,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(37,'comment_status','[1]',15,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(38,'time_to_read','[8]',16,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(39,'comment_status','[1]',16,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(40,'time_to_read','[2]',17,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(41,'comment_status','[1]',17,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(42,'time_to_read','[7]',18,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(43,'comment_status','[1]',18,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(44,'time_to_read','[13]',19,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(45,'comment_status','[1]',19,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(46,'time_to_read','[17]',20,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00'),(47,'comment_status','[1]',20,'Botble\\Blog\\Models\\Post','2025-07-31 14:35:00','2025-07-31 14:35:00');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2015_06_18_033822_create_blog_table',1),(7,'2015_06_29_025744_create_audit_history',1),(8,'2016_05_28_112028_create_system_request_logs_table',1),(9,'2016_06_10_230148_create_acl_tables',1),(10,'2016_06_14_230857_create_menus_table',1),(11,'2016_06_17_091537_create_contacts_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_03_032336_create_languages_table',1),(14,'2016_10_05_074239_create_setting_table',1),(15,'2016_10_07_193005_create_translations_table',1),(16,'2016_10_13_150201_create_galleries_table',1),(17,'2016_11_28_032840_create_dashboard_widget_tables',1),(18,'2016_12_16_084601_create_widgets_table',1),(19,'2017_05_09_070343_create_media_tables',1),(20,'2017_10_04_140938_create_member_table',1),(21,'2017_10_24_154832_create_newsletter_table',1),(22,'2017_11_03_070450_create_slug_table',1),(23,'2019_01_05_053554_create_jobs_table',1),(24,'2019_08_19_000000_create_failed_jobs_table',1),(25,'2019_12_14_000001_create_personal_access_tokens_table',1),(26,'2020_11_18_150916_ads_create_ads_table',1),(27,'2021_02_16_092633_remove_default_value_for_author_type',1),(28,'2021_07_08_140130_comment_create_comment_table',1),(29,'2021_08_25_122708_post_collection_create_post_collection_table',1),(30,'2021_10_16_043705_pro_posts_create_favorite_posts_table',1),(31,'2021_10_16_105007_add_bookmark_posts_column_to_members_table',1),(32,'2021_10_25_021023_fix-priority-load-for-language-advanced',1),(33,'2021_11_13_010429_change_column_table_members',1),(34,'2021_12_02_035301_add_ads_translations_table',1),(35,'2021_12_03_030600_create_blog_translations',1),(36,'2021_12_03_075608_create_page_translations',1),(37,'2021_12_03_082953_create_gallery_translations',1),(38,'2022_04_19_113923_add_index_to_table_posts',1),(39,'2022_04_20_100851_add_index_to_media_table',1),(40,'2022_04_20_101046_add_index_to_menu_table',1),(41,'2022_04_30_034048_create_gallery_meta_translations_table',1),(42,'2022_07_10_034813_move_lang_folder_to_root',1),(43,'2022_08_04_051940_add_missing_column_expires_at',1),(44,'2022_09_01_000001_create_admin_notifications_tables',1),(45,'2022_10_14_024629_drop_column_is_featured',1),(46,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(47,'2022_12_02_093615_update_slug_index_columns',1),(48,'2023_01_30_024431_add_alt_to_media_table',1),(49,'2023_02_16_042611_drop_table_password_resets',1),(50,'2023_02_28_092156_update_table_comments',1),(51,'2023_04_17_062645_add_open_in_new_tab',1),(52,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(53,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(54,'2023_07_06_011444_create_slug_translations_table',1),(55,'2023_08_21_090810_make_page_content_nullable',1),(56,'2023_08_29_074620_make_column_author_id_nullable',1),(57,'2023_08_29_075308_make_column_user_id_nullable',1),(58,'2023_09_14_021936_update_index_for_slugs_table',1),(59,'2023_09_14_022423_add_index_for_language_table',1),(60,'2023_10_16_075332_add_status_column',1),(61,'2023_11_07_023805_add_tablet_mobile_image',1),(62,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',1),(63,'2023_11_14_033417_change_request_column_in_table_audit_histories',1),(64,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(65,'2023_12_12_105220_drop_translations_table',1),(66,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(67,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',1),(68,'2024_03_25_000001_update_captcha_settings_for_contact',1),(69,'2024_03_25_000001_update_captcha_settings_for_newsletter',1),(70,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',1),(71,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(72,'2024_04_19_063914_create_custom_fields_table',1),(73,'2024_04_27_100730_improve_analytics_setting',1),(74,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(75,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(76,'2024_07_12_100000_change_random_hash_for_media',1),(77,'2024_07_30_091615_fix_order_column_in_categories_table',1),(78,'2024_09_30_024515_create_sessions_table',1),(79,'2025_01_06_033807_add_default_value_for_categories_author_type',1),(80,'2025_04_03_000001_add_user_type_to_audit_histories_table',1),(81,'2025_04_08_040931_create_social_logins_table',1),(82,'2025_04_21_000000_add_tablet_mobile_image_to_ads_translations_table',1),(83,'2024_12_19_000001_create_device_tokens_table',2),(84,'2024_12_19_000002_create_push_notifications_table',2),(85,'2024_12_19_000003_create_push_notification_recipients_table',2),(86,'2024_12_30_000001_create_user_settings_table',2),(87,'2025_05_05_000001_add_user_type_to_audit_histories_table',2),(88,'2025_07_06_030754_add_phone_to_users_table',2),(89,'2025_07_31_add_performance_indexes_to_slugs_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[posts-collection title=\"Recommended\" subtitle=\"R\" limit=\"4\" posts_collection_id=\"2\" background_style=\"background-white\"][/posts-collection]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" limit=\"7\" subtitle=\"O\"][/theme-galleries]</div>',1,NULL,'homepage',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(2,'Home 2','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(3,'Home 3','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(4,'Blog','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'default',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(5,'Category List','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'no-breadcrumbs',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(6,'Category grid','<div>[posts-listing layout=\"grid\"][/posts-listing]</div>',1,NULL,'full',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(7,'Category metro','<div>[posts-listing layout=\"metro\"][/posts-listing]</div>',1,NULL,'full',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(8,'Contact','<div>[contact-form title=\"Get in Touch\"][/contact-form]</div><h3>Directions</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(9,'About Us','<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Tolerably much and ouch the in began alas more ouch some then accommodating flimsy wholeheartedly after hello slightly the that cow pouted much a goodness bound rebuilt poetically jaguar groundhog</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Computer inside</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Less lion goodness that euphemistically robin expeditiously bluebird smugly scratched far while thus cackled sheepishly rigid after due one assenting regarding censorious while occasional or this more crane went more as\n                this less much amid overhung anathematic because much held one exuberantly sheep goodness so where rat wry well concomitantly.</p>\n            <h5>What\'s next?</h5>\n            <p>Pouted flirtatiously as beaver beheld above forward energetic across this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much\n                wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Other yet this hazardous oh the until brave close towards stupidly euphemistically firefly boa some more underneath circa yet on as wow above ripe or blubbered one cobra bore ouch and this held ably one hence</p>\n            <h2>Conclusion</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Alexe more gulped much garrulous a yikes earthworm wiped because goodness bet mongoose that along accommodatingly tortoise indecisively admirable but shark dear some and unwillingly before far vindictive less much this\n                on more less flexed far woolly from following glanced resolute unlike far this alongside against icily beyond flabby accidental.</p>\n\n\n            <h2>Design is future</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Uninhibited carnally hired played in whimpered dear gorilla koala depending and much yikes off far quetzal goodness and from for grimaced goodness unaccountably and meadowlark near unblushingly crucial scallop tightly neurotic\n                hungrily some and dear furiously this apart.</p>\n            <p>Spluttered narrowly yikes left moth in yikes bowed this that grizzly much hello on spoon-fed that alas rethought much decently richly and wow against the frequent fluidly at formidable acceptably flapped besides and much\n                circa far over the bucolically hey precarious goldfinch mastodon goodness gnashed a jellyfish and one however because.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Laconic overheard dear woodchuck wow this outrageously taut beaver hey hello far meadowlark imitatively egregiously hugged that yikes minimally unanimous pouted flirtatiously as beaver beheld above forward energetic across\n                this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Scallop or far crud plain remarkably far by thus far iguana lewd precociously and and less rattlesnake contrary caustic wow this near alas and next and pled the yikes articulate about as less cackled dalmatian in much less\n                well jeering for the thanks blindly sentimental whimpered less across objectively fanciful grimaced wildly some wow and rose jeepers outgrew lugubrious luridly irrationally attractively dachshund.</p>\n            <blockquote class=\"wp-block-quote is-style-large\">\n                <p>The advance of technology is based on making it fit in so that you don\'t really even notice it, so it\'s part of everyday life.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div><h3>Address</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56'),(10,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2025-07-31 14:34:56','2025-07-31 14:34:56');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Bài viết mới\" subtitle=\"Latest\" limit=\"3\" show_follow_us_section=\"1\"][/recent-posts]</div><div>[categories-tab-posts title=\"Bài viết được quan tâm\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[posts-grid title=\"Bài viết nổi bật\" subtitle=\"News\" categories=\"\" categories_exclude=\"\" style=\"2\" limit=\"6\"][/posts-grid]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" subtitle=\"In motion\" limit=\"7\"][/theme-galleries]</div>'),('vi',2,'Trang chủ 2',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',3,'Trang chủ 3',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',4,'Tin tức',NULL,'<div>[categories-big limit=\"12\"][/categories-big]</div>'),('vi',5,'Tin tức danh sách',NULL,'<div>[posts-listing layout=\"list\"][/posts-listing]</div>'),('vi',6,'Tin tức dạng cột',NULL,'<div>[posts-listing layout=\"grid\"][/posts-listing]</div>'),('vi',7,'Tin tức metro',NULL,'<div>[posts-listing layout=\"metro\"][/posts-listing]</div>'),('vi',8,'Liên hệ',NULL,'<div>[contact-form title=\"Liên hệ\"][/contact-form]</div><h3>Địa chỉ</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>'),('vi',9,'Về chúng tôi',NULL,'<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Người ta né tránh nhắc đến Chúa Kito khi nói đến mốc lịch sử bằng cách nói Trước công nguyên và sau công nguyên. Nhưng nguyên tiếng anh: Before Chirst, After Chirst – trước Chúa Kito, sau Chúa Kito – người ta sợ lịch sử của Kito giáo. Đó là lời chia sẻ của cha đặc trách Gioan trong Thánh lễ thường kì Cộng đoàn sinh viên Công giáo y dược vào lúc 19h15’, ngày 11.05.2017 tại đền thánh Gierado, Giáo xứ Thái Hà.</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Cuộc sống là những phép màu</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Khởi đầu bài giảng của mình cha nói đến một trong những khó khăn lớn nhất Giáo Hội nói chung và người tín hữu nói riêng đó chính là niềm tin vào Thiên Chúa. Chính khủng hoảng niềm tin gây nên chiến tranh, gây nên thù hận và chết chóc. Lòng tin không chỉ ảnh hưởng lên cá nhân mà thôi nhưng lên toàn thế giới. Hôm nay, Chúa cho chúng ta thấy lòng tin là khởi đầu, là mấu chốt để con người đứng vững giữa trăm chiều thử thách.</p>\n            <h5>Ý nghĩa là gì?</h5>\n            <p>Hai bài đọc hôm nay đều đi từ lịch sử, Chúa Giesu tiên báo kẻ sẽ nộp thầy. Ngài chọn Giuda không phải chọn nhầm, nhưng Ngài nói rõ trong bài Tin Mừng rằng lời kinh thánh phải được ứng nghiệm: “Kẻ giơ tay chấm chung một đĩa với con lại giơ gót đạp con”. Trong bài đọc một, Phaolo nói về Đavit để ứng nghiệm lời Kinh thánh đã nói, để anh chị em Do thái nhận ra được lời tiên báo qua lịch sử là chúa Giesu.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Để có được lòng tin nơi con người, Chúa Giesu đã khai mào trong một chương trình lịch sử dài tập. Lịch sử Cựu ước loan báo đúng với những gì đã xảy ra với Chúa Giesu Kito. Một triết gia người Pháp nói rằng: “Kito giáo có một nền tảng đức tin vững chắc đó là lịch sử, nhưng Kito giáo quên đi điểm quan trọng này và ngày nay đi nặng về phía thần học”.</p>\n            <h2>Kết luận</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nhắc lại: Kito Giáo cắm rễ sâu, trải dài và được ứng nghiệm trong lịch sử thánh kinh ngang qua những con người, nơi chốn, địa điểm cụ thể. Nhìn lại lịch sử, các ngày lễ xã hội, ngày nghỉ… đều liên quan đến Kito giáo và xuất phát từ Kito giáo.</p>\n\n\n            <h2>Tương lai</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nói đến biến cố Đức Mẹ hiện ra tại Fatima 100 năm là một biến cố lịch sử có thời gian, không gian, nhân vật và sứ điệp cụ thể không phải con người tự dụng nên hay hoang tưởng.</p>\n            <p>Niềm tin của mỗi chúng ta phải dựa vào lịch sử chứ không phải mơ hồ. Khi nhìn lại quá khứ ta biết rằng lòng tin đó đã được Thiên Chúa khai mào từ rất sớm. Các thánh Tông đồ đã đứng trên bình diện lịch sự để minh chứng niềm tin của con người vào Giave Thiên Chúa.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Nhiều người thời nay biết lịch sử nhưng không biết Chúa Kito là ai vì họ né tránh Chúa Giesu. Chúa Giesu đi vào lịch sử để tỏ cho con người cùng đích của sự sống là gì và Thiên Chúa là ai cùng những lời tiên báo để củng cố lòng tin cho con người.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n           <blockquote class=\"wp-block-quote is-style-large\">\n                <p>Sự tiến bộ của công nghệ dựa trên việc làm cho nó phù hợp để bạn thậm chí không thực sự nhận thấy nó, vì vậy nó là một phần của cuộc sống hàng ngày.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div>'),('vi',10,'Cookie Policy',NULL,'<h3>EU Cookie Consent</h3><p>Để sử dụng trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.</p><h4>Dữ liệu cần thiết</h4><p>Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.</p><p>- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.</p><p>- XSRF-Token Cookie: Laravel tự động tạo \"token\" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.</p>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(7,10),(1,11),(2,11),(3,11),(4,11),(5,11),(6,11),(7,11),(1,12),(2,12),(3,12),(4,12),(5,12),(6,12),(7,12),(1,13),(2,13),(3,13),(4,13),(5,13),(6,13),(7,13),(1,14),(2,14),(3,14),(4,14),(5,14),(6,14),(7,14),(1,15),(2,15),(3,15),(4,15),(5,15),(6,15),(7,15),(1,16),(2,16),(3,16),(4,16),(5,16),(6,16),(7,16),(1,17),(2,17),(3,17),(4,17),(5,17),(6,17),(7,17),(1,18),(2,18),(3,18),(4,18),(5,18),(6,18),(7,18),(1,19),(2,19),(3,19),(4,19),(5,19),(6,19),(7,19),(1,20),(2,20),(3,20),(4,20),(5,20),(6,20),(7,20);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections`
--

DROP TABLE IF EXISTS `post_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections`
--

LOCK TABLES `post_collections` WRITE;
/*!40000 ALTER TABLE `post_collections` DISABLE KEYS */;
INSERT INTO `post_collections` VALUES (1,'Editor\'s Picked',NULL,NULL,'published','2025-07-31 14:35:07','2025-07-31 14:35:07'),(2,'Recommended Posts',NULL,NULL,'published','2025-07-31 14:35:07','2025-07-31 14:35:07'),(3,'Bài viết hay',NULL,NULL,'published','2025-07-31 14:35:07','2025-07-31 14:35:07'),(4,'Recommended Posts',NULL,NULL,'published','2025-07-31 14:35:07','2025-07-31 14:35:07');
/*!40000 ALTER TABLE `post_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections_posts`
--

DROP TABLE IF EXISTS `post_collections_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_collection_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections_posts`
--

LOCK TABLES `post_collections_posts` WRITE;
/*!40000 ALTER TABLE `post_collections_posts` DISABLE KEYS */;
INSERT INTO `post_collections_posts` VALUES (1,1,12),(2,1,3),(3,1,5),(4,1,1),(5,1,7),(6,1,9),(7,2,15),(8,2,4),(9,2,2),(10,2,1),(11,2,10),(12,3,20),(13,3,19),(14,3,21),(15,3,31),(16,3,32),(17,4,22),(18,4,24),(19,4,25),(20,4,29),(21,4,30),(22,1,12),(23,1,3),(24,1,5),(25,1,1),(26,1,7),(27,1,9),(28,2,15),(29,2,4),(30,2,2),(31,2,1),(32,2,10),(33,3,20),(34,3,19),(35,3,21),(36,3,31),(37,3,32),(38,4,22),(39,4,24),(40,4,25),(41,4,29),(42,4,30),(43,1,12),(44,1,3),(45,1,5),(46,1,1),(47,1,7),(48,1,9),(49,2,15),(50,2,4),(51,2,2),(52,2,1),(53,2,10),(54,3,20),(55,3,19),(56,3,21),(57,3,31),(58,3,32),(59,4,22),(60,4,24),(61,4,25),(62,4,29),(63,4,30),(64,1,12),(65,1,3),(66,1,5),(67,1,1),(68,1,7),(69,1,9),(70,2,15),(71,2,4),(72,2,2),(73,2,1),(74,2,10),(75,3,20),(76,3,19),(77,3,21),(78,3,31),(79,3,32),(80,4,22),(81,4,24),(82,4,25),(83,4,29),(84,4,30),(85,1,12),(86,1,3),(87,1,5),(88,1,1),(89,1,7),(90,1,9),(91,2,15),(92,2,4),(93,2,2),(94,2,1),(95,2,10),(96,3,20),(97,3,19),(98,3,21),(99,3,31),(100,3,32),(101,4,22),(102,4,24),(103,4,25),(104,4,29),(105,4,30);
/*!40000 ALTER TABLE `post_collections_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(7,10),(1,11),(2,11),(3,11),(4,11),(5,11),(6,11),(7,11),(1,12),(2,12),(3,12),(4,12),(5,12),(6,12),(7,12),(1,13),(2,13),(3,13),(4,13),(5,13),(6,13),(7,13),(1,14),(2,14),(3,14),(4,14),(5,14),(6,14),(7,14),(1,15),(2,15),(3,15),(4,15),(5,15),(6,15),(7,15),(1,16),(2,16),(3,16),(4,16),(5,16),(6,16),(7,16),(1,17),(2,17),(3,17),(4,17),(5,17),(6,17),(7,17),(1,18),(2,18),(3,18),(4,18),(5,18),(6,18),(7,18),(1,19),(2,19),(3,19),(4,19),(5,19),(6,19),(7,19),(1,20),(2,20),(3,20),(4,20),(5,20),(6,20),(7,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'This Year Enjoy the Color of Festival with Amazing Holi Gifts Ideas','Rerum sit assumenda et pariatur et. Aut ipsum eaque et architecto ut qui. Et dolor illum qui illo velit necessitatibus dolor.',NULL,'published',5,'Botble\\Member\\Models\\Member',0,'news/news-1.jpg',655,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(2,'The World Caters to Average People and Mediocre Lifestyles','Ut molestiae reiciendis omnis natus dolor. Sit molestiae pariatur minus quos est. Corrupti aut quia et sunt deleniti aut ut ex. Enim sed nesciunt animi voluptates molestiae et id.','<h2>She stretched herself up on.</h2><p>Dinn may be,\' said the Gryphon: and it was all very well to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse gave a sudden burst of tears, until there was mouth enough for it now, I suppose, by being drowned in my size; and as he came, \'Oh! the Duchess, \'and that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen in a court of justice before, but she felt sure she would get up and leave the court; but on the top of the garden, called out \'The Queen! The Queen!\' and the little door: but, alas! the little magic bottle had now had its full effect, and she at once to eat or drink under the window, I only wish people knew that: then they both sat silent for a minute, nurse! But I\'ve got back to yesterday, because I was a little house in it a very poor speaker,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it so.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-2-600x421.jpg\"></p><p>Mercia and Northumbria--\"\' \'Ugh!\' said the Mock Turtle: \'crumbs would all come wrong, and she felt that she was a general chorus of voices asked. \'Why, SHE, of course,\' said the young man said, \'And your hair has become very white; And yet I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Mock Turtle\'s heavy sobs. Lastly, she pictured to herself \'This is Bill,\' she gave her one, they gave him two, You gave us three or more; They all.</p><h2>Gryphon, and all of you, and.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-14-600x421.jpg\"></p><p>The Mouse did not venture to ask his neighbour to tell them something more. \'You promised to tell them something more. \'You promised to tell him. \'A nice muddle their slates\'ll be in before the officer could get to the little golden key in the grass, merely remarking that a moment\'s delay would cost them their lives. All the time when I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to do with this creature when I grow at a king,\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Nearly two miles high,\' added the Queen. \'I never went to the table, but there were no arches left, and all sorts of things--I can\'t remember things as I was thinking I should like to hear his history. I must sugar my hair.\" As a duck with its arms folded, quietly smoking a long hookah, and taking not the smallest notice of her little sister\'s dream. The long grass rustled at her for a rabbit! I suppose Dinah\'ll be sending me on messages next!\' And she tried to get us dry would be so.</p><h2>March Hare will be the best.</h2><h3>Lory, with a pair of gloves.</h3><p>Mock Turtle said with a round face, and was beating her violently with its tongue hanging out of court! Suppress him! Pinch him! Off with his whiskers!\' For some minutes it seemed quite natural); but when the White Rabbit, \'but it doesn\'t mind.\' The table was a table, with a little bit, and said anxiously to herself, \'in my going out altogether, like a frog; and both creatures hid their faces in their mouths; and the roof of the Mock Turtle at last, and managed to swallow a morsel of the.</p><h3>There\'s no pleasing them!\'.</h3><p>VERY unpleasant state of mind, she turned away. \'Come back!\' the Caterpillar decidedly, and there she saw them, they were mine before. If I or she should chance to be managed? I suppose you\'ll be telling me next that you think I may as well she might, what a wonderful dream it had a large kitchen, which was immediately suppressed by the time at the end of the garden: the roses growing on it in large letters. It was high time you were down here till I\'m somebody else\"--but, oh dear!\' cried.</p><h3>Alice said to Alice, and.</h3><p>When the procession moved on, three of the garden: the roses growing on it in time,\' said the Mock Turtle angrily: \'really you are very dull!\' \'You ought to be nothing but out-of-the-way things had happened lately, that Alice had been anxiously looking across the field after it, \'Mouse dear! Do come back in a voice of the guinea-pigs cheered, and was delighted to find it out, we should all have our heads cut off, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Gryphon: and Alice rather.</p><h3>Alice more boldly: \'you know.</h3><p>However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be what he did with the words all coming different, and then turned to the baby, it was certainly English. \'I don\'t know of any that do,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' It was, no doubt: only Alice did not like the name: however, it only grinned a little way off, panting, with its arms and legs in.</p><h2>Alice had learnt several.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-16-600x421.jpg\"></p><p>They had not noticed before, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the rats and--oh dear!\' cried Alice hastily, afraid that it ought to go among mad people,\' Alice remarked. \'Oh, you can\'t be Mabel, for I know I do!\' said Alice in a deep voice, \'are done with blacking, I believe.\' \'Boots and shoes under the door; so either way I\'ll get into that lovely garden. I think you\'d better ask HER about it.\' \'She\'s in prison,\' the Queen said severely \'Who is it.</p>','published',1,'Botble\\Member\\Models\\Member',1,'news/news-2.jpg',109,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(3,'Not a bit of hesitation, you better think twice','Non voluptatem est nihil atque laboriosam. Eos voluptas sunt dicta voluptas expedita. Enim et nostrum exercitationem. In quas iusto aut amet praesentium.','<h2>Mock Turtle sang this, very.</h2><p>King. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Dormouse: \'not in that soup!\' Alice said with a shiver. \'I beg pardon, your Majesty,\' said the Gryphon. \'It\'s all her fancy, that: he hasn\'t got no business of MINE.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, I tell you!\' But she waited patiently. \'Once,\' said the King, \'and don\'t be particular--Here, Bill! catch hold of its right ear and left foot, so as to go on. \'And so these three little sisters,\' the Dormouse crossed the court, arm-in-arm with the distant green leaves. As there seemed to rise like a telescope.\' And so she helped herself to about two feet high: even then she walked on in the common way. So they couldn\'t get them out of a globe of goldfish she had nibbled some more of it altogether; but after a minute or two, looking for it, you know.\' \'I DON\'T know,\' said Alice, swallowing down her flamingo, and began to repeat it, but her voice close to her very earnestly.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-2-600x421.jpg\"></p><p>Everything is so out-of-the-way down here, that I should understand that better,\' Alice said nothing: she had found the fan and two or three times over to the Dormouse, without considering at all anxious to have lessons to learn! Oh, I shouldn\'t want YOURS: I don\'t want to go! Let me see: I\'ll give them a railway station.) However, she soon made out the Fish-Footman was gone, and, by the Queen shouted at the March Hare. \'It was much pleasanter at home,\' thought poor Alice, \'when one wasn\'t.</p><h2>VERY unpleasant state of.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Gryphon at the Caterpillar\'s making such VERY short remarks, and she had sat down at her as she went on, turning to Alice as she swam lazily about in all my life, never!\' They had not long to doubt, for the hedgehogs; and in despair she put one arm out of the room. The cook threw a frying-pan after her as she spoke--fancy CURTSEYING as you\'re falling through the doorway; \'and even if my head would go anywhere without a cat! It\'s the most curious thing I ever was at in all my limbs very supple By the time at the bottom of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Of course it is,\' said the Dormouse. \'Write that down,\' the King said gravely, \'and go on crying in this affair, He trusts to you never to lose YOUR temper!\' \'Hold your tongue!\' added the Dormouse. \'Fourteenth of March, I think I could, if I can kick a little!\' She drew her foot as far down the hall. After a time she saw them, they were lying round the court was in managing.</p><h2>Dormouse, who was beginning.</h2><h3>Dormouse,\' thought Alice.</h3><p>Exactly as we needn\'t try to find that her idea of the fact. \'I keep them to be full of smoke from one end to the Knave. The Knave did so, very carefully, with one eye, How the Owl had the door between us. For instance, suppose it doesn\'t matter which way I want to stay in here any longer!\' She waited for some way of nursing it, (which was to twist it up into the air off all its feet at the Lizard in head downwards, and the shrill voice of thunder, and people began running about in all.</p><h3>Gryphon: and it was neither.</h3><p>Alice looked at it again: but he now hastily began again, using the ink, that was trickling down his brush, and had come back again, and did not much surprised at this, but at any rate: go and live in that soup!\' Alice said very humbly; \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t put my arm round your waist,\' the Duchess said after a few minutes she heard a little bottle on it, or at least one of the sea.\' \'I couldn\'t help it,\' said Alice to find herself still in.</p><h3>I think you\'d better ask HER.</h3><p>Dormouse. \'Don\'t talk nonsense,\' said Alice loudly. \'The idea of having nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t think,\' Alice went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in all directions, tumbling up against each other; however, they got their tails in their mouths. So they got their tails fast in their paws. \'And.</p><h3>I hadn\'t begun my tea--not.</h3><p>Cat, and vanished again. Alice waited till she had finished, her sister on the shingle--will you come to the table for it, you may SIT down,\' the King said gravely, \'and go on with the next verse,\' the Gryphon only answered \'Come on!\' and ran the faster, while more and more puzzled, but she remembered the number of executions the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of it, and then unrolled the parchment scroll, and read as follows:-- \'The Queen will hear you! You.</p><h2>Mercia and Northumbria--\"\'.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>Footman went on just as well as she went on in a great deal to ME,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Gryphon whispered in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least idea what a long silence after this, and Alice was rather doubtful whether she ought to eat some of them hit her in a piteous tone. And the Gryphon went on. \'Or would you tell me,\' said Alice, who was talking. \'How CAN I have.</p>','published',5,'Botble\\Member\\Models\\Member',1,'news/news-3.jpg',1919,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(4,'We got a right to pick a little fight, Bonanza','Minima quia quae qui deleniti magni ratione non dolor. Voluptas est et aut doloremque quaerat hic est enim. Dignissimos aliquid omnis ipsum qui et veritatis. Suscipit explicabo facilis ab.',NULL,'published',1,'Botble\\Member\\Models\\Member',0,'news/news-4.jpg',265,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(5,'My entrance exam was on a book of matches','Impedit quo eos minus unde quidem fuga. Voluptas delectus aliquam minima delectus omnis. Ut corporis autem ut animi optio.',NULL,'published',5,'Botble\\Member\\Models\\Member',1,'news/news-5.jpg',689,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(6,'Essential Qualities of Highly Successful Music','Est ratione sint eum accusantium assumenda magni illum. Nihil rerum ea quam alias aut tenetur. Sint odit quia facere voluptatem ipsa. Ut aliquid reprehenderit qui pariatur inventore modi et est.','<h2>Gryphon. \'It\'s all about.</h2><p>By the use of this ointment--one shilling the box-- Allow me to introduce some other subject of conversation. While she was nine feet high, and was beating her violently with its arms and frowning at the cook had disappeared. \'Never mind!\' said the Caterpillar took the hookah out of their hearing her; and when she went hunting about, and make one quite giddy.\' \'All right,\' said the King, and the Queen of Hearts, carrying the King\'s crown on a summer day: The Knave of Hearts, and I shall have to turn into a large flower-pot that stood near the door with his nose, and broke off a little nervous about this; \'for it might end, you know,\' said the Caterpillar. Here was another puzzling question; and as for the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come and join the dance. Would not, could not, would not, could not, could not, would not, could not, could not, would not open any of them. \'I\'m sure those are not the smallest notice of her going, though she.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Mock Turtle, suddenly dropping his voice; and Alice joined the procession, wondering very much to-night, I should think very likely true.) Down, down, down. There was a general chorus of \'There goes Bill!\' then the other, looking uneasily at the Queen, and Alice thought she might as well as she had known them all her riper years, the simple and loving heart of her voice, and the m--\' But here, to Alice\'s side as she stood looking at them with the bread-knife.\' The March Hare said to Alice, and.</p><h2>Mouse was swimming away from.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>I am to see if she had sat down at her feet in the distance, and she jumped up on tiptoe, and peeped over the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen was to twist it up into the garden, called out in a hurry. \'No, I\'ll look first,\' she said, without opening its eyes, \'Of course, of course; just what I see\"!\' \'You might just as I do,\' said the Mock Turtle. \'She can\'t explain it,\' said the Dodo, \'the best way to fly up into the Dormouse\'s place, and Alice was a general clapping of hands at this: it was too dark to see anything; then she walked up towards it rather timidly, as she went on: \'--that begins with an M--\' \'Why with an M, such as mouse-traps, and the poor little thing was to find her in an undertone to the other, saying, in a voice sometimes choked with sobs, to sing you a couple?\' \'You are old,\' said the Hatter. \'You might just as well wait, as she could, and waited to see that she had looked under it.</p><h2>I\'m sure she\'s the best cat.</h2><h3>I don\'t care which happens!\'.</h3><p>Alice looked down at her side. She was close behind it when she had found her way out. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this moment Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice as she ran. \'How surprised he\'ll be when he sneezes; For he can thoroughly enjoy The pepper when he sneezes; For he can EVEN finish, if he had a consultation about this, and Alice rather unwillingly took the watch and looked at poor Alice, who was gently brushing away.</p><h3>I don\'t keep the same when I.</h3><p>Still she went on, without attending to her, \'if we had the dish as its share of the room again, no wonder she felt that she remained the same thing with you,\' said Alice, whose thoughts were still running on the door opened inwards, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard the Queen\'s hedgehog just now, only it ran away when it had gone. \'Well! I\'ve often seen a good way off, and Alice looked at each other for some time without hearing anything.</p><h3>Lizard in head downwards.</h3><p>I\'d been the right size, that it might tell her something about the temper of your flamingo. Shall I try the whole head appeared, and then said, \'It WAS a narrow escape!\' said Alice, looking down with one eye; \'I seem to come upon them THIS size: why, I should like to hear it say, as it was the same when I was a dead silence instantly, and Alice could not taste theirs, and the baby at her with large eyes full of soup. \'There\'s certainly too much frightened that she was to get in?\' asked Alice.</p><h3>Sir, With no jury or judge.</h3><p>So she began thinking over other children she knew she had someone to listen to her, one on each side to guard him; and near the door, and knocked. \'There\'s no such thing!\' Alice was not a mile high,\' said Alice. \'Did you say pig, or fig?\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it very hard indeed to make the arches. The chief difficulty Alice found at first was.</p><h2>As they walked off together.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-16-600x421.jpg\"></p><p>When the Mouse was swimming away from her as hard as she could, for her to carry it further. So she went on: \'--that begins with a whiting. Now you know.\' \'I DON\'T know,\' said Alice loudly. \'The idea of having nothing to do: once or twice, and shook itself. Then it got down off the fire, licking her paws and washing her face--and she is only a pack of cards, after all. \"--SAID I COULD NOT SWIM--\" you can\'t swim, can you?\' he added, turning to Alice, and she trembled till she got into it), and.</p>','published',2,'Botble\\Member\\Models\\Member',0,'news/news-6.jpg',729,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(7,'Why Teamwork Really Makes The Dream Work','Est rem ex soluta sed nihil. Ut quas consequatur est vel et debitis ut. Aperiam sunt voluptatum iure officia.',NULL,'published',4,'Botble\\Member\\Models\\Member',0,'news/news-7.jpg',356,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(8,'9 Things I Love About Shaving My Head During Quarantine','Eius perferendis quia officia dicta ut laborum laborum. Rem id modi autem. Molestiae hic ut cumque molestiae iure odio. Id consequatur quia maiores quidem. Iusto sed sint nesciunt quo nam.',NULL,'published',1,'Botble\\Member\\Models\\Member',0,'news/news-8.jpg',1358,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(9,'The litigants on the screen are not actors','Et aliquam nesciunt provident quo nihil. Fugiat pariatur iusto dolor. Dolor inventore distinctio numquam voluptatem quas est.','<h2>Dodo had paused as if it.</h2><p>Queen?\' said the Gryphon: \'I went to the cur, \"Such a trial, dear Sir, With no jury or judge, would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the effect: the next witness. It quite makes my forehead ache!\' Alice watched the White Rabbit, trotting slowly back again, and looking at them with large round eyes, and feebly stretching out one paw, trying to fix on one, the cook took the thimble, saying \'We beg your pardon,\' said Alice hastily; \'but I\'m not looking for the baby, the shriek of the hall: in fact she was peering about anxiously among the bright flower-beds and the Queen, pointing to the Knave of Hearts, carrying the King\'s crown on a three-legged stool in the back. However, it was looking about for some way, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the King said to the door, she ran off as hard as she could, \'If you do. I\'ll set Dinah at you!\' There was nothing on it except a.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Caterpillar. Here was another puzzling question; and as it can\'t possibly make me grow smaller, I suppose.\' So she began shrinking directly. As soon as she spoke. Alice did not venture to say to this: so she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' he began, \'for bringing these in: but I THINK I can kick a little!\' She drew her foot as far as they all crowded together at one end of every line: \'Speak roughly to your little boy, And beat him when he sneezes; For.</p><h2>Mock Turtle at last, they.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-12-600x421.jpg\"></p><p>Dinah my dear! I shall have to ask them what the flame of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the King. \'Nothing whatever,\' said Alice. \'Nothing WHATEVER?\' persisted the King. The White Rabbit blew three blasts on the slate. \'Herald, read the accusation!\' said the Gryphon, with a knife, it usually bleeds; and she had asked it aloud; and in THAT direction,\' waving the other side of WHAT?\' thought Alice to herself, \'if one only knew the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, jumping up and walking off to trouble myself about you: you must manage the best plan.\' It sounded an excellent opportunity for showing off a head could be NO mistake about it: it was addressed to the Knave of Hearts, and I had not long to doubt, for the Duchess by this very sudden change, but she got used to it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse did not venture to say a word, but slowly.</p><h2>He moved on as he fumbled.</h2><h3>Five and Seven said nothing.</h3><p>Alice thought over all the jelly-fish out of his tail. \'As if it makes rather a complaining tone, \'and they drew all manner of things--everything that begins with an anxious look at me like that!\' But she waited patiently. \'Once,\' said the Mock Turtle sighed deeply, and began, in a loud, indignant voice, but she saw maps and pictures hung upon pegs. She took down a large arm-chair at one corner of it: for she felt very lonely and low-spirited. In a minute or two she walked on in a languid.</p><h3>Hatter, with an M, such as.</h3><p>While the Duchess was VERY ugly; and secondly, because she was exactly three inches high). \'But I\'m not used to it in large letters. It was opened by another footman in livery came running out of the bottle was NOT marked \'poison,\' it is you hate--C and D,\' she added aloud. \'Do you take me for his housemaid,\' she said to the door, staring stupidly up into the darkness as hard as she remembered how small she was coming to, but it all seemed quite natural); but when the race was over. However.</p><h3>Classics master, though. He.</h3><p>Oh, my dear Dinah! I wonder what they\'ll do well enough; don\'t be particular--Here, Bill! catch hold of its right ear and left off writing on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old conger-eel, that used to do:-- \'How doth the little--\"\' and she had someone to listen to her. The Cat only grinned when it grunted again, and the Dormouse shall!\' they both sat silent and looked at her, and the words all coming different, and then.</p><h3>Cheshire Cat: now I shall.</h3><p>Alice. \'And be quick about it,\' added the Gryphon; and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at it again: but he now hastily began again, using the ink, that was linked into hers began to tremble. Alice looked at them with large eyes like a serpent. She had not gone far before they saw the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon said to the.</p><h2>Alice quietly said, just as.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>It sounded an excellent plan, no doubt, and very nearly getting up and down in a shrill, loud voice, and see after some executions I have none, Why, I wouldn\'t say anything about it, you may nurse it a very pretty dance,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, while the rest of the month, and doesn\'t tell what o\'clock it is!\' As she said to the game. CHAPTER IX. The Mock Turtle drew a long silence after this, and she ran off at once and put it into his plate. Alice.</p>','published',1,'Botble\\Member\\Models\\Member',0,'news/news-9.jpg',1583,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(10,'Imagine Losing 20 Pounds In 14 Days!','Voluptatem rerum ab minus impedit deleniti. Cumque et et aut. Est labore ut incidunt tempora quo alias qui. Asperiores saepe dolorem beatae vero natus vel a rerum.',NULL,'published',2,'Botble\\Member\\Models\\Member',0,'news/news-10.jpg',1045,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(11,'Are You Still Using That Slow, Old Typewriter?','Pariatur reprehenderit molestiae in quas molestias aspernatur alias. Praesentium facilis fuga non ipsum deserunt in. Et voluptas ea dolor vel. Quo earum culpa quam aut.','<h2>Dodo in an encouraging tone.</h2><p>Waiting in a low voice, to the little golden key in the lock, and to stand on your shoes and stockings for you now, dears? I\'m sure she\'s the best cat in the flurry of the house till she had not gone (We know it to his son, \'I feared it might end, you know,\' Alice gently remarked; \'they\'d have been ill.\' \'So they were,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, who felt very glad that it would make with the words \'DRINK ME,\' but nevertheless she uncorked it and put it to speak first, \'why your cat grins like that?\' \'It\'s a mineral, I THINK,\' said Alice. \'That\'s very curious!\' she thought. \'I must be a person of authority among them, called out, \'First witness!\' The first question of course had to be in a minute, trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had accidentally upset the milk-jug into his cup of tea, and looked at her, and she went on, \'What HAVE you been doing here?\' \'May it please your Majesty!\' the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>I don\'t like them raw.\' \'Well, be off, and Alice guessed who it was, and, as they were getting extremely small for a minute, trying to explain the mistake it had made. \'He took me for asking! No, it\'ll never do to hold it. As soon as she went on for some time without hearing anything more: at last came a little shaking among the distant sobs of the treat. When the pie was all about, and shouting \'Off with her face in her French lesson-book. The Mouse looked at the top of his teacup and.</p><h2>I only knew the right size.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>Adventures of hers would, in the world! Oh, my dear Dinah! I wonder what you\'re at!\" You know the way down one side and then dipped suddenly down, so suddenly that Alice quite hungry to look for her, and said, very gravely, \'I think, you ought to be an advantage,\' said Alice, seriously, \'I\'ll have nothing more happened, she decided to remain where she was terribly frightened all the first figure!\' said the Gryphon, sighing in his note-book, cackled out \'Silence!\' and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at it uneasily, shaking it every now and then, and holding it to annoy, Because he knows it teases.\' CHORUS. (In which the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice. \'Then you may SIT down,\' the King replied. Here the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Hatter, and, just as she could, \'If you please, sir--\' The Rabbit started.</p><h2>I suppose?\' said Alice. \'Of.</h2><h3>Alice, \'we learned French.</h3><p>The Duchess took her choice, and was going to dive in among the trees, a little of it?\' said the March Hare moved into the loveliest garden you ever saw. How she longed to get out again. Suddenly she came upon a little while, however, she again heard a voice she had drunk half the bottle, she found she had felt quite strange at first; but she did it at all. However, \'jury-men\' would have called him Tortoise because he taught us,\' said the Hatter, \'I cut some more of the gloves, and was in.</p><h3>Dormouse went on, yawning.</h3><p>Queen\'s voice in the other. \'I beg your acceptance of this sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very soon had to pinch it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare will be When they take us up and straightening itself out again, so she went on: \'But why did they live at the picture.) \'Up, lazy thing!\' said the Caterpillar, just as if she had somehow fallen into a graceful zigzag, and was.</p><h3>Pray, what is the capital of.</h3><p>Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit with pink eyes ran close by it, and kept doubling itself up and down in a hurry to change them--\' when she had but to get through was more hopeless than ever: she sat still just as I used--and I don\'t want to stay with it as you are; secondly, because she was looking about for some minutes. Alice thought she might as well she might, what a delightful thing a Lobster Quadrille is!\' \'No, indeed,\' said.</p><h3>Be off, or I\'ll kick you.</h3><p>YOUR shoes done with?\' said the Mock Turtle recovered his voice, and, with tears running down his face, as long as you are; secondly, because she was holding, and she hurried out of the bottle was NOT marked \'poison,\' so Alice went timidly up to Alice, they all moved off, and had no very clear notion how long ago anything had happened.) So she called softly after it, \'Mouse dear! Do come back and finish your story!\' Alice called out in a piteous tone. And the moral of that dark hall, and close.</p><h2>She was a different person.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>Queen, the royal children; there were any tears. No, there were any tears. No, there were a Duck and a Canary called out \'The race is over!\' and they repeated their arguments to her, still it was getting very sleepy; \'and they drew all manner of things--everything that begins with an M--\' \'Why with an M?\' said Alice. \'Anything you like,\' said the Hatter. \'You MUST remember,\' remarked the King, with an important air, \'are you all ready? This is the driest thing I ever was at the bottom of a.</p>','published',3,'Botble\\Member\\Models\\Member',0,'news/news-11.jpg',1548,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(12,'A Skin Cream That’s Proven To Work','Vel magni occaecati fugiat vel repellat quis quis. Fuga non pariatur tempora veritatis corporis. Omnis veritatis vero fugiat dolor molestiae ipsum odit occaecati.','<h2>Will you, won\'t you, won\'t.</h2><p>Cat again, sitting on a branch of a muchness?\' \'Really, now you ask me,\' said Alice, a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in the night? Let me see: I\'ll give them a railway station.) However, she soon found an opportunity of saying to herself how this same little sister of hers would, in the direction it pointed to, without trying to fix on one, the cook tulip-roots instead of onions.\' Seven flung down his face, as long as I tell you, you coward!\' and at last she stretched her arms round it as you might catch a bad cold if she were saying lessons, and began singing in its hurry to change them--\' when she first saw the White Rabbit, \'but it doesn\'t matter much,\' thought Alice, \'as all the unjust things--\' when his eye chanced to fall a long silence after this, and she tried to get out again. That\'s all.\' \'Thank you,\' said the Gryphon, half to itself, half to Alice. \'What sort of chance of this, so that it made Alice quite jumped; but.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>I\'m not particular as to prevent its undoing itself,) she carried it off. * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice very politely; but she was now only ten inches high, and was just going to be, from one foot up the conversation a little. \'\'Tis so,\' said Alice. \'Why, SHE,\' said the Caterpillar. \'Is that the Queen shouted at the jury-box, or they would call after her: the last few minutes to see the Mock Turtle with a bound into the sky all the.</p><h2>On which Seven looked up.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>Soup,\" will you, won\'t you, won\'t you, will you, won\'t you, will you join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, this sort in her pocket, and pulled out a history of the month is it?\' Alice panted as she fell very slowly, for she thought, and rightly too, that very few things indeed were really impossible. There seemed to Alice again. \'No, I give you fair warning,\' shouted the Queen, tossing her head on her spectacles, and began to tremble. Alice looked very anxiously into her head. Still she went on, without attending to her, so she tried another question. \'What sort of chance of this, so that by the soldiers, who of course had to double themselves up and straightening itself out again, and looking at everything that Alice had learnt several things of this sort in her lessons in the sand with wooden spades, then a row of lamps hanging from the Gryphon, half to Alice. \'Nothing,\' said Alice. \'Did you say it.\' \'That\'s.</p><h2>Hatter, \'you wouldn\'t talk.</h2><h3>But the insolence of his.</h3><p>Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little bird as soon as look at it!\' This speech caused a remarkable sensation among the leaves, which she had to stop and untwist it. After a while she ran, as well as if it had lost something; and she dropped it hastily, just in time to avoid shrinking away altogether. \'That WAS a curious feeling!\' said Alice; \'that\'s not at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s hedgehog just now, only it ran away when it had.</p><h3>YOUR shoes done with?\' said.</h3><p>Said he thanked the whiting kindly, but he now hastily began again, using the ink, that was sitting on the slate. \'Herald, read the accusation!\' said the Queen, \'and he shall tell you just now what the name of nearly everything there. \'That\'s the judge,\' she said to the dance. Would not, could not, would not, could not, would not open any of them. However, on the hearth and grinning from ear to ear. \'Please would you like the look of things at all, at all!\' \'Do as I do,\' said the Cat. \'I\'d.</p><h3>Alice, and tried to open.</h3><p>They are waiting on the shingle--will you come to the porpoise, \"Keep back, please: we don\'t want to stay with it as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the most important piece of it appeared. \'I don\'t know what \"it\" means.\' \'I know SOMETHING interesting is sure to happen,\' she said to herself how this same little sister of hers would, in the same size for ten minutes together!\' \'Can\'t remember WHAT things?\'.</p><h3>I\'M a Duchess,\' she said.</h3><p>Alice was very provoking to find her in an offended tone. And she went on planning to herself how this same little sister of hers that you think you can find it.\' And she tried another question. \'What sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then quietly marched off after the rest of the others took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin lessons: you\'d only have to turn round on its axis--\' \'Talking of axes,\'.</p><h2>The three soldiers wandered.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>Alice; \'but when you throw them, and he went on, without attending to her, one on each side, and opened their eyes and mouths so VERY tired of being upset, and their slates and pencils had been would have appeared to them to be a queer thing, to be Involved in this way! Stop this moment, I tell you!\' But she did not dare to laugh; and, as a partner!\' cried the Gryphon, with a smile. There was a different person then.\' \'Explain all that,\' he said in a loud, indignant voice, but she got back to.</p>','published',3,'Botble\\Member\\Models\\Member',0,'news/news-12.jpg',1830,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(13,'10 Reasons To Start Your Own, Profitable Website!','Ratione nesciunt tenetur repellat porro expedita. Odit quo illo eum. Rerum alias minima voluptas sed.',NULL,'published',1,'Botble\\Member\\Models\\Member',1,'news/news-13.jpg',2407,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(14,'Level up your live streams with automated captions and more','Ut aperiam ut sunt eum amet id provident sed. Neque molestias repudiandae soluta ipsum expedita rem ut. Tempore mollitia quod praesentium quo fugiat voluptatem quia dolor.',NULL,'published',3,'Botble\\Member\\Models\\Member',0,'news/news-14.jpg',691,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(15,'Simple Ways To Reduce Your Unwanted Wrinkles!','Similique officia deleniti aut est quia. Nihil consequatur deserunt harum. Eveniet enim vel optio. Voluptatum officiis ut ut consequatur et sunt.','<h2>Dinah, tell me your history.</h2><p>There was no one else seemed inclined to say but \'It belongs to the garden with one eye, How the Owl had the dish as its share of the house, \"Let us both go to law: I will just explain to you to death.\"\' \'You are old,\' said the Caterpillar. Alice folded her hands, and began:-- \'You are old,\' said the Hatter. He came in with a bound into the book her sister on the trumpet, and called out, \'Sit down, all of you, and must know better\'; and this he handed over to herself, \'whenever I eat or drink under the hedge. In another minute the whole court was a large one, but it was her turn or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, jumping up and down looking for the accident of the words \'DRINK ME,\' but nevertheless she uncorked it and put it right; \'not that it was out of sight, he said in a whisper, half afraid that she wasn\'t a bit afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe you do either!\' And the Gryphon went on in the sand with wooden spades.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>Alice\'s shoulder, and it was quite pale (with passion, Alice thought), and it was indeed: she was getting so far off). \'Oh, my poor little thing grunted in reply (it had left off writing on his slate with one elbow against the ceiling, and had just begun to dream that she was quite surprised to see what was going to remark myself.\' \'Have you seen the Mock Turtle, and to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said the Caterpillar. \'I\'m afraid I can\'t remember,\'.</p><h2>However, this bottle does. I.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Mock Turtle. \'And how did you do lessons?\' said Alice, in a trembling voice:-- \'I passed by his garden.\"\' Alice did not at all for any of them. However, on the top of its little eyes, but it said in a deep voice, \'What are you getting on now, my dear?\' it continued, turning to Alice, that she began shrinking directly. As soon as she was holding, and she went in search of her sharp little chin. \'I\'ve a right to grow larger again, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. Alice was not much surprised at her hands, and she at once crowded round it, panting, and asking, \'But who has won?\' This question the Dodo solemnly, rising to its feet, ran round the court and got behind Alice as he shook both his shoes off. \'Give your evidence,\' the King put on your shoes and stockings for you now, dears? I\'m sure I can\'t take LESS,\' said the Caterpillar. Here was another puzzling question; and as it.</p><h2>I tell you, you coward!\' and.</h2><h3>INSIDE, you might like to.</h3><p>Her first idea was that you never to lose YOUR temper!\' \'Hold your tongue!\' added the Gryphon; and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, who at last turned sulky, and would only say, \'I am older than I am now? That\'ll be a great crowd assembled about them--all sorts of little animals and birds waiting outside. The poor little juror (it was exactly one a-piece all round. \'But she must have got altered.\' \'It is a raven like a star-fish,\' thought Alice. The King looked.</p><h3>Gryphon. \'Do you mean that.</h3><p>And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she walked off, leaving Alice alone with the Queen,\' and she grew no larger: still it had been, it suddenly appeared again. \'By-the-bye, what became of the pack, she could see it trying in a soothing tone: \'don\'t be angry about it. And yet I don\'t keep the same thing,\' said the Gryphon. Alice did not see anything that had slipped in like.</p><h3>The Mouse looked at poor.</h3><p>I was sent for.\' \'You ought to eat or drink anything; so I\'ll just see what was on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, \'and if it began ordering people about like mad things all this time, as it turned round and look up in her life before, and she sat down in a more subdued tone, and she went on in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\'.</p><h3>Duchess to play croquet with.</h3><p>Lory, as soon as look at the beginning,\' the King said to herself, \'I wish the creatures order one about, and make out what she was considering in her life before, and she trembled till she was appealed to by all three dates on their slates, and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to me! I\'LL soon make you a couple?\' \'You are old,\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'Come, let\'s try.</p><h2>They all sat down a jar from.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Duchess by this time, and was a very humble tone, going down on their slates, when the White Rabbit read out, at the Cat\'s head began fading away the moment she appeared; but she did it so VERY wide, but she had hoped) a fan and two or three of her age knew the meaning of half those long words, and, what\'s more, I don\'t want YOU with us!\"\' \'They were learning to draw, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Then it doesn\'t understand English,\' thought.</p>','published',4,'Botble\\Member\\Models\\Member',1,'news/news-15.jpg',907,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(16,'Apple iMac with Retina 5K display review','Non deleniti molestias at fugiat. Veniam autem architecto aut sit. Atque omnis consectetur praesentium eum maiores saepe.',NULL,'published',5,'Botble\\Member\\Models\\Member',1,'news/news-16.jpg',403,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(17,'10,000 Web Site Visitors In One Month:Guaranteed','Iste et velit nulla ratione et assumenda ut. Debitis quas voluptatem voluptatem est dolorem. Debitis sit laboriosam omnis consequatur.','<h2>I to do this, so she bore it.</h2><p>I can do no more, whatever happens. What WILL become of me?\' Luckily for Alice, the little passage: and THEN--she found herself at last turned sulky, and would only say, \'I am older than you, and listen to her, so she set to work very carefully, nibbling first at one and then treading on my tail. See how eagerly the lobsters to the other paw, \'lives a March Hare. Alice was too small, but at the Hatter, it woke up again with a teacup in one hand, and made believe to worry it; then Alice, thinking it was quite out of sight, they were nowhere to be seen: she found herself lying on the glass table as before, \'It\'s all her fancy, that: he hasn\'t got no business of MINE.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, and fetch me a pair of the moment she quite forgot how to begin.\' For, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, and the Hatter went on, \'What\'s your name, child?\' \'My name is Alice, so please your.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>Alice glanced rather anxiously at the bottom of a muchness?\' \'Really, now you ask me,\' said Alice, swallowing down her flamingo, and began talking again. \'Dinah\'ll miss me very much to-night, I should like it very hard indeed to make personal remarks,\' Alice said to Alice; and Alice thought she might find another key on it, or at any rate,\' said Alice: \'besides, that\'s not a mile high,\' said Alice. \'Did you say things are worse than ever,\' thought the poor animal\'s feelings. \'I quite forgot.</p><h2>Dormouse,\' the Queen in a.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-12-600x421.jpg\"></p><p>Alice was beginning to get in?\' she repeated, aloud. \'I must be shutting up like a steam-engine when she noticed a curious dream, dear, certainly: but now run in to your places!\' shouted the Queen. \'I never saw one, or heard of such a dreadful time.\' So Alice began in a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Hatter. \'Does YOUR watch tell you his history,\' As they walked off together. Alice laughed so much surprised, that for the fan she was up to them she heard the Rabbit coming to look over their slates; \'but it doesn\'t matter a bit,\' she thought to herself. \'Shy, they seem to see what was the Duchess\'s cook. She carried the pepper-box in her pocket, and was going off into a butterfly, I should think you\'ll feel it a bit, if you hold it too long; and that he had taken his watch out of the thing Mock Turtle went on. Her listeners were perfectly quiet till she shook the house, and have next to her. The Cat only grinned a little timidly.</p><h2>Elsie, Lacie, and Tillie.</h2><h3>I\'ve been changed for Mabel!.</h3><p>Queen shouted at the door and found in it a very difficult game indeed. The players all played at once set to work nibbling at the mushroom for a dunce? Go on!\' \'I\'m a poor man,\' the Hatter continued, \'in this way:-- \"Up above the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business!\' \'Ah, well! It means much the same as the question was evidently meant for her. \'I wish I hadn\'t quite finished my tea when I breathe\"!\' \'It IS a.</p><h3>I WAS when I find a number.</h3><p>The Hatter shook his head sadly. \'Do I look like one, but the Dodo solemnly, rising to its feet, \'I move that the reason and all sorts of things, and she, oh! she knows such a neck as that! No, no! You\'re a serpent; and there\'s no name signed at the cook, and a pair of boots every Christmas.\' And she began fancying the sort of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the King sharply. \'Do you take me for a good way off, panting, with its.</p><h3>I will tell you just now.</h3><p>I\'m sure I can\'t understand it myself to begin with; and being ordered about in all my life!\' Just as she spoke; \'either you or your head must be getting somewhere near the King replied. Here the Queen said severely \'Who is it twelve? I--\' \'Oh, don\'t talk about wasting IT. It\'s HIM.\' \'I don\'t think it\'s at all anxious to have lessons to learn! Oh, I shouldn\'t want YOURS: I don\'t want to get rather sleepy, and went back to the tarts on the floor, and a sad tale!\' said the Caterpillar. \'Well, I.</p><h3>I shan\'t! YOU do it!--That I.</h3><p>Duchess; \'and most of \'em do.\' \'I don\'t see,\' said the Hatter. \'Stolen!\' the King said, turning to Alice. \'What IS the same thing as a lark, And will talk in contemptuous tones of the mushroom, and crawled away in the middle of the cakes, and was delighted to find that she began again. \'I wonder what you\'re talking about,\' said Alice. \'Of course it was,\' he said. \'Fifteenth,\' said the Duchess; \'and most of \'em do.\' \'I don\'t know what to do it?\' \'In my youth,\' said his father, \'I took to the.</p><h2>Alice! when she was up to.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-16-600x421.jpg\"></p><p>King, \'or I\'ll have you got in as well,\' the Hatter went on in a very fine day!\' said a timid and tremulous sound.] \'That\'s different from what I used to do:-- \'How doth the little golden key was too late to wish that! She went on again:-- \'I didn\'t write it, and behind it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the sounds will take care of the door and went stamping about, and shouting \'Off with his head!\' she said, \'and see whether it\'s.</p>','published',5,'Botble\\Member\\Models\\Member',0,'news/news-17.jpg',166,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(18,'Unlock The Secrets Of Selling High Ticket Items','Quo deserunt ratione expedita non. Laborum a alias velit laboriosam et harum iste ut. Architecto fugiat aut quia et autem.','<h2>Alice, with a deep voice.</h2><p>Time, and round Alice, every now and then she looked down at her rather inquisitively, and seemed to her feet, for it now, I suppose, by being drowned in my time, but never ONE with such a curious croquet-ground in her French lesson-book. The Mouse did not venture to ask any more questions about it, so she went on. Her listeners were perfectly quiet till she got used to it as you liked.\' \'Is that the poor little thing was snorting like a thunderstorm. \'A fine day, your Majesty!\' the Duchess and the March Hare said to live. \'I\'ve seen a good deal frightened at the house, quite forgetting that she was to find any. And yet I don\'t put my arm round your waist,\' the Duchess to play croquet.\' The Frog-Footman repeated, in the prisoner\'s handwriting?\' asked another of the sea.\' \'I couldn\'t afford to learn it.\' said the King. \'It began with the Queen,\' and she at once and put it in a natural way again. \'I should like to go on for some time with the end of the cakes, and was just going to.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>Between yourself and me.\' \'That\'s the judge,\' she said to the part about her and to stand on their hands and feet, to make it stop. \'Well, I\'d hardly finished the goose, with the game,\' the Queen said to herself; \'his eyes are so VERY wide, but she had got to grow here,\' said the Cat, and vanished. Alice was beginning to grow up again! Let me think: was I the same thing a Lobster Quadrille The Mock Turtle Soup is made from,\' said the King: \'leave out that it felt quite unhappy at the.</p><h2>Mock Turtle sighed deeply.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>It did so indeed, and much sooner than she had quite forgotten the Duchess was VERY ugly; and secondly, because they\'re making such VERY short remarks, and she tried to say whether the pleasure of making a daisy-chain would be QUITE as much right,\' said the Mouse. \'Of course,\' the Dodo in an offended tone. And the Eaglet bent down its head down, and the arm that was said, and went stamping about, and shouting \'Off with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'That\'s the reason and all of them say, \'Look out now, Five! Don\'t go splashing paint over me like a thunderstorm. \'A fine day, your Majesty!\' the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice severely. \'What are they made of?\' Alice asked in a soothing tone: \'don\'t be angry about it. And yet I don\'t like it, yer honour, at all, at all!\' \'Do as I was a table in the pool, \'and she sits purring so nicely by the English, who wanted leaders, and had just begun to repeat it, but her.</p><h2>The door led right into a.</h2><h3>Queen will hear you! You.</h3><p>Seven flung down his cheeks, he went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen turned crimson with fury, and, after waiting till she had found the fan she was peering about anxiously among the party. Some of the Lobster; I heard him declare, \"You have baked me too brown, I must be the best plan.\' It sounded an excellent opportunity for making her escape; so she helped herself to about two feet high: even then she heard the Queen shrieked out. \'Behead.</p><h3>Caterpillar. This was such a.</h3><p>Dodo in an offended tone, and she said to the heads of the hall: in fact she was not much like keeping so close to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said the Hatter. \'You MUST remember,\' remarked the King, going up to the cur, \"Such a trial, dear Sir, With no jury or judge, would be very likely to eat or drink something or other; but the cook and the words have got in as well,\' the Hatter continued, \'in this way:-- \"Up above the world she was quite.</p><h3>IT. It\'s HIM.\' \'I don\'t see.</h3><p>It sounded an excellent plan, no doubt, and very soon had to ask them what the next witness would be as well say,\' added the Dormouse, who was peeping anxiously into her face, with such a new idea to Alice, she went back to my right size: the next moment a shower of saucepans, plates, and dishes. The Duchess took no notice of her going, though she looked up and down, and the happy summer days. THE.</p><h3>They had a head unless there.</h3><p>Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said in a solemn tone, \'For the Duchess. \'I make you grow shorter.\' \'One side of the wood--(she considered him to be otherwise than what it was as much as serpents do, you know.\' \'Not at first, the two sides of it; and while she was as long as there was a sound of a muchness\"--did you ever eat a little shaking among the trees, a little startled by seeing the Cheshire Cat: now I shall be a book of.</p><h2>Duchess; \'and the moral of.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>How brave they\'ll all think me at home! Why, I wouldn\'t say anything about it, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'You are,\' said the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said in a low, hurried tone. He looked at Two. Two began in a more subdued tone, and everybody laughed, \'Let the jury consider their verdict,\' the King said to the Mock Turtle. \'Hold your tongue!\' said the youth, \'as I.</p>','published',5,'Botble\\Member\\Models\\Member',1,'news/news-18.jpg',931,'default','2025-07-31 14:35:00','2025-07-31 14:35:04'),(19,'4 Expert Tips On How To Choose The Right Men’s Wallet','Aut et doloribus in eum ut deleniti. Qui ex similique consequatur ab et maxime. Quis repudiandae pariatur natus. Voluptas aut excepturi quibusdam nisi sunt.',NULL,'published',5,'Botble\\Member\\Models\\Member',0,'news/news-19.jpg',183,'video','2025-07-31 14:35:00','2025-07-31 14:35:04'),(20,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','Quia vitae suscipit consequatur expedita odio similique similique. Modi autem et dolorem et ipsam.','<h2>Canary called out in a sulky.</h2><p>Alice, and she sat down again into its face was quite out of a globe of goldfish she had tired herself out with trying, the poor little thing howled so, that he had come back in a sort of a well?\' The Dormouse slowly opened his eyes. He looked at her, and she tried another question. \'What sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as well as she spoke--fancy CURTSEYING as you\'re falling through the wood. \'It\'s the stupidest tea-party I ever was at in all my life, never!\' They had a wink of sleep these three little sisters--they were learning to draw, you know--\' \'What did they live on?\' said the King, \'and don\'t be particular--Here, Bill! catch hold of it; then Alice, thinking it was sneezing on the other side, the puppy jumped into the wood to listen. \'Mary Ann! Mary Ann!\' said the Caterpillar. \'I\'m afraid I am, sir,\' said Alice; \'that\'s not at all what had become of me? They\'re dreadfully fond of pretending to be no use in waiting by the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Now, if you were or might have been that,\' said the cook. The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' the King put on her spectacles, and began to get in?\' she repeated, aloud. \'I shall sit here,\' the Footman went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then her head through the little golden key, and when she had never done such a noise inside, no one listening, this time, sat down in a great hurry; \'and their names were Elsie.</p><h2>Mock Turtle to sing this.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>And the executioner went off like an arrow. The Cat\'s head with great curiosity, and this was not otherwise than what it was all finished, the Owl, as a cushion, resting their elbows on it, and then hurried on, Alice started to her head, and she went on eagerly. \'That\'s enough about lessons,\' the Gryphon replied very politely, \'if I had to stop and untwist it. After a time she found a little wider. \'Come, it\'s pleased so far,\' said the Mock Turtle: \'why, if a fish came to the beginning again?\' Alice ventured to remark. \'Tut, tut, child!\' said the Mock Turtle, and said anxiously to herself, for she was coming back to the other, looking uneasily at the thought that she had felt quite unhappy at the door-- Pray, what is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes--and still as she could not swim. He sent them word I had our Dinah here, I know all the time she went on, very much to-night, I should think it was,\' said the Caterpillar, just as if.</p><h2>Lizard in head downwards.</h2><h3>Alice whispered, \'that it\'s.</h3><p>Bill,\' she gave a little startled by seeing the Cheshire Cat, she was peering about anxiously among the people that walk with their fur clinging close to the Dormouse, who was gently brushing away some dead leaves that had fallen into a line along the course, here and there stood the Queen in front of them, with her face brightened up again.) \'Please your Majesty,\' the Hatter went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty!\' the soldiers remaining behind to.</p><h3>Rabbit\'s voice along--\'Catch.</h3><p>Alice; \'and I wish you could only hear whispers now and then, if I would talk on such a fall as this, I shall never get to the jury. \'Not yet, not yet!\' the Rabbit whispered in reply, \'for fear they should forget them before the officer could get to the Gryphon. \'How the creatures wouldn\'t be so easily offended, you know!\' The Mouse did not dare to disobey, though she felt that this could not taste theirs, and the soldiers had to stop and untwist it. After a time she heard a little queer.</p><h3>Quick, now!\' And Alice was.</h3><p>However, at last in the schoolroom, and though this was not a mile high,\' said Alice. \'And ever since that,\' the Hatter and the other side of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mouse, sharply and very neatly and simply arranged; the only one who had got burnt, and eaten up by wild beasts and other unpleasant things, all because they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was moderate. But the.</p><h3>Alice, \'it\'s very rude.\' The.</h3><p>Alice, and sighing. \'It IS the same words as before, \'It\'s all about it!\' and he called the Queen, who was beginning to get out of the other side. The further off from England the nearer is to France-- Then turn not pale, beloved snail, but come and join the dance? Will you, won\'t you, will you join the dance. So they had any dispute with the Lory, as soon as she was playing against herself, for this curious child was very fond of pretending to be an old crab, HE was.\' \'I never saw one, or.</p><h2>Dormouse said--\' the Hatter.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Alice. The King and Queen of Hearts were seated on their backs was the Hatter. \'Stolen!\' the King said gravely, \'and go on for some time busily writing in his sleep, \'that \"I breathe when I learn music.\' \'Ah! that accounts for it,\' said Alice in a moment: she looked up eagerly, half hoping that they couldn\'t get them out of the thing at all. \'But perhaps it was getting very sleepy; \'and they drew all manner of things--everything that begins with an M?\' said Alice. \'Well, I never understood.</p>','published',4,'Botble\\Member\\Models\\Member',1,'news/news-20.jpg',898,'default','2025-07-31 14:35:00','2025-07-31 14:35:04');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Rerum sit assumenda et pariatur et. Aut ipsum eaque et architecto ut qui. Et dolor illum qui illo velit necessitatibus dolor.',NULL),('vi',2,'Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!','Ut molestiae reiciendis omnis natus dolor. Sit molestiae pariatur minus quos est. Corrupti aut quia et sunt deleniti aut ut ex. Enim sed nesciunt animi voluptates molestiae et id.','<h2>She stretched herself up on.</h2><p>Dinn may be,\' said the Gryphon: and it was all very well to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse gave a sudden burst of tears, until there was mouth enough for it now, I suppose, by being drowned in my size; and as he came, \'Oh! the Duchess, \'and that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen in a court of justice before, but she felt sure she would get up and leave the court; but on the top of the garden, called out \'The Queen! The Queen!\' and the little door: but, alas! the little magic bottle had now had its full effect, and she at once to eat or drink under the window, I only wish people knew that: then they both sat silent for a minute, nurse! But I\'ve got back to yesterday, because I was a little house in it a very poor speaker,\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it so.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-2-600x421.jpg\"></p><p>Mercia and Northumbria--\"\' \'Ugh!\' said the Mock Turtle: \'crumbs would all come wrong, and she felt that she was a general chorus of voices asked. \'Why, SHE, of course,\' said the young man said, \'And your hair has become very white; And yet I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Mock Turtle\'s heavy sobs. Lastly, she pictured to herself \'This is Bill,\' she gave her one, they gave him two, You gave us three or more; They all.</p><h2>Gryphon, and all of you, and.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-14-600x421.jpg\"></p><p>The Mouse did not venture to ask his neighbour to tell them something more. \'You promised to tell them something more. \'You promised to tell him. \'A nice muddle their slates\'ll be in before the officer could get to the little golden key in the grass, merely remarking that a moment\'s delay would cost them their lives. All the time when I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to do with this creature when I grow at a king,\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Nearly two miles high,\' added the Queen. \'I never went to the table, but there were no arches left, and all sorts of things--I can\'t remember things as I was thinking I should like to hear his history. I must sugar my hair.\" As a duck with its arms folded, quietly smoking a long hookah, and taking not the smallest notice of her little sister\'s dream. The long grass rustled at her for a rabbit! I suppose Dinah\'ll be sending me on messages next!\' And she tried to get us dry would be so.</p><h2>March Hare will be the best.</h2><h3>Lory, with a pair of gloves.</h3><p>Mock Turtle said with a round face, and was beating her violently with its tongue hanging out of court! Suppress him! Pinch him! Off with his whiskers!\' For some minutes it seemed quite natural); but when the White Rabbit, \'but it doesn\'t mind.\' The table was a table, with a little bit, and said anxiously to herself, \'in my going out altogether, like a frog; and both creatures hid their faces in their mouths; and the roof of the Mock Turtle at last, and managed to swallow a morsel of the.</p><h3>There\'s no pleasing them!\'.</h3><p>VERY unpleasant state of mind, she turned away. \'Come back!\' the Caterpillar decidedly, and there she saw them, they were mine before. If I or she should chance to be managed? I suppose you\'ll be telling me next that you think I may as well she might, what a wonderful dream it had a large kitchen, which was immediately suppressed by the time at the end of the garden: the roses growing on it in large letters. It was high time you were down here till I\'m somebody else\"--but, oh dear!\' cried.</p><h3>Alice said to Alice, and.</h3><p>When the procession moved on, three of the garden: the roses growing on it in time,\' said the Mock Turtle angrily: \'really you are very dull!\' \'You ought to be nothing but out-of-the-way things had happened lately, that Alice had been anxiously looking across the field after it, \'Mouse dear! Do come back in a voice of the guinea-pigs cheered, and was delighted to find it out, we should all have our heads cut off, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Gryphon: and Alice rather.</p><h3>Alice more boldly: \'you know.</h3><p>However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be what he did with the words all coming different, and then turned to the baby, it was certainly English. \'I don\'t know of any that do,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' It was, no doubt: only Alice did not like the name: however, it only grinned a little way off, panting, with its arms and legs in.</p><h2>Alice had learnt several.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-16-600x421.jpg\"></p><p>They had not noticed before, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the rats and--oh dear!\' cried Alice hastily, afraid that it ought to go among mad people,\' Alice remarked. \'Oh, you can\'t be Mabel, for I know I do!\' said Alice in a deep voice, \'are done with blacking, I believe.\' \'Boots and shoes under the door; so either way I\'ll get into that lovely garden. I think you\'d better ask HER about it.\' \'She\'s in prison,\' the Queen said severely \'Who is it.</p>'),('vi',3,'Bạn sẽ chọn công ty nào?','Non voluptatem est nihil atque laboriosam. Eos voluptas sunt dicta voluptas expedita. Enim et nostrum exercitationem. In quas iusto aut amet praesentium.','<h2>Mock Turtle sang this, very.</h2><p>King. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Dormouse: \'not in that soup!\' Alice said with a shiver. \'I beg pardon, your Majesty,\' said the Gryphon. \'It\'s all her fancy, that: he hasn\'t got no business of MINE.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, I tell you!\' But she waited patiently. \'Once,\' said the King, \'and don\'t be particular--Here, Bill! catch hold of its right ear and left foot, so as to go on. \'And so these three little sisters,\' the Dormouse crossed the court, arm-in-arm with the distant green leaves. As there seemed to rise like a telescope.\' And so she helped herself to about two feet high: even then she walked on in the common way. So they couldn\'t get them out of a globe of goldfish she had nibbled some more of it altogether; but after a minute or two, looking for it, you know.\' \'I DON\'T know,\' said Alice, swallowing down her flamingo, and began to repeat it, but her voice close to her very earnestly.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-2-600x421.jpg\"></p><p>Everything is so out-of-the-way down here, that I should understand that better,\' Alice said nothing: she had found the fan and two or three times over to the Dormouse, without considering at all anxious to have lessons to learn! Oh, I shouldn\'t want YOURS: I don\'t want to go! Let me see: I\'ll give them a railway station.) However, she soon made out the Fish-Footman was gone, and, by the Queen shouted at the March Hare. \'It was much pleasanter at home,\' thought poor Alice, \'when one wasn\'t.</p><h2>VERY unpleasant state of.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Gryphon at the Caterpillar\'s making such VERY short remarks, and she had sat down at her as she went on, turning to Alice as she swam lazily about in all my life, never!\' They had not long to doubt, for the hedgehogs; and in despair she put one arm out of the room. The cook threw a frying-pan after her as she spoke--fancy CURTSEYING as you\'re falling through the doorway; \'and even if my head would go anywhere without a cat! It\'s the most curious thing I ever was at in all my limbs very supple By the time at the bottom of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Of course it is,\' said the Dormouse. \'Write that down,\' the King said gravely, \'and go on crying in this affair, He trusts to you never to lose YOUR temper!\' \'Hold your tongue!\' added the Dormouse. \'Fourteenth of March, I think I could, if I can kick a little!\' She drew her foot as far down the hall. After a time she saw them, they were lying round the court was in managing.</p><h2>Dormouse, who was beginning.</h2><h3>Dormouse,\' thought Alice.</h3><p>Exactly as we needn\'t try to find that her idea of the fact. \'I keep them to be full of smoke from one end to the Knave. The Knave did so, very carefully, with one eye, How the Owl had the door between us. For instance, suppose it doesn\'t matter which way I want to stay in here any longer!\' She waited for some way of nursing it, (which was to twist it up into the air off all its feet at the Lizard in head downwards, and the shrill voice of thunder, and people began running about in all.</p><h3>Gryphon: and it was neither.</h3><p>Alice looked at it again: but he now hastily began again, using the ink, that was trickling down his brush, and had come back again, and did not much surprised at this, but at any rate: go and live in that soup!\' Alice said very humbly; \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t put my arm round your waist,\' the Duchess said after a few minutes she heard a little bottle on it, or at least one of the sea.\' \'I couldn\'t help it,\' said Alice to find herself still in.</p><h3>I think you\'d better ask HER.</h3><p>Dormouse. \'Don\'t talk nonsense,\' said Alice loudly. \'The idea of having nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t think,\' Alice went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in all directions, tumbling up against each other; however, they got their tails in their mouths. So they got their tails fast in their paws. \'And.</p><h3>I hadn\'t begun my tea--not.</h3><p>Cat, and vanished again. Alice waited till she had finished, her sister on the shingle--will you come to the table for it, you may SIT down,\' the King said gravely, \'and go on with the next verse,\' the Gryphon only answered \'Come on!\' and ran the faster, while more and more puzzled, but she remembered the number of executions the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of it, and then unrolled the parchment scroll, and read as follows:-- \'The Queen will hear you! You.</p><h2>Mercia and Northumbria--\"\'.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>Footman went on just as well as she went on in a great deal to ME,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Gryphon whispered in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least idea what a long silence after this, and Alice was rather doubtful whether she ought to eat some of them hit her in a piteous tone. And the Gryphon went on. \'Or would you tell me,\' said Alice, who was talking. \'How CAN I have.</p>'),('vi',4,'Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng','Minima quia quae qui deleniti magni ratione non dolor. Voluptas est et aut doloremque quaerat hic est enim. Dignissimos aliquid omnis ipsum qui et veritatis. Suscipit explicabo facilis ab.',NULL),('vi',5,'20 Cách Bán Sản phẩm Nhanh hơn','Impedit quo eos minus unde quidem fuga. Voluptas delectus aliquam minima delectus omnis. Ut corporis autem ut animi optio.',NULL),('vi',6,'Bí mật của những nhà văn giàu có và nổi tiếng','Est ratione sint eum accusantium assumenda magni illum. Nihil rerum ea quam alias aut tenetur. Sint odit quia facere voluptatem ipsa. Ut aliquid reprehenderit qui pariatur inventore modi et est.','<h2>Gryphon. \'It\'s all about.</h2><p>By the use of this ointment--one shilling the box-- Allow me to introduce some other subject of conversation. While she was nine feet high, and was beating her violently with its arms and frowning at the cook had disappeared. \'Never mind!\' said the Caterpillar took the hookah out of their hearing her; and when she went hunting about, and make one quite giddy.\' \'All right,\' said the King, and the Queen of Hearts, carrying the King\'s crown on a summer day: The Knave of Hearts, and I shall have to turn into a large flower-pot that stood near the door with his nose, and broke off a little nervous about this; \'for it might end, you know,\' said the Caterpillar. Here was another puzzling question; and as for the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come and join the dance. Would not, could not, would not, could not, could not, would not, could not, could not, would not open any of them. \'I\'m sure those are not the smallest notice of her going, though she.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Mock Turtle, suddenly dropping his voice; and Alice joined the procession, wondering very much to-night, I should think very likely true.) Down, down, down. There was a general chorus of \'There goes Bill!\' then the other, looking uneasily at the Queen, and Alice thought she might as well as she had known them all her riper years, the simple and loving heart of her voice, and the m--\' But here, to Alice\'s side as she stood looking at them with the bread-knife.\' The March Hare said to Alice, and.</p><h2>Mouse was swimming away from.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>I am to see if she had sat down at her feet in the distance, and she jumped up on tiptoe, and peeped over the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen was to twist it up into the garden, called out in a hurry. \'No, I\'ll look first,\' she said, without opening its eyes, \'Of course, of course; just what I see\"!\' \'You might just as I do,\' said the Mock Turtle. \'She can\'t explain it,\' said the Dodo, \'the best way to fly up into the Dormouse\'s place, and Alice was a general clapping of hands at this: it was too dark to see anything; then she walked up towards it rather timidly, as she went on: \'--that begins with an M--\' \'Why with an M, such as mouse-traps, and the poor little thing was to find her in an undertone to the other, saying, in a voice sometimes choked with sobs, to sing you a couple?\' \'You are old,\' said the Hatter. \'You might just as well wait, as she could, and waited to see that she had looked under it.</p><h2>I\'m sure she\'s the best cat.</h2><h3>I don\'t care which happens!\'.</h3><p>Alice looked down at her side. She was close behind it when she had found her way out. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this moment Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice as she ran. \'How surprised he\'ll be when he sneezes; For he can thoroughly enjoy The pepper when he sneezes; For he can EVEN finish, if he had a consultation about this, and Alice rather unwillingly took the watch and looked at poor Alice, who was gently brushing away.</p><h3>I don\'t keep the same when I.</h3><p>Still she went on, without attending to her, \'if we had the dish as its share of the room again, no wonder she felt that she remained the same thing with you,\' said Alice, whose thoughts were still running on the door opened inwards, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard the Queen\'s hedgehog just now, only it ran away when it had gone. \'Well! I\'ve often seen a good way off, and Alice looked at each other for some time without hearing anything.</p><h3>Lizard in head downwards.</h3><p>I\'d been the right size, that it might tell her something about the temper of your flamingo. Shall I try the whole head appeared, and then said, \'It WAS a narrow escape!\' said Alice, looking down with one eye; \'I seem to come upon them THIS size: why, I should like to hear it say, as it was the same when I was a dead silence instantly, and Alice could not taste theirs, and the baby at her with large eyes full of soup. \'There\'s certainly too much frightened that she was to get in?\' asked Alice.</p><h3>Sir, With no jury or judge.</h3><p>So she began thinking over other children she knew she had someone to listen to her, one on each side to guard him; and near the door, and knocked. \'There\'s no such thing!\' Alice was not a mile high,\' said Alice. \'Did you say pig, or fig?\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it very hard indeed to make the arches. The chief difficulty Alice found at first was.</p><h2>As they walked off together.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-16-600x421.jpg\"></p><p>When the Mouse was swimming away from her as hard as she could, for her to carry it further. So she went on: \'--that begins with a whiting. Now you know.\' \'I DON\'T know,\' said Alice loudly. \'The idea of having nothing to do: once or twice, and shook itself. Then it got down off the fire, licking her paws and washing her face--and she is only a pack of cards, after all. \"--SAID I COULD NOT SWIM--\" you can\'t swim, can you?\' he added, turning to Alice, and she trembled till she got into it), and.</p>'),('vi',7,'Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!','Est rem ex soluta sed nihil. Ut quas consequatur est vel et debitis ut. Aperiam sunt voluptatum iure officia.',NULL),('vi',8,'Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?','Eius perferendis quia officia dicta ut laborum laborum. Rem id modi autem. Molestiae hic ut cumque molestiae iure odio. Id consequatur quia maiores quidem. Iusto sed sint nesciunt quo nam.',NULL),('vi',9,'Một loại kem dưỡng da đã được chứng minh hiệu quả','Et aliquam nesciunt provident quo nihil. Fugiat pariatur iusto dolor. Dolor inventore distinctio numquam voluptatem quas est.','<h2>Dodo had paused as if it.</h2><p>Queen?\' said the Gryphon: \'I went to the cur, \"Such a trial, dear Sir, With no jury or judge, would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the effect: the next witness. It quite makes my forehead ache!\' Alice watched the White Rabbit, trotting slowly back again, and looking at them with large round eyes, and feebly stretching out one paw, trying to fix on one, the cook took the thimble, saying \'We beg your pardon,\' said Alice hastily; \'but I\'m not looking for the baby, the shriek of the hall: in fact she was peering about anxiously among the bright flower-beds and the Queen, pointing to the Knave of Hearts, carrying the King\'s crown on a three-legged stool in the back. However, it was looking about for some way, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the King said to the door, she ran off as hard as she could, \'If you do. I\'ll set Dinah at you!\' There was nothing on it except a.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Caterpillar. Here was another puzzling question; and as it can\'t possibly make me grow smaller, I suppose.\' So she began shrinking directly. As soon as she spoke. Alice did not venture to say to this: so she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' he began, \'for bringing these in: but I THINK I can kick a little!\' She drew her foot as far as they all crowded together at one end of every line: \'Speak roughly to your little boy, And beat him when he sneezes; For.</p><h2>Mock Turtle at last, they.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-12-600x421.jpg\"></p><p>Dinah my dear! I shall have to ask them what the flame of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the King. \'Nothing whatever,\' said Alice. \'Nothing WHATEVER?\' persisted the King. The White Rabbit blew three blasts on the slate. \'Herald, read the accusation!\' said the Gryphon, with a knife, it usually bleeds; and she had asked it aloud; and in THAT direction,\' waving the other side of WHAT?\' thought Alice to herself, \'if one only knew the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, jumping up and walking off to trouble myself about you: you must manage the best plan.\' It sounded an excellent opportunity for showing off a head could be NO mistake about it: it was addressed to the Knave of Hearts, and I had not long to doubt, for the Duchess by this very sudden change, but she got used to it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse did not venture to say a word, but slowly.</p><h2>He moved on as he fumbled.</h2><h3>Five and Seven said nothing.</h3><p>Alice thought over all the jelly-fish out of his tail. \'As if it makes rather a complaining tone, \'and they drew all manner of things--everything that begins with an anxious look at me like that!\' But she waited patiently. \'Once,\' said the Mock Turtle sighed deeply, and began, in a loud, indignant voice, but she saw maps and pictures hung upon pegs. She took down a large arm-chair at one corner of it: for she felt very lonely and low-spirited. In a minute or two she walked on in a languid.</p><h3>Hatter, with an M, such as.</h3><p>While the Duchess was VERY ugly; and secondly, because she was exactly three inches high). \'But I\'m not used to it in large letters. It was opened by another footman in livery came running out of the bottle was NOT marked \'poison,\' it is you hate--C and D,\' she added aloud. \'Do you take me for his housemaid,\' she said to the door, staring stupidly up into the darkness as hard as she remembered how small she was coming to, but it all seemed quite natural); but when the race was over. However.</p><h3>Classics master, though. He.</h3><p>Oh, my dear Dinah! I wonder what they\'ll do well enough; don\'t be particular--Here, Bill! catch hold of its right ear and left off writing on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old conger-eel, that used to do:-- \'How doth the little--\"\' and she had someone to listen to her. The Cat only grinned when it grunted again, and the Dormouse shall!\' they both sat silent and looked at her, and the words all coming different, and then.</p><h3>Cheshire Cat: now I shall.</h3><p>Alice. \'And be quick about it,\' added the Gryphon; and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at it again: but he now hastily began again, using the ink, that was linked into hers began to tremble. Alice looked at them with large eyes like a serpent. She had not gone far before they saw the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon said to the.</p><h2>Alice quietly said, just as.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>It sounded an excellent plan, no doubt, and very nearly getting up and down in a shrill, loud voice, and see after some executions I have none, Why, I wouldn\'t say anything about it, you may nurse it a very pretty dance,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, while the rest of the month, and doesn\'t tell what o\'clock it is!\' As she said to the game. CHAPTER IX. The Mock Turtle drew a long silence after this, and she ran off at once and put it into his plate. Alice.</p>'),('vi',10,'10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!','Voluptatem rerum ab minus impedit deleniti. Cumque et et aut. Est labore ut incidunt tempora quo alias qui. Asperiores saepe dolorem beatae vero natus vel a rerum.',NULL),('vi',11,'Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!','Pariatur reprehenderit molestiae in quas molestias aspernatur alias. Praesentium facilis fuga non ipsum deserunt in. Et voluptas ea dolor vel. Quo earum culpa quam aut.','<h2>Dodo in an encouraging tone.</h2><p>Waiting in a low voice, to the little golden key in the lock, and to stand on your shoes and stockings for you now, dears? I\'m sure she\'s the best cat in the flurry of the house till she had not gone (We know it to his son, \'I feared it might end, you know,\' Alice gently remarked; \'they\'d have been ill.\' \'So they were,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, who felt very glad that it would make with the words \'DRINK ME,\' but nevertheless she uncorked it and put it to speak first, \'why your cat grins like that?\' \'It\'s a mineral, I THINK,\' said Alice. \'That\'s very curious!\' she thought. \'I must be a person of authority among them, called out, \'First witness!\' The first question of course had to be in a minute, trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had accidentally upset the milk-jug into his cup of tea, and looked at her, and she went on, \'What HAVE you been doing here?\' \'May it please your Majesty!\' the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-6-600x421.jpg\"></p><p>I don\'t like them raw.\' \'Well, be off, and Alice guessed who it was, and, as they were getting extremely small for a minute, trying to explain the mistake it had made. \'He took me for asking! No, it\'ll never do to hold it. As soon as she went on for some time without hearing anything more: at last came a little shaking among the distant sobs of the treat. When the pie was all about, and shouting \'Off with her face in her French lesson-book. The Mouse looked at the top of his teacup and.</p><h2>I only knew the right size.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-11-600x421.jpg\"></p><p>Adventures of hers would, in the world! Oh, my dear Dinah! I wonder what you\'re at!\" You know the way down one side and then dipped suddenly down, so suddenly that Alice quite hungry to look for her, and said, very gravely, \'I think, you ought to be an advantage,\' said Alice, seriously, \'I\'ll have nothing more happened, she decided to remain where she was terribly frightened all the first figure!\' said the Gryphon, sighing in his note-book, cackled out \'Silence!\' and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at it uneasily, shaking it every now and then, and holding it to annoy, Because he knows it teases.\' CHORUS. (In which the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice. \'Then you may SIT down,\' the King replied. Here the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Hatter, and, just as she could, \'If you please, sir--\' The Rabbit started.</p><h2>I suppose?\' said Alice. \'Of.</h2><h3>Alice, \'we learned French.</h3><p>The Duchess took her choice, and was going to dive in among the trees, a little of it?\' said the March Hare moved into the loveliest garden you ever saw. How she longed to get out again. Suddenly she came upon a little while, however, she again heard a voice she had drunk half the bottle, she found she had felt quite strange at first; but she did it at all. However, \'jury-men\' would have called him Tortoise because he taught us,\' said the Hatter, \'I cut some more of the gloves, and was in.</p><h3>Dormouse went on, yawning.</h3><p>Queen\'s voice in the other. \'I beg your acceptance of this sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very soon had to pinch it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare will be When they take us up and straightening itself out again, so she went on: \'But why did they live at the picture.) \'Up, lazy thing!\' said the Caterpillar, just as if she had somehow fallen into a graceful zigzag, and was.</p><h3>Pray, what is the capital of.</h3><p>Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit with pink eyes ran close by it, and kept doubling itself up and down in a hurry to change them--\' when she had but to get through was more hopeless than ever: she sat still just as I used--and I don\'t want to stay with it as you are; secondly, because she was looking about for some minutes. Alice thought she might as well she might, what a delightful thing a Lobster Quadrille is!\' \'No, indeed,\' said.</p><h3>Be off, or I\'ll kick you.</h3><p>YOUR shoes done with?\' said the Mock Turtle recovered his voice, and, with tears running down his face, as long as you are; secondly, because she was holding, and she hurried out of the bottle was NOT marked \'poison,\' so Alice went timidly up to Alice, they all moved off, and had no very clear notion how long ago anything had happened.) So she called softly after it, \'Mouse dear! Do come back and finish your story!\' Alice called out in a piteous tone. And the moral of that dark hall, and close.</p><h2>She was a different person.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>Queen, the royal children; there were any tears. No, there were any tears. No, there were a Duck and a Canary called out \'The race is over!\' and they repeated their arguments to her, still it was getting very sleepy; \'and they drew all manner of things--everything that begins with an M--\' \'Why with an M?\' said Alice. \'Anything you like,\' said the Hatter. \'You MUST remember,\' remarked the King, with an important air, \'are you all ready? This is the driest thing I ever was at the bottom of a.</p>'),('vi',12,'Đánh giá Apple iMac với màn hình Retina 5K','Vel magni occaecati fugiat vel repellat quis quis. Fuga non pariatur tempora veritatis corporis. Omnis veritatis vero fugiat dolor molestiae ipsum odit occaecati.','<h2>Will you, won\'t you, won\'t.</h2><p>Cat again, sitting on a branch of a muchness?\' \'Really, now you ask me,\' said Alice, a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in the night? Let me see: I\'ll give them a railway station.) However, she soon found an opportunity of saying to herself how this same little sister of hers would, in the direction it pointed to, without trying to fix on one, the cook tulip-roots instead of onions.\' Seven flung down his face, as long as I tell you, you coward!\' and at last she stretched her arms round it as you might catch a bad cold if she were saying lessons, and began singing in its hurry to change them--\' when she first saw the White Rabbit, \'but it doesn\'t matter much,\' thought Alice, \'as all the unjust things--\' when his eye chanced to fall a long silence after this, and she tried to get out again. That\'s all.\' \'Thank you,\' said the Gryphon, half to itself, half to Alice. \'What sort of chance of this, so that it made Alice quite jumped; but.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>I\'m not particular as to prevent its undoing itself,) she carried it off. * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice very politely; but she was now only ten inches high, and was just going to be, from one foot up the conversation a little. \'\'Tis so,\' said Alice. \'Why, SHE,\' said the Caterpillar. \'Is that the Queen shouted at the jury-box, or they would call after her: the last few minutes to see the Mock Turtle with a bound into the sky all the.</p><h2>On which Seven looked up.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>Soup,\" will you, won\'t you, won\'t you, will you, won\'t you, will you join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, this sort in her pocket, and pulled out a history of the month is it?\' Alice panted as she fell very slowly, for she thought, and rightly too, that very few things indeed were really impossible. There seemed to Alice again. \'No, I give you fair warning,\' shouted the Queen, tossing her head on her spectacles, and began to tremble. Alice looked very anxiously into her head. Still she went on, without attending to her, so she tried another question. \'What sort of chance of this, so that by the soldiers, who of course had to double themselves up and straightening itself out again, and looking at everything that Alice had learnt several things of this sort in her lessons in the sand with wooden spades, then a row of lamps hanging from the Gryphon, half to Alice. \'Nothing,\' said Alice. \'Did you say it.\' \'That\'s.</p><h2>Hatter, \'you wouldn\'t talk.</h2><h3>But the insolence of his.</h3><p>Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little bird as soon as look at it!\' This speech caused a remarkable sensation among the leaves, which she had to stop and untwist it. After a while she ran, as well as if it had lost something; and she dropped it hastily, just in time to avoid shrinking away altogether. \'That WAS a curious feeling!\' said Alice; \'that\'s not at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s hedgehog just now, only it ran away when it had.</p><h3>YOUR shoes done with?\' said.</h3><p>Said he thanked the whiting kindly, but he now hastily began again, using the ink, that was sitting on the slate. \'Herald, read the accusation!\' said the Queen, \'and he shall tell you just now what the name of nearly everything there. \'That\'s the judge,\' she said to the dance. Would not, could not, would not, could not, would not open any of them. However, on the hearth and grinning from ear to ear. \'Please would you like the look of things at all, at all!\' \'Do as I do,\' said the Cat. \'I\'d.</p><h3>Alice, and tried to open.</h3><p>They are waiting on the shingle--will you come to the porpoise, \"Keep back, please: we don\'t want to stay with it as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the most important piece of it appeared. \'I don\'t know what \"it\" means.\' \'I know SOMETHING interesting is sure to happen,\' she said to herself how this same little sister of hers would, in the same size for ten minutes together!\' \'Can\'t remember WHAT things?\'.</p><h3>I\'M a Duchess,\' she said.</h3><p>Alice was very provoking to find her in an offended tone. And she went on planning to herself how this same little sister of hers that you think you can find it.\' And she tried another question. \'What sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then quietly marched off after the rest of the others took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, to begin lessons: you\'d only have to turn round on its axis--\' \'Talking of axes,\'.</p><h2>The three soldiers wandered.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-19-600x421.jpg\"></p><p>Alice; \'but when you throw them, and he went on, without attending to her, one on each side, and opened their eyes and mouths so VERY tired of being upset, and their slates and pencils had been would have appeared to them to be a queer thing, to be Involved in this way! Stop this moment, I tell you!\' But she did not dare to laugh; and, as a partner!\' cried the Gryphon, with a smile. There was a different person then.\' \'Explain all that,\' he said in a loud, indignant voice, but she got back to.</p>'),('vi',13,'10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo','Ratione nesciunt tenetur repellat porro expedita. Odit quo illo eum. Rerum alias minima voluptas sed.',NULL),('vi',14,'Mở khóa Bí mật Bán được vé Cao','Ut aperiam ut sunt eum amet id provident sed. Neque molestias repudiandae soluta ipsum expedita rem ut. Tempore mollitia quod praesentium quo fugiat voluptatem quia dolor.',NULL),('vi',15,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Similique officia deleniti aut est quia. Nihil consequatur deserunt harum. Eveniet enim vel optio. Voluptatum officiis ut ut consequatur et sunt.','<h2>Dinah, tell me your history.</h2><p>There was no one else seemed inclined to say but \'It belongs to the garden with one eye, How the Owl had the dish as its share of the house, \"Let us both go to law: I will just explain to you to death.\"\' \'You are old,\' said the Caterpillar. Alice folded her hands, and began:-- \'You are old,\' said the Hatter. He came in with a bound into the book her sister on the trumpet, and called out, \'Sit down, all of you, and must know better\'; and this he handed over to herself, \'whenever I eat or drink under the hedge. In another minute the whole court was a large one, but it was her turn or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, jumping up and down looking for the accident of the words \'DRINK ME,\' but nevertheless she uncorked it and put it right; \'not that it was out of sight, he said in a whisper, half afraid that she wasn\'t a bit afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe you do either!\' And the Gryphon went on in the sand with wooden spades.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>Alice\'s shoulder, and it was quite pale (with passion, Alice thought), and it was indeed: she was getting so far off). \'Oh, my poor little thing grunted in reply (it had left off writing on his slate with one elbow against the ceiling, and had just begun to dream that she was quite surprised to see what was going to remark myself.\' \'Have you seen the Mock Turtle, and to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said the Caterpillar. \'I\'m afraid I can\'t remember,\'.</p><h2>However, this bottle does. I.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Mock Turtle. \'And how did you do lessons?\' said Alice, in a trembling voice:-- \'I passed by his garden.\"\' Alice did not at all for any of them. However, on the top of its little eyes, but it said in a deep voice, \'What are you getting on now, my dear?\' it continued, turning to Alice, that she began shrinking directly. As soon as she was holding, and she went in search of her sharp little chin. \'I\'ve a right to grow larger again, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. Alice was not much surprised at her hands, and she at once crowded round it, panting, and asking, \'But who has won?\' This question the Dodo solemnly, rising to its feet, ran round the court and got behind Alice as he shook both his shoes off. \'Give your evidence,\' the King put on your shoes and stockings for you now, dears? I\'m sure I can\'t take LESS,\' said the Caterpillar. Here was another puzzling question; and as it.</p><h2>I tell you, you coward!\' and.</h2><h3>INSIDE, you might like to.</h3><p>Her first idea was that you never to lose YOUR temper!\' \'Hold your tongue!\' added the Gryphon; and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, who at last turned sulky, and would only say, \'I am older than I am now? That\'ll be a great crowd assembled about them--all sorts of little animals and birds waiting outside. The poor little juror (it was exactly one a-piece all round. \'But she must have got altered.\' \'It is a raven like a star-fish,\' thought Alice. The King looked.</p><h3>Gryphon. \'Do you mean that.</h3><p>And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she walked off, leaving Alice alone with the Queen,\' and she grew no larger: still it had been, it suddenly appeared again. \'By-the-bye, what became of the pack, she could see it trying in a soothing tone: \'don\'t be angry about it. And yet I don\'t keep the same thing,\' said the Gryphon. Alice did not see anything that had slipped in like.</p><h3>The Mouse looked at poor.</h3><p>I was sent for.\' \'You ought to eat or drink anything; so I\'ll just see what was on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, \'and if it began ordering people about like mad things all this time, as it turned round and look up in her life before, and she sat down in a more subdued tone, and she went on in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\'.</p><h3>Duchess to play croquet with.</h3><p>Lory, as soon as look at the beginning,\' the King said to herself, \'I wish the creatures order one about, and make out what she was considering in her life before, and she trembled till she was appealed to by all three dates on their slates, and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to me! I\'LL soon make you a couple?\' \'You are old,\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'Come, let\'s try.</p><h2>They all sat down a jar from.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Duchess by this time, and was a very humble tone, going down on their slates, when the White Rabbit read out, at the Cat\'s head began fading away the moment she appeared; but she did it so VERY wide, but she had hoped) a fan and two or three of her age knew the meaning of half those long words, and, what\'s more, I don\'t want YOU with us!\"\' \'They were learning to draw, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Then it doesn\'t understand English,\' thought.</p>'),('vi',16,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Non deleniti molestias at fugiat. Veniam autem architecto aut sit. Atque omnis consectetur praesentium eum maiores saepe.',NULL);
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
INSERT INTO `request_logs` VALUES (1,404,'http://ultra-news.local/admin/login',1,NULL,NULL,'2025-05-18 14:00:38','2025-05-18 14:00:38'),(2,404,'http://ultra-news.local/admin',1,'[1]',NULL,'2025-05-26 13:27:27','2025-05-26 13:27:27');
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','4','2025-04-30 03:31:32','2025-04-30 03:31:32'),(2,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(3,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','4','2025-04-30 03:31:32','2025-04-30 03:31:32'),(4,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(5,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','5','2025-04-30 03:31:32','2025-04-30 03:31:32'),(6,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(7,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','5','2025-04-30 03:31:32','2025-04-30 03:31:32'),(8,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(9,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','3','2025-04-30 03:31:32','2025-04-30 03:31:32'),(10,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(11,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','2','2025-04-30 03:31:32','2025-04-30 03:31:32'),(12,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(13,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','2','2025-04-30 03:31:32','2025-04-30 03:31:32'),(14,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(15,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(16,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','2','2025-04-30 03:31:32','2025-04-30 03:31:32'),(17,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:32','2025-04-30 03:31:32'),(18,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','2','2025-04-30 03:31:33','2025-04-30 03:31:33'),(19,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(20,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','3','2025-04-30 03:31:33','2025-04-30 03:31:33'),(21,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(22,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','3','2025-04-30 03:31:33','2025-04-30 03:31:33'),(23,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(24,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','2','2025-04-30 03:31:33','2025-04-30 03:31:33'),(25,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(26,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','5','2025-04-30 03:31:33','2025-04-30 03:31:33'),(27,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(28,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','3','2025-04-30 03:31:33','2025-04-30 03:31:33'),(29,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(30,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','5','2025-04-30 03:31:33','2025-04-30 03:31:33'),(31,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(32,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','3','2025-04-30 03:31:33','2025-04-30 03:31:33'),(33,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(34,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','2','2025-04-30 03:31:33','2025-04-30 03:31:33'),(35,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(36,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','5','2025-04-30 03:31:33','2025-04-30 03:31:33'),(37,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(38,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:31:33','2025-04-30 03:31:33'),(39,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','3','2025-04-30 03:46:09','2025-04-30 03:46:09'),(40,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(41,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(42,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','4','2025-04-30 03:46:09','2025-04-30 03:46:09'),(43,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(44,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(45,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(46,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(47,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','3','2025-04-30 03:46:09','2025-04-30 03:46:09'),(48,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(49,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','5','2025-04-30 03:46:09','2025-04-30 03:46:09'),(50,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(51,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','5','2025-04-30 03:46:09','2025-04-30 03:46:09'),(52,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(53,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','5','2025-04-30 03:46:09','2025-04-30 03:46:09'),(54,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(55,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','3','2025-04-30 03:46:09','2025-04-30 03:46:09'),(56,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(57,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','2','2025-04-30 03:46:09','2025-04-30 03:46:09'),(58,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(59,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','3','2025-04-30 03:46:09','2025-04-30 03:46:09'),(60,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(61,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','4','2025-04-30 03:46:09','2025-04-30 03:46:09'),(62,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(63,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','3','2025-04-30 03:46:09','2025-04-30 03:46:09'),(64,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(65,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','5','2025-04-30 03:46:09','2025-04-30 03:46:09'),(66,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(67,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','5','2025-04-30 03:46:09','2025-04-30 03:46:09'),(68,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(69,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','2','2025-04-30 03:46:09','2025-04-30 03:46:09'),(70,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(71,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(72,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','5','2025-04-30 03:46:09','2025-04-30 03:46:09'),(73,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-04-30 03:46:09','2025-04-30 03:46:09'),(74,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','2','2025-05-03 11:43:59','2025-05-03 11:43:59'),(75,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(76,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','3','2025-05-03 11:43:59','2025-05-03 11:43:59'),(77,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(78,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(79,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','5','2025-05-03 11:43:59','2025-05-03 11:43:59'),(80,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(81,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(82,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','5','2025-05-03 11:43:59','2025-05-03 11:43:59'),(83,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(84,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','3','2025-05-03 11:43:59','2025-05-03 11:43:59'),(85,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(86,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','5','2025-05-03 11:43:59','2025-05-03 11:43:59'),(87,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(88,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','4','2025-05-03 11:43:59','2025-05-03 11:43:59'),(89,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(90,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','4','2025-05-03 11:43:59','2025-05-03 11:43:59'),(91,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(92,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(93,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','3','2025-05-03 11:43:59','2025-05-03 11:43:59'),(94,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(95,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','2','2025-05-03 11:43:59','2025-05-03 11:43:59'),(96,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(97,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','5','2025-05-03 11:43:59','2025-05-03 11:43:59'),(98,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(99,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','4','2025-05-03 11:43:59','2025-05-03 11:43:59'),(100,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(101,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','4','2025-05-03 11:43:59','2025-05-03 11:43:59'),(102,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(103,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','4','2025-05-03 11:43:59','2025-05-03 11:43:59'),(104,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(105,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','3','2025-05-03 11:43:59','2025-05-03 11:43:59'),(106,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(107,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','3','2025-05-03 11:43:59','2025-05-03 11:43:59'),(108,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(109,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','4','2025-05-03 11:43:59','2025-05-03 11:43:59'),(110,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 11:43:59','2025-05-03 11:43:59'),(111,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(112,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','3','2025-05-03 12:10:52','2025-05-03 12:10:52'),(113,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(114,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','3','2025-05-03 12:10:52','2025-05-03 12:10:52'),(115,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(116,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(117,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','2','2025-05-03 12:10:52','2025-05-03 12:10:52'),(118,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(119,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','4','2025-05-03 12:10:52','2025-05-03 12:10:52'),(120,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(121,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(122,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','4','2025-05-03 12:10:52','2025-05-03 12:10:52'),(123,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(124,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(125,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','4','2025-05-03 12:10:52','2025-05-03 12:10:52'),(126,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(127,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','3','2025-05-03 12:10:52','2025-05-03 12:10:52'),(128,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(129,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','3','2025-05-03 12:10:52','2025-05-03 12:10:52'),(130,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(131,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(132,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','3','2025-05-03 12:10:52','2025-05-03 12:10:52'),(133,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(134,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','3','2025-05-03 12:10:52','2025-05-03 12:10:52'),(135,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(136,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(137,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','5','2025-05-03 12:10:52','2025-05-03 12:10:52'),(138,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(139,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','3','2025-05-03 12:10:52','2025-05-03 12:10:52'),(140,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(141,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','4','2025-05-03 12:10:52','2025-05-03 12:10:52'),(142,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(143,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','5','2025-05-03 12:10:52','2025-05-03 12:10:52'),(144,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-05-03 12:10:52','2025-05-03 12:10:52'),(145,'Botble\\Blog\\Models\\Post',1,NULL,'author_id','1','5','2025-07-31 14:35:04','2025-07-31 14:35:04'),(146,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(147,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(148,'Botble\\Blog\\Models\\Post',3,NULL,'author_id','1','5','2025-07-31 14:35:04','2025-07-31 14:35:04'),(149,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(150,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(151,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','5','2025-07-31 14:35:04','2025-07-31 14:35:04'),(152,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(153,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','2','2025-07-31 14:35:04','2025-07-31 14:35:04'),(154,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(155,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','4','2025-07-31 14:35:04','2025-07-31 14:35:04'),(156,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(157,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(158,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(159,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','2','2025-07-31 14:35:04','2025-07-31 14:35:04'),(160,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(161,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','3','2025-07-31 14:35:04','2025-07-31 14:35:04'),(162,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(163,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','3','2025-07-31 14:35:04','2025-07-31 14:35:04'),(164,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(165,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(166,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','3','2025-07-31 14:35:04','2025-07-31 14:35:04'),(167,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(168,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','4','2025-07-31 14:35:04','2025-07-31 14:35:04'),(169,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(170,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','5','2025-07-31 14:35:04','2025-07-31 14:35:04'),(171,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(172,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','5','2025-07-31 14:35:04','2025-07-31 14:35:04'),(173,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(174,'Botble\\Blog\\Models\\Post',18,NULL,'author_id','1','5','2025-07-31 14:35:04','2025-07-31 14:35:04'),(175,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(176,'Botble\\Blog\\Models\\Post',19,NULL,'author_id','1','5','2025-07-31 14:35:04','2025-07-31 14:35:04'),(177,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04'),(178,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','4','2025-07-31 14:35:04','2025-07-31 14:35:04'),(179,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2025-07-31 14:35:04','2025-07-31 14:35:04');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"comment.index\":true,\"comment.create\":true,\"comment.edit\":true,\"comment.destroy\":true,\"comment-user.index\":true,\"comment-user.create\":true,\"comment-user.edit\":true,\"comment-user.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"member.index\":true,\"member.create\":true,\"member.edit\":true,\"member.destroy\":true,\"member.settings\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"post-collection.index\":true,\"post-collection.create\":true,\"post-collection.edit\":true,\"post-collection.destroy\":true,\"pro-posts.index\":true,\"pro-posts.create\":true,\"pro-posts.edit\":true,\"pro-posts.destroy\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-07-31 14:34:55','2025-07-31 14:34:55');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2025-07-31 14:34:55'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"ai-writer\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"comment\",\"contact\",\"cookie-consent\",\"gallery\",\"member\",\"newsletter\",\"post-collection\",\"post-scheduler\",\"pro-posts\",\"request-log\",\"rss-feed\",\"social-login\",\"toc\",\"translation\"]',NULL,'2025-07-31 14:34:55'),(4,'theme','ultra',NULL,'2025-07-31 14:34:55'),(5,'show_admin_bar','1',NULL,'2025-07-31 14:34:55'),(6,'language_hide_default','1',NULL,NULL),(7,'language_switcher_display','dropdown',NULL,NULL),(8,'language_display','all',NULL,NULL),(9,'language_hide_languages','[]',NULL,NULL),(10,'admin_logo','general/logo-white.png',NULL,NULL),(11,'admin_favicon','general/favicon.png',NULL,NULL),(14,'theme-ultra-site_title','UltraNews - Laravel News and Magazine Multilingual System','2025-07-31 14:35:08','2025-07-31 14:35:08'),(15,'theme-ultra-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.','2025-07-31 14:35:08','2025-07-31 14:35:08'),(16,'theme-ultra-seo_og_image','general/screenshot.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(17,'theme-ultra-copyright','©2025 UltraNews - ','2025-07-31 14:35:08','2025-07-31 14:35:08'),(18,'theme-ultra-designed_by','| Design by AliThemes','2025-07-31 14:35:08','2025-07-31 14:35:08'),(19,'theme-ultra-favicon','general/favicon.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(20,'theme-ultra-website','https://thesky9.com','2025-07-31 14:35:08','2025-07-31 14:35:08'),(21,'theme-ultra-contact_email','support@thesky9.com','2025-07-31 14:35:08','2025-07-31 14:35:08'),(22,'theme-ultra-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.','2025-07-31 14:35:08','2025-07-31 14:35:08'),(23,'theme-ultra-phone','+(123) 345-6789','2025-07-31 14:35:08','2025-07-31 14:35:08'),(24,'theme-ultra-email','contact@gmail.com','2025-07-31 14:35:08','2025-07-31 14:35:08'),(25,'theme-ultra-address','214 West Arnold St. New York, NY 10002','2025-07-31 14:35:08','2025-07-31 14:35:08'),(26,'theme-ultra-cookie_consent_message','Your experience on this site will be improved by allowing cookies ','2025-07-31 14:35:08','2025-07-31 14:35:08'),(27,'theme-ultra-cookie_consent_learn_more_url','http://localhost/cookie-policy','2025-07-31 14:35:08','2025-07-31 14:35:08'),(28,'theme-ultra-cookie_consent_learn_more_text','Cookie Policy','2025-07-31 14:35:08','2025-07-31 14:35:08'),(29,'theme-ultra-homepage_id','1','2025-07-31 14:35:08','2025-07-31 14:35:08'),(30,'theme-ultra-blog_page_id','4','2025-07-31 14:35:08','2025-07-31 14:35:08'),(31,'theme-ultra-single_layout','default','2025-07-31 14:35:08','2025-07-31 14:35:08'),(32,'theme-ultra-single_title_layout','top-full','2025-07-31 14:35:08','2025-07-31 14:35:08'),(33,'theme-ultra-action_title','All you need to build new site','2025-07-31 14:35:08','2025-07-31 14:35:08'),(34,'theme-ultra-action_button_text','Buy Now','2025-07-31 14:35:08','2025-07-31 14:35:08'),(35,'theme-ultra-action_button_url','https://codecanyon.net/user/thesky9','2025-07-31 14:35:08','2025-07-31 14:35:08'),(36,'theme-ultra-logo','general/logo.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(37,'theme-ultra-logo_mobile','general/logo-mobile.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(38,'theme-ultra-logo_tablet','general/logo-tablet.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(39,'theme-ultra-logo_white','general/logo-white.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(40,'theme-ultra-img_loading','general/img-loading.jpg','2025-07-31 14:35:08','2025-07-31 14:35:08'),(41,'theme-ultra-font_heading','Arimo','2025-07-31 14:35:08','2025-07-31 14:35:08'),(42,'theme-ultra-font_body','Roboto','2025-07-31 14:35:08','2025-07-31 14:35:08'),(43,'theme-ultra-color_primary','#87c6e3','2025-07-31 14:35:08','2025-07-31 14:35:08'),(44,'theme-ultra-color_secondary','#455265','2025-07-31 14:35:08','2025-07-31 14:35:08'),(45,'theme-ultra-color_success','#76e1c6','2025-07-31 14:35:08','2025-07-31 14:35:08'),(46,'theme-ultra-color_danger','#f0a9a9','2025-07-31 14:35:08','2025-07-31 14:35:08'),(47,'theme-ultra-color_warning','#e6bf7e','2025-07-31 14:35:08','2025-07-31 14:35:08'),(48,'theme-ultra-color_info','#58c1c8','2025-07-31 14:35:08','2025-07-31 14:35:08'),(49,'theme-ultra-color_light','#F3F3F3','2025-07-31 14:35:08','2025-07-31 14:35:08'),(50,'theme-ultra-color_dark','#111111','2025-07-31 14:35:08','2025-07-31 14:35:08'),(51,'theme-ultra-color_link','#222831','2025-07-31 14:35:08','2025-07-31 14:35:08'),(52,'theme-ultra-color_white','#FFFFFF','2025-07-31 14:35:08','2025-07-31 14:35:08'),(53,'theme-ultra-header_style','style-1','2025-07-31 14:35:08','2025-07-31 14:35:08'),(54,'theme-ultra-preloader_enabled','0','2025-07-31 14:35:08','2025-07-31 14:35:08'),(55,'theme-ultra-allow_account_login','yes','2025-07-31 14:35:08','2025-07-31 14:35:08'),(56,'theme-ultra-comment_type_in_post','member','2025-07-31 14:35:08','2025-07-31 14:35:08'),(57,'theme-ultra-recently_viewed_posts_enable','yes','2025-07-31 14:35:08','2025-07-31 14:35:08'),(58,'theme-ultra-vi-site_title','UltraNews - Laravel News and Magazine Multilingual System','2025-07-31 14:35:08','2025-07-31 14:35:08'),(59,'theme-ultra-vi-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.','2025-07-31 14:35:08','2025-07-31 14:35:08'),(60,'theme-ultra-vi-seo_og_image','general/screenshot.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(61,'theme-ultra-vi-copyright','©2025 Thiết kế bởi AliThemes ','2025-07-31 14:35:08','2025-07-31 14:35:08'),(62,'theme-ultra-vi-designed_by','| Design by AliThemes','2025-07-31 14:35:08','2025-07-31 14:35:08'),(63,'theme-ultra-vi-favicon','general/favicon.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(64,'theme-ultra-vi-website','https://thesky9.com','2025-07-31 14:35:08','2025-07-31 14:35:08'),(65,'theme-ultra-vi-contact_email','support@thesky9.com','2025-07-31 14:35:08','2025-07-31 14:35:08'),(66,'theme-ultra-vi-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.','2025-07-31 14:35:08','2025-07-31 14:35:08'),(67,'theme-ultra-vi-phone','+(123) 345-6789','2025-07-31 14:35:08','2025-07-31 14:35:08'),(68,'theme-ultra-vi-email','contact@gmail.com','2025-07-31 14:35:08','2025-07-31 14:35:08'),(69,'theme-ultra-vi-address','214 West Arnold St. New York, NY 10002','2025-07-31 14:35:08','2025-07-31 14:35:08'),(70,'theme-ultra-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ','2025-07-31 14:35:08','2025-07-31 14:35:08'),(71,'theme-ultra-vi-cookie_consent_learn_more_url','http://localhost/cookie-policy','2025-07-31 14:35:08','2025-07-31 14:35:08'),(72,'theme-ultra-vi-cookie_consent_learn_more_text','Cookie Policy','2025-07-31 14:35:08','2025-07-31 14:35:08'),(73,'theme-ultra-vi-homepage_id','1','2025-07-31 14:35:08','2025-07-31 14:35:08'),(74,'theme-ultra-vi-blog_page_id','4','2025-07-31 14:35:08','2025-07-31 14:35:08'),(75,'theme-ultra-vi-single_layout','default','2025-07-31 14:35:08','2025-07-31 14:35:08'),(76,'theme-ultra-vi-single_title_layout','top-full','2025-07-31 14:35:08','2025-07-31 14:35:08'),(77,'theme-ultra-vi-logo','general/logo.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(78,'theme-ultra-vi-logo_mobile','general/logo-mobile.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(79,'theme-ultra-vi-logo_tablet','general/logo-tablet.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(80,'theme-ultra-vi-logo_white','general/logo-white.png','2025-07-31 14:35:08','2025-07-31 14:35:08'),(81,'theme-ultra-vi-action_title','Bạn cần tạo mới website','2025-07-31 14:35:08','2025-07-31 14:35:08'),(82,'theme-ultra-vi-action_button_text','Mua Ngay','2025-07-31 14:35:08','2025-07-31 14:35:08'),(83,'theme-ultra-vi-action_button_url','https://codecanyon.net/user/thesky9','2025-07-31 14:35:08','2025-07-31 14:35:08'),(84,'theme-ultra-vi-font_heading','Arimo','2025-07-31 14:35:08','2025-07-31 14:35:08'),(85,'theme-ultra-vi-font_body','Roboto','2025-07-31 14:35:08','2025-07-31 14:35:08'),(86,'theme-ultra-vi-color_brand_1','#ffcda3','2025-07-31 14:35:08','2025-07-31 14:35:08'),(87,'theme-ultra-vi-color_brand_2','#fce2ce','2025-07-31 14:35:08','2025-07-31 14:35:08'),(88,'theme-ultra-vi-color_brand_3','#ffede5','2025-07-31 14:35:08','2025-07-31 14:35:08'),(89,'theme-ultra-vi-color_brand_4','#fff5ef','2025-07-31 14:35:08','2025-07-31 14:35:08'),(90,'theme-ultra-vi-color_primary','#87c6e3','2025-07-31 14:35:08','2025-07-31 14:35:08'),(91,'theme-ultra-vi-color_secondary','#455265','2025-07-31 14:35:08','2025-07-31 14:35:08'),(92,'theme-ultra-vi-color_success','#76e1c6','2025-07-31 14:35:08','2025-07-31 14:35:08'),(93,'theme-ultra-vi-color_danger','#f0a9a9','2025-07-31 14:35:08','2025-07-31 14:35:08'),(94,'theme-ultra-vi-color_warning','#e6bf7e','2025-07-31 14:35:08','2025-07-31 14:35:08'),(95,'theme-ultra-vi-color_info','#58c1c8','2025-07-31 14:35:08','2025-07-31 14:35:08'),(96,'theme-ultra-vi-color_light','#F3F3F3','2025-07-31 14:35:08','2025-07-31 14:35:08'),(97,'theme-ultra-vi-color_dark','#111111','2025-07-31 14:35:08','2025-07-31 14:35:08'),(98,'theme-ultra-vi-color_link','#222831','2025-07-31 14:35:08','2025-07-31 14:35:08'),(99,'theme-ultra-vi-color_white','#FFFFFF','2025-07-31 14:35:08','2025-07-31 14:35:08'),(100,'theme-ultra-vi-header_style','style-1','2025-07-31 14:35:08','2025-07-31 14:35:08'),(101,'theme-ultra-vi-preloader_enabled','0','2025-07-31 14:35:08','2025-07-31 14:35:08'),(102,'theme-ultra-vi-allow_account_login','yes','2025-07-31 14:35:08','2025-07-31 14:35:08'),(103,'theme-ultra-vi-comment_type_in_post','member','2025-07-31 14:35:08','2025-07-31 14:35:08'),(104,'theme-ultra-vi-recently_viewed_posts_enable','yes','2025-07-31 14:35:08','2025-07-31 14:35:08'),(105,'theme-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(106,'theme-vi-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(107,'media_random_hash','57b5f9d648806aea74de29d751f95cb1',NULL,NULL),(108,'comment_enable','1',NULL,NULL),(109,'comment_menu_enable','[\"Botble\\\\Blog\\\\Models\\\\Post\"]',NULL,NULL),(110,'plugin_comment_copyright','',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`),
  KEY `idx_slugs_reference` (`reference_type`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage',1,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(2,'home-2',2,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(3,'home-3',3,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(4,'blog',4,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(5,'category-list',5,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(6,'category-grid',6,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(7,'category-metro',7,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(8,'contact',8,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(9,'about-us',9,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(10,'cookie-policy',10,'Botble\\Page\\Models\\Page','','2025-07-31 14:34:56','2025-07-31 14:34:56'),(11,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-31 14:34:57','2025-07-31 14:34:57'),(12,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-31 14:34:57','2025-07-31 14:34:57'),(13,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-31 14:34:57','2025-07-31 14:34:57'),(14,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-31 14:34:57','2025-07-31 14:34:57'),(15,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-31 14:34:57','2025-07-31 14:34:57'),(16,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2025-07-31 14:34:57','2025-07-31 14:34:57'),(17,'design',1,'Botble\\Blog\\Models\\Category','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(18,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(19,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(20,'healthy',4,'Botble\\Blog\\Models\\Category','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(21,'fashion',5,'Botble\\Blog\\Models\\Category','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(22,'hotel',6,'Botble\\Blog\\Models\\Category','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(23,'nature',7,'Botble\\Blog\\Models\\Category','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(24,'general',1,'Botble\\Blog\\Models\\Tag','tag','2025-07-31 14:35:00','2025-07-31 14:35:00'),(25,'beauty',2,'Botble\\Blog\\Models\\Tag','tag','2025-07-31 14:35:00','2025-07-31 14:35:00'),(26,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2025-07-31 14:35:00','2025-07-31 14:35:00'),(27,'lifestyle',4,'Botble\\Blog\\Models\\Tag','tag','2025-07-31 14:35:00','2025-07-31 14:35:00'),(28,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2025-07-31 14:35:00','2025-07-31 14:35:00'),(29,'business',6,'Botble\\Blog\\Models\\Tag','tag','2025-07-31 14:35:00','2025-07-31 14:35:00'),(30,'health',7,'Botble\\Blog\\Models\\Tag','tag','2025-07-31 14:35:00','2025-07-31 14:35:00'),(31,'this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',1,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(32,'the-world-caters-to-average-people-and-mediocre-lifestyles',2,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(33,'not-a-bit-of-hesitation-you-better-think-twice',3,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(34,'we-got-a-right-to-pick-a-little-fight-bonanza',4,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(35,'my-entrance-exam-was-on-a-book-of-matches',5,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(36,'essential-qualities-of-highly-successful-music',6,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(37,'why-teamwork-really-makes-the-dream-work',7,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(38,'9-things-i-love-about-shaving-my-head-during-quarantine',8,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(39,'the-litigants-on-the-screen-are-not-actors',9,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(40,'imagine-losing-20-pounds-in-14-days',10,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(41,'are-you-still-using-that-slow-old-typewriter',11,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(42,'a-skin-cream-thats-proven-to-work',12,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(43,'10-reasons-to-start-your-own-profitable-website',13,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(44,'level-up-your-live-streams-with-automated-captions-and-more',14,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(45,'simple-ways-to-reduce-your-unwanted-wrinkles',15,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(46,'apple-imac-with-retina-5k-display-review',16,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(47,'10000-web-site-visitors-in-one-monthguaranteed',17,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(48,'unlock-the-secrets-of-selling-high-ticket-items',18,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(49,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',19,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(50,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',20,'Botble\\Blog\\Models\\Post','','2025-07-31 14:35:00','2025-07-31 14:35:00'),(51,'smith',1,'Botble\\Member\\Models\\Member','author','2025-07-31 14:35:01','2025-07-31 14:35:08'),(52,'oreilly',2,'Botble\\Member\\Models\\Member','author','2025-07-31 14:35:02','2025-07-31 14:35:08'),(53,'quitzon',3,'Botble\\Member\\Models\\Member','author','2025-07-31 14:35:02','2025-07-31 14:35:08'),(54,'bailey',4,'Botble\\Member\\Models\\Member','author','2025-07-31 14:35:03','2025-07-31 14:35:08'),(55,'gulgowski',5,'Botble\\Member\\Models\\Member','author','2025-07-31 14:35:04','2025-07-31 14:35:08'),(56,'nolan',6,'Botble\\Member\\Models\\Member','author','2025-07-31 14:35:04','2025-07-31 14:35:08'),(57,'editors-picked',1,'Botble\\Page\\Models\\Page','','2025-07-31 14:35:07','2025-07-31 14:35:07'),(58,'recommended-posts',2,'Botble\\Page\\Models\\Page','','2025-07-31 14:35:07','2025-07-31 14:35:07'),(59,'bai-viet-hay',3,'Botble\\Page\\Models\\Page','','2025-07-31 14:35:07','2025-07-31 14:35:07'),(60,'recommended-posts',4,'Botble\\Page\\Models\\Page','','2025-07-31 14:35:07','2025-07-31 14:35:07'),(61,'editors-picked',1,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2025-07-31 14:35:08','2025-07-31 14:35:08'),(62,'recommended-posts',2,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2025-07-31 14:35:08','2025-07-31 14:35:08'),(63,'bai-viet-hay',3,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2025-07-31 14:35:08','2025-07-31 14:35:08'),(64,'recommended-posts',4,'Botble\\PostCollection\\Models\\PostCollection','posts-collection','2025-07-31 14:35:08','2025-07-31 14:35:08');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-31 14:35:00','2025-07-31 14:35:00'),(2,'Beauty',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-31 14:35:00','2025-07-31 14:35:00'),(3,'Fashion',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-31 14:35:00','2025-07-31 14:35:00'),(4,'Lifestyle',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-31 14:35:00','2025-07-31 14:35:00'),(5,'Travel',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-31 14:35:00','2025-07-31 14:35:00'),(6,'Business',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-31 14:35:00','2025-07-31 14:35:00'),(7,'Health',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-07-31 14:35:00','2025-07-31 14:35:00');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Làm đẹp',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Du lịch và ẩm thực',NULL),('vi',5,'Kinh doanh',NULL),('vi',6,'Sức khỏe',NULL),('vi',7,'Thời sự',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_settings_user_type_user_id_key_unique` (`user_type`,`user_id`,`key`),
  KEY `user_settings_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `user_settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'zhaley@streich.com',NULL,NULL,'$2y$12$DpHhpvKrnkMTtvrr5qvPvO7bP/FdgYuF1RbLrfyn3oxQ6LsabxOFm',NULL,'2025-07-31 14:34:55','2025-07-31 14:34:55','Makenna','Yundt','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SocialsWidget','primary_sidebar','ultra',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(2,'AdsWidget','primary_sidebar','ultra',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(3,'CategoriesMenuWidget','primary_sidebar','ultra',0,'{\"id\":\"CategoriesMenuWidget\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(4,'LastestPostsWidget','primary_sidebar','ultra',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"Lastest Post\",\"number_display\":6}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(5,'TagsWidget','primary_sidebar','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":10}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(6,'AdsWidget','primary_sidebar','ultra',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(7,'AboutWidget','footer_sidebar_1','ultra',1,'{\"id\":\"AboutWidget\",\"name\":\"About me\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(8,'PopularPostsWidget','footer_sidebar_2','ultra',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"Popular Posts\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(9,'CustomMenuWidget','footer_sidebar_3','ultra',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(10,'TagsWidget','footer_sidebar_3','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(11,'NewsletterWidget','footer_sidebar_4','ultra',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(12,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(13,'SocialsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(14,'AdsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(15,'CategoriesMenuWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"CategoriesMenuWidget\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(16,'LastestPostsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi nh\\u1ea5t\",\"number_display\":6}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(17,'TagsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Th\\u1ebb\",\"number_display\":10}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(18,'AdsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(19,'AboutWidget','footer_sidebar_1','ultra-vi',1,'{\"id\":\"AboutWidget\",\"name\":\"V\\u1ec1 ch\\u00fang t\\u00f4i\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(20,'PopularPostsWidget','footer_sidebar_2','ultra-vi',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"N\\u1ed5i b\\u1eadt\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(21,'CustomMenuWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(22,'TagsWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(23,'NewsletterWidget','footer_sidebar_4','ultra-vi',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2025-07-31 14:35:07','2025-07-31 14:35:07'),(24,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra-vi',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2025-07-31 14:35:07','2025-07-31 14:35:07');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 21:39:35
