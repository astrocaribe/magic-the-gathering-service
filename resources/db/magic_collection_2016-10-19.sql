# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: magic-identifier.c1ipxcdkvpzn.us-east-1.rds.amazonaws.com (MySQL 5.7.11-log)
# Database: magic_collection
# Generation Time: 2016-10-20 00:58:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table card_colors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_colors`;

CREATE TABLE `card_colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `card_id` int(11) unsigned NOT NULL,
  `color_1` varchar(16) DEFAULT NULL,
  `color_2` varchar(16) DEFAULT NULL,
  `color_3` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `card_color_relationship` (`card_id`),
  CONSTRAINT `card_color_relationship` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `card_colors` WRITE;
/*!40000 ALTER TABLE `card_colors` DISABLE KEYS */;

INSERT INTO `card_colors` (`id`, `card_id`, `color_1`, `color_2`, `color_3`)
VALUES
	(1,1,'Blue',NULL,NULL),
	(2,2,'White',NULL,NULL),
	(3,3,'Blue',NULL,NULL),
	(4,4,'White',NULL,NULL),
	(5,5,'Black',NULL,NULL),
	(6,6,'Green',NULL,NULL),
	(8,7,'Black',NULL,NULL),
	(9,8,'Red',NULL,NULL),
	(10,9,'Green',NULL,NULL),
	(11,10,'Black',NULL,NULL),
	(12,11,'Blue',NULL,NULL),
	(13,12,'Black',NULL,NULL),
	(14,13,'Green','White',NULL),
	(15,14,'Black',NULL,NULL),
	(16,15,NULL,NULL,NULL),
	(17,16,NULL,NULL,NULL),
	(18,17,'Blue',NULL,NULL),
	(19,18,'White',NULL,NULL),
	(20,19,'Blue',NULL,NULL),
	(21,20,'Black',NULL,NULL),
	(22,21,'White',NULL,NULL),
	(23,22,'Green',NULL,NULL),
	(24,23,'Black',NULL,NULL),
	(25,24,'Red',NULL,NULL),
	(26,25,'Green',NULL,NULL),
	(27,26,'White',NULL,NULL),
	(28,27,'Blue',NULL,NULL),
	(30,28,'Green','Blue',NULL),
	(31,29,'Red',NULL,NULL),
	(32,30,'Red',NULL,NULL),
	(33,31,'Red',NULL,NULL),
	(34,32,NULL,NULL,NULL);

/*!40000 ALTER TABLE `card_colors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cards`;

CREATE TABLE `cards` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '',
  `mana_cost` varchar(16) DEFAULT NULL,
  `converted_mana_cost` int(2) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `sub_type` varchar(32) DEFAULT NULL,
  `text` mediumtext,
  `flavor_text` mediumtext,
  `expansion` varchar(32) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `toughness` int(11) DEFAULT NULL,
  `rarity` varchar(16) DEFAULT NULL,
  `quantity` int(16) DEFAULT NULL,
  `card_number` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;

INSERT INTO `cards` (`id`, `name`, `mana_cost`, `converted_mana_cost`, `type`, `sub_type`, `text`, `flavor_text`, `expansion`, `power`, `toughness`, `rarity`, `quantity`, `card_number`)
VALUES
	(1,'Press For Answers','{1}{U}',2,'Sorcery',NULL,'Tap target creature. It doesn\'t untap during its controller\'s next untap step.\n\nInvestigate. (Put a colorless Clue artifact token onto the battlefield with \"2, Sacrifice this artifact: Draw a card.\")','','Shadows Over Innistrad',NULL,NULL,'Common',1,'80'),
	(2,'Inquisitor\'s Ox','{3}{W}',4,'Creature','Ox','Delurium - Inquisitor\'s Ox gets +1/+0 and has vigilance as long as there are four or more card types among cards in your graveyard.','Many fields now lie fallow in Gavony, as the oxen have been confiscated to perform other duties.','Shadows Over Innistrad',2,5,'Common',1,'24'),
	(3,'Just The Wind','{1}{U}',2,'Instant',NULL,'Return target creature to it\'s owner\'s hand.\n\nMadness (Blue card) (If you discard this card, discard it into exile. When you do, cast it for its madness cost or put it into your graveyard.)','\"There is nothing to worry about.\"','Shadows Over Innistrad',NULL,NULL,'Common',1,'71'),
	(4,'Apothecary Geist','{3}{W}',4,'Creature','Spirit','Flying\n\nWhen Apothecary Geist enters the battlefield, if you control another Spirit, you gain 3 life.','For some customers, the old apothecary shop still opens its doors.','Shadows Over Innistrad',2,3,'Common',1,'4'),
	(5,'Ghoulcaller\'s Accomplice','{1}{B}',2,'Creature','Human Rouge','3 {Black}, Exile Ghoulcaller\'s Accomplice from your graveyard: Put a 2/2 black Zombie creature token onto the battlefield. Activate this ability only any time you could cast a sorcery.','\"Once in the box, we\'re all the same.\"','Shadows Over Innistrad',2,2,'Common',1,'112'),
	(6,'Kessig Dire Swine','{4}{G}{G}',6,'Creature','Boar Horror','Delirium - Kessig Dire Swine has trample as long as there are four or more card types among cards in your graveyard.','In the quiet of the Somberwald, new horrors stir.','Shadows Over Innistrad',6,6,'Common',1,'214'),
	(7,'Dead Weight','{B}',1,'Enchantment','Aura','Enchantment Creature\n\nEnchanted Creature gets -2/-2.','\"Dungeons and cages offer far too little sport.\"\n- Relio Voldaren','Shadows Over Innistrad',NULL,NULL,'Common',1,'106'),
	(8,'Ember-Eye Wolf','{1}{R}',2,'Creature','Wolf','Haste\n\n1 {Red}: Ember-Eye Wolf gets +2/+0 until end of turn.','No howl. No snarl. Just the roar of flames.','Shadows Over Innistrad',1,2,'Common',1,'154'),
	(9,'Equestrian Skill','{3}{G}',4,'Enchantment','Aura','Enchant Creature\n\nEnchanted creature gets +3/+3.\n\nAs long as enchanted creature is a Human, it has trample.','From the jagged peaks of Stensia, to the tangled woods of Kessig, to the bogs of Nephalia, the Gavony Riders prepare for all terrain.\n','Shadows Over Innistrad',NULL,NULL,'Common',1,'204'),
	(10,'Gisa\'s Bidding','{2}{B}{B}',4,'Sorcery',NULL,'Madness 2 {Black} (If you discard this cars, discard it into exile. When you do, cast it fo its madness cost or put in into your graveyard.)','\"Sotf dirt makes for light work.\"','Shadows Over Innistrad',NULL,NULL,'Uncommon',1,'114'),
	(11,'Trail Of Evidence','{2}{U}',3,'Enchantment',NULL,'Whenever you cast an instant or sorcery spell, investigate. (Put a colorless Clue artifact token onto the battlefield with \"2, Sacrifice this artifact: Draw a card.\")','\"Every answer seems to lead to a more terrifying question.\"\n- Jace Beledren','Shadows Over Innistrad',NULL,NULL,'Uncommon',1,'93'),
	(12,'Biting Rain','{2}{B}{B}',4,'Sorcery',NULL,'All creatures get -2/-2 until end of turn.\n\nMadness 2 Black (If you discard this card, discard it into exile. When you do, cast it for its madness cost or put it into your graveyard.)','On Innistrad, it is seldom wrong to stay indoors.','Shadows Over Innistrad',NULL,NULL,'Uncommon',1,'102'),
	(13,'Fortified Village',NULL,NULL,'Land',NULL,'As Fortified Village enters the battlefield, you may reveal a Forest or Plains card from your hand. If you don\'t, Fortified Village enters the battlefield tapped.\n\n(tap): Add Green or White to your mana pool.','','Shadows Over Innistrad',NULL,NULL,'Rare',1,'274'),
	(14,'Accursed Witch - DFC','{3}{B}',4,'Creature','Human Shaman','Spells your opponents cast that target Accursed Witch cost 1 less to cast.\n\nWhen Accursed Witch dies, return it to the battlefield transformed under your control attached to target opponent.','','Shadows Over Innistrad',4,2,'Uncommon',1,'97a'),
	(15,'Infectious Curse - DFC',NULL,NULL,'Enchantment','Aura Curse','Enchant player\n\nSpells you cast that target enchanted player costs 1 less cast.\n\nAt the beginning of enchanted player\'s upkeep, that player loses 1 life and you gain 1 life.','','Shadows Over Innistrad',NULL,NULL,'Uncommon',1,'97b'),
	(16,'Spirit',NULL,NULL,'Token Creature','Spirit','Flying','','Shadows Over Innistrad',NULL,NULL,'Common',1,'3T'),
	(17,'Niblis Of Dusk','{2}{U}',3,'Creature','Spirit','Flying\n\nProwess (Whenever you cast a noncreature spell, this creature gets +1/+1 until end of turn.)','It fuels its lanterns by leaching the warmth from its surroundings.','Shadows Over Innistrad',2,1,'Common',1,'76'),
	(18,'Unruly Mob','{1}{W}',2,'Creature','Human','Whenever aother creature you control dies, put a +1/+1 counter on Unruly Mob.','\"Those who aren\'t welcome will know it!\"\n- Kolman, elder of Gatstaf','Shadows Over Innistrad',1,1,'Common',1,'47'),
	(19,'Pieces Of The Puzzle','{2}{B}',3,'Sorcery',NULL,'Reveal the top five cards of your library. Put up to two instant and/or sorcery cards from among them into your hand and the rest into your graveyard.','\"The clues have begun to reveal a truth I hesitate to accept.\"','Shadows Over Innistrad',NULL,NULL,'Common',1,'78'),
	(20,'Sanitarium Skeleton','{B}',1,'Creature','Skeleton','2 {Black}: Return Sanitarium Skeleton from your graveyard to your hand.','His mind was lost long before his flesh.','Shadows Over Innistrad',1,2,'Common',1,'133'),
	(21,'Moorland Drifter','{1}{W}',2,'Creature','Spirit','Delirium - Moorland Drifter has flying as long as there are four or more card types among cards in you graveyard.','It has no apparent purpose or direction. It simply drifts, buoyed by breezes both tangible and otherworldy.','Shadows Over Innistrad',2,2,'Common',1,'27'),
	(22,'Root Out','{2}{G}',3,'Sorcery',NULL,'Destroy target artifact or enchantment.\n\nInvestigate. (Put a colorless Clue artifact token onto the battlefield with \"2, Sacrifice this artifact: Draw a card.\")','','Shadows Over Innistrad',NULL,NULL,'Common',1,'224'),
	(23,'Rottenheart Ghoul','{3}{B}',4,'Creature','Zombie','When Rottenheart Ghoul dies, target player discards a card.','\"To die failing to save a loved one is just so sad - or, more to the point, pathetic.\"\n- Liliana Vess','Shadows Over Innistrad',2,4,'Common',1,'132'),
	(24,'Reduce to Ashes','{4}{R}',5,'Sorcery',NULL,'Reduce Tot Ashes deals 5 damage to target creature. If that creature would die this turn, exile it instead.','Previously the training center for the cathars, the Elgaud Grounds are now used by the Lunarch Inquisition to punish those considered to be heretics.','Shadows Over Innistrad',NULL,NULL,'Common',1,'176'),
	(25,'Rabid Bite','{1}{G}',2,'Sorcery',NULL,'Target creature you control deals damage equal to its power to target creature you don\'t control.','\"You should have seen the look on both their faces.\"\n- Morkamp, Lambholt inkeeper','Shadows Over Innistrad',NULL,NULL,'Common',1,'223'),
	(26,'Reaper of Flight Moonsilver','{3}{W}{W}',5,'Creature','Angel','Flying\n\nDelirium - Sacrifice another creature: Reper of Flight Moonsilver gets +2/+1 until the end of turn. Activate this ability only if there are four or more card types among cards in your graveyard.','','Shadows Over Innistrad',3,3,'Uncommon',1,'36'),
	(27,'Rise from the Tides','{5}{U}',6,'Sorcery',NULL,'Put a 2/2 black Zombie creature token onto the battlefield tapped for each instant and socery card in your graveyard.','\"Dear brother, it\'s sweet that you have chosen to share your tous with Ludevic, but I too have found some new playmates.\"\n- Ghoulcaller Gisa','Shadows Over Innistrad',NULL,NULL,'Uncommon',1,'83'),
	(28,'Woodland Stream',NULL,NULL,'Land',NULL,'Woodland Stream enters the battlefield tapped.\n\n(tap): Add Green or Blue to your mana pool.','Two creaking waterwheels herald the approach to Briarbridge through the Ulvenwald.','Shadows Over Innistrad',NULL,NULL,'Uncommon',1,'282'),
	(29,'Avacyn\'s Judgement','{1}{R}',2,'Sorcery',NULL,'Madness X {Red} (If you discard this card, discard it into exile. When you do, cast it for its madness cost or out it into your graveyard.)\n\nAvacyn\'s Judgement deals 2 damage divided as you choose among any number of target creatures and/or players. If Avacyn\'s Judgement\'s madness cost was paid, it deals X damage divided as you choose among those creatures and/or players instead.','','Shadows Over Innistrad',NULL,NULL,'Rare',1,'145'),
	(30,'Gatstaf Arsonists - DFC','{4}{R}',5,'Creature','Human Werewolf','At the beginning of each upkeep, if no spells were cast last turn, transform Gatstaf Arsonists.','The glow in their eyes reveals more than anger or madness.','Shadows Over Innistrad',5,4,'Common',1,'158a'),
	(31,'Gatstaf Ravagers - DFC',NULL,NULL,'Creature','Werewolf','Menace (This creature can\'t be blocked except by two or more creatures.)\n\nAt the beginning of each upkeep, if a player casts cast two or more spells last turn, transform Gatstaf Ravagers.','','Shadows Over Innistrad',6,5,'Common',1,'158b'),
	(32,'Clue',NULL,NULL,'Token Artifact','Clue','2, Sacrifice this artifact: Draw a card.','\"The symbols - when did they change?\"\n- Tamiyo\'s Journal','Shadows Over Innistrad',NULL,NULL,'Common',1,'15T'),
	(33,'Kismet','{3}{W}',4,'Enchantment',NULL,'Artifacts, creatures and lands target player controls come into play tapped.','\"Make people wait for what they want, and you have power over them. This is as true for merchants and militia as it is for cooks and couples.\"\n- Gwendlyn Di Corci','Fitth Edition',NULL,NULL,'Uncommon',1,NULL);

/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
