-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.11-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour fastfood
CREATE DATABASE IF NOT EXISTS `fastfood` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fastfood`;

-- Listage de la structure de la table fastfood. cartes
CREATE TABLE IF NOT EXISTS `cartes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. cartes_items
CREATE TABLE IF NOT EXISTS `cartes_items` (
  `carte_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  KEY `FK_cartes_items_cartes` (`carte_id`),
  KEY `FK_cartes_items_items` (`item_id`),
  CONSTRAINT `FK_cartes_items_cartes` FOREIGN KEY (`carte_id`) REFERENCES `cartes` (`id`),
  CONSTRAINT `FK_cartes_items_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. cmd_items
CREATE TABLE IF NOT EXISTS `cmd_items` (
  `cmd_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  KEY `FK_cmd_items_commandes` (`cmd_id`),
  KEY `FK_cmd_items_items` (`item_id`),
  CONSTRAINT `FK_cmd_items_commandes` FOREIGN KEY (`cmd_id`) REFERENCES `commandes` (`id`),
  CONSTRAINT `FK_cmd_items_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. cmd_menus
CREATE TABLE IF NOT EXISTS `cmd_menus` (
  `cmd_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  KEY `FK_cmd_menus_commandes` (`cmd_id`),
  KEY `FK_cmd_menus_menus` (`menu_id`),
  CONSTRAINT `FK_cmd_menus_commandes` FOREIGN KEY (`cmd_id`) REFERENCES `commandes` (`id`),
  CONSTRAINT `FK_cmd_menus_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. commandes
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `paiement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_commandes_restaurants` (`restaurant_id`),
  KEY `FK_commandes_paiements` (`paiement_id`),
  CONSTRAINT `FK_commandes_paiements` FOREIGN KEY (`paiement_id`) REFERENCES `paiements` (`id`),
  CONSTRAINT `FK_commandes_restaurants` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. fonctions
CREATE TABLE IF NOT EXISTS `fonctions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `prix_achat` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. ingredients_items
CREATE TABLE IF NOT EXISTS `ingredients_items` (
  `ingredient_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `quant_par_itm` decimal(10,2) NOT NULL,
  KEY `FK_ingredients_items_ingredients` (`ingredient_id`),
  KEY `FK_ingredients_items_items` (`item_id`),
  CONSTRAINT `FK_ingredients_items_ingredients` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `FK_ingredients_items_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_type_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix_vente` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_items_items_type` (`items_type_id`),
  CONSTRAINT `FK_items_items_type` FOREIGN KEY (`items_type_id`) REFERENCES `items_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. items_type
CREATE TABLE IF NOT EXISTS `items_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `boisson_id` int(11) NOT NULL,
  `dessert_id` int(11) NOT NULL,
  `prix_vente` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_menus_items` (`plat_id`),
  KEY `FK_menus_items_2` (`boisson_id`),
  KEY `FK_menus_items_3` (`dessert_id`),
  CONSTRAINT `FK_menus_items` FOREIGN KEY (`plat_id`) REFERENCES `items` (`id`),
  CONSTRAINT `FK_menus_items_2` FOREIGN KEY (`boisson_id`) REFERENCES `items` (`id`),
  CONSTRAINT `FK_menus_items_3` FOREIGN KEY (`dessert_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. paiements
CREATE TABLE IF NOT EXISTS `paiements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. postes
CREATE TABLE IF NOT EXISTS `postes` (
  `salarie_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `fonction_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `formation` tinyint(1) NOT NULL,
  KEY `FK_postes_salaries` (`salarie_id`),
  KEY `FK_postes_fonctions` (`fonction_id`),
  KEY `FK_postes_restaurants` (`restaurant_id`),
  CONSTRAINT `FK_postes_fonctions` FOREIGN KEY (`fonction_id`) REFERENCES `fonctions` (`id`),
  CONSTRAINT `FK_postes_restaurants` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`),
  CONSTRAINT `FK_postes_salaries` FOREIGN KEY (`salarie_id`) REFERENCES `salaries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. restaurants
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `places` int(11) NOT NULL,
  `esp_enf` tinyint(1) NOT NULL,
  `borne_rapide` tinyint(1) NOT NULL,
  `mobi_reduite` tinyint(1) NOT NULL,
  `parking` tinyint(1) NOT NULL,
  `country` varchar(2) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `carte_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_restaurants_cartes` (`carte_id`),
  CONSTRAINT `FK_restaurants_cartes` FOREIGN KEY (`carte_id`) REFERENCES `cartes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. salaires
CREATE TABLE IF NOT EXISTS `salaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  `salaire` decimal(10,2) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `salarie_id` int(11) NOT NULL,
  `annee` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_salaires_salaries` (`manager_id`),
  KEY `FK_salaires_salaries_2` (`salarie_id`),
  CONSTRAINT `FK_salaires_salaries` FOREIGN KEY (`manager_id`) REFERENCES `salaries` (`id`),
  CONSTRAINT `FK_salaires_salaries_2` FOREIGN KEY (`salarie_id`) REFERENCES `salaries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. salaries
CREATE TABLE IF NOT EXISTS `salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) NOT NULL,
  `address_city` varchar(50) NOT NULL,
  `address_postcode` varchar(50) NOT NULL,
  `country` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table fastfood. stock
CREATE TABLE IF NOT EXISTS `stock` (
  `restaurant_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantite_stock` decimal(10,2) NOT NULL,
  KEY `FK_stock_restaurants` (`restaurant_id`),
  KEY `FK_stock_ingredients` (`ingredient_id`),
  CONSTRAINT `FK_stock_ingredients` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `FK_stock_restaurants` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
