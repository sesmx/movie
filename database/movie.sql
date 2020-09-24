/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP DATABASE IF EXISTS `movie`;
CREATE DATABASE IF NOT EXISTS `movie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie`;

DROP TABLE IF EXISTS `LanguageMaster`;
CREATE TABLE IF NOT EXISTS `LanguageMaster` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MovieLanguage` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `LanguageMaster`;
/*!40000 ALTER TABLE `LanguageMaster` DISABLE KEYS */;
INSERT INTO `LanguageMaster` (`Id`, `MovieLanguage`) VALUES
	(1, 'HINDI'),
	(2, 'ENGLISH');
/*!40000 ALTER TABLE `LanguageMaster` ENABLE KEYS */;

DROP TABLE IF EXISTS `LocationMaster`;
CREATE TABLE IF NOT EXISTS `LocationMaster` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(150) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `LocationMaster`;
/*!40000 ALTER TABLE `LocationMaster` DISABLE KEYS */;
INSERT INTO `LocationMaster` (`Id`, `LocationName`) VALUES
	(1, 'PUNE'),
	(2, 'BANGALORE'),
	(3, 'DELHI'),
	(4, 'CHENNAI');
/*!40000 ALTER TABLE `LocationMaster` ENABLE KEYS */;

DROP TABLE IF EXISTS `MovieMaster`;
CREATE TABLE IF NOT EXISTS `MovieMaster` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MovieTitle` varchar(150) NOT NULL,
  `Plot` text NOT NULL,
  `PosterUrl` varchar(300) DEFAULT NULL,
  `ImdbId` varchar(100) NOT NULL,
  `ImdbRating` float NOT NULL DEFAULT '0',
  `ScreeningStatusId` int NOT NULL DEFAULT '0',
  `LocationId` int NOT NULL DEFAULT '0',
  `LanguageId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `MovieMaster`;
/*!40000 ALTER TABLE `MovieMaster` DISABLE KEYS */;
INSERT INTO `MovieMaster` (`Id`, `MovieTitle`, `Plot`, `PosterUrl`, `ImdbId`, `ImdbRating`, `ScreeningStatusId`, `LocationId`, `LanguageId`) VALUES
	(1, 'Harry Potter and the Chamber of Secrets', 'Forced to spend his summer holidays with his muggle relations, Harry Potter gets a real shock when he gets a surprise visitor: Dobby the house-elf, who warns Harry Potter against returning to Hogwarts, for terrible things are going to happen. Harry decides to ignore Dobby\'s warning and continues with his pre-arranged schedule. But at Hogwarts, strange and terrible things are indeed happening: Harry is suddenly hearing mysterious voices from inside the walls, muggle-born students are being attacked, and a message scrawled on the wall in blood puts everyone on his/her guard - \\"The Chamber Of Secrets Has Been Opened. Enemies Of The Heir, Beware\\" .', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg', 'tt0295297', 7.4, 2, 1, 2),
	(2, 'Harry Potter and the Deathly Hallows: Part 2', 'Harry, Ron, and Hermione continue their quest of finding and destroying the Dark Lord\'s three remaining Horcruxes, the magical items responsible for his immortality. But as the mystical Deathly Hallows are uncovered, and Voldemort finds out about their mission, the biggest battle begins and life as they know it will never be the same again.', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjIyZGU4YzUtNDkzYi00ZDRhLTljYzctYTMxMDQ4M2E0Y2YxXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg', 'tt1201607', 8.1, 2, 3, 1),
	(3, 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL50_.jpg', 'tt0111161', 9.2, 2, 3, 2),
	(4, 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL50_SY1000_CR0,0,704,1000_AL_.jpg', 'tt0068646', 8.1, 1, 2, 1),
	(5, 'The Dark Knight', 'Harry, Ron, and Hermione continue their quest of finding and destroying the Dark Lord\'s three remaining Horcruxes, the magical items responsible for his immortality. But as the mystical Deathly Hallows are uncovered, and Voldemort finds out about their mission, the biggest battle begins and life as they know it will never be the same again.', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_QL50_SY1000_CR0,0,675,1000_AL_.jpg', 'tt1201607', 8.1, 2, 2, 1),
	(6, 'Harry Potter and the Sorcerer\'s Stone', 'This is the tale of Harry Potter, an ordinary 11-year-old boy serving as a sort of slave for his aunt and uncle who learns that he is actually a wizard and has been invited to attend the Hogwarts School for Witchcraft and Wizardry. Harry is snatched away from his mundane existence by Hagrid, the grounds keeper for Hogwarts, and quickly thrown into a world completely foreign to both him and the viewer. Famous for an incident that happened at his birth, Harry makes friends easily at his new school. He soon finds, however, that the wizarding world is far more dangerous for him than he would have imagined, and he quickly learns that not all wizards are ones to be trusted.', 'https://images-na.ssl-images-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg', 'tt0241527', 7.6, 2, 4, 1),
	(7, 'Harry Potter and the Order of the Phoenix', 'After a lonely summer on Privet Drive, Harry returns to a Hogwarts full of ill-fortune. Few of students and parents believe him or Dumbledore that Voldemort is really back. The ministry had decided to step in by appointing a new Defence Against the Dark Arts teacher that proves to be the nastiest person Harry has ever encountered. Harry also can\'t help stealing glances with the beautiful Cho Chang. To top it off are dreams that Harry can\'t explain, and a mystery behind something Voldemort is searching for. With these many things Harry begins one of his toughest years at Hogwarts School of Witchcraft and Wizardry.', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_SX300.jpg', 'tt0373889', 7.5, 1, 2, 2),
	(8, 'Harry Potter and the Prisoner of Azkaban', 'Harry Potter is having a tough time with his relatives (yet again). He runs away after using magic to inflate Uncle Vernon\'s sister Marge who was being offensive towards Harry\'s parents. Initially scared for using magic outside the school, he is pleasantly surprised that he won\'t be penalized after all. However, he soon learns that a dangerous criminal and Voldemort\'s trusted aide Sirius Black has escaped from the Azkaban prison and wants to kill Harry to avenge the Dark Lord. To worsen the conditions for Harry, vile creatures called Dementors are appointed to guard the school gates and inexplicably happen to have the most horrible effect on him. Little does Harry know that by the end of this year, many holes in his past (whatever he knows of it) will be filled up and he will have a clearer vision of what the future has in store...', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_SX300.jpg', 'tt0304141', 7.8, 2, 2, 2),
	(9, 'Harry Potter and the Goblet of Fire', 'Harry\'s fourth year at Hogwarts is about to start and he is enjoying the summer vacation with his friends. They get the tickets to The Quidditch World Cup Final but after the match is over, people dressed like Lord Voldemort\'s \'Death Eaters\' set a fire to all the visitors\' tents, coupled with the appearance of Voldemort\'s symbol, the \'Dark Mark\' in the sky, which causes a frenzy across the magical community. That same year, Hogwarts is hosting \'The Triwizard Tournament\', a magical tournament between three well-known schools of magic : Hogwarts, Beauxbatons and Durmstrang. The contestants have to be above the age of 17, and are chosen by a magical object called Goblet of Fire. On the night of selection, however, the Goblet spews out four names instead of the usual three, with Harry unwittingly being selected as the Fourth Champion. Since the magic cannot be reversed, Harry is forced to go with it and brave three exceedingly difficult tasks.', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTI1NDMyMjExOF5BMl5BanBnXkFtZTcwOTc4MjQzMQ@@._V1_SX300.jpg', 'tt0330373', 7.7, 2, 1, 1),
	(10, 'Harry Potter and the Deathly Hallows: Part 1', 'Voldemort\'s power is growing stronger. He now has control over the Ministry of Magic and Hogwarts. Harry, Ron, and Hermione decide to finish Dumbledore\'s work and find the rest of the Horcruxes to defeat the Dark Lord. But little hope remains for the Trio, and the rest of the Wizarding World, so everything they do must go as planned.', 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_SX300.jpg', 'tt0926084', 7.7, 2, 1, 2);
/*!40000 ALTER TABLE `MovieMaster` ENABLE KEYS */;

DROP TABLE IF EXISTS `MovieSoundEffectDetails`;
CREATE TABLE IF NOT EXISTS `MovieSoundEffectDetails` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MovieId` int NOT NULL DEFAULT '0',
  `SoundEffectId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `MovieSoundEffectDetails`;
/*!40000 ALTER TABLE `MovieSoundEffectDetails` DISABLE KEYS */;
INSERT INTO `MovieSoundEffectDetails` (`Id`, `MovieId`, `SoundEffectId`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3),
	(4, 2, 4),
	(5, 3, 3),
	(6, 3, 4),
	(7, 4, 3),
	(8, 4, 4),
	(9, 5, 3),
	(10, 5, 4),
	(11, 6, 3),
	(12, 6, 4),
	(13, 7, 3),
	(14, 7, 4),
	(15, 8, 3),
	(16, 8, 4),
	(17, 9, 3),
	(18, 9, 4),
	(19, 10, 3),
	(20, 10, 4);
/*!40000 ALTER TABLE `MovieSoundEffectDetails` ENABLE KEYS */;

DROP TABLE IF EXISTS `MovieStillDetails`;
CREATE TABLE IF NOT EXISTS `MovieStillDetails` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MovieId` int NOT NULL DEFAULT '0',
  `MovieStillUrl` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `MovieStillDetails`;
/*!40000 ALTER TABLE `MovieStillDetails` DISABLE KEYS */;
INSERT INTO `MovieStillDetails` (`Id`, `MovieId`, `MovieStillUrl`) VALUES
	(1, 1, 'https://i.imgur.com/3fJ1P48.gif'),
	(2, 1, 'https://i.imgur.com/j6ECXmD.gif'),
	(3, 1, 'https://i.imgur.com/v0ooIH0.gif'),
	(4, 2, 'https://i.imgur.com/i3aD05u.png'),
	(5, 2, 'https://i.imgur.com/ABinULO.gif'),
	(6, 2, 'https://i.imgur.com/Wflfyct.gif'),
	(7, 3, 'https://m.media-amazon.com/images/M/MV5BNTYxOTYyMzE3NV5BMl5BanBnXkFtZTcwOTMxNDY3Mw@@._V1_UY99_CR24,0,99,99_AL_.jpg'),
	(8, 3, 'https://m.media-amazon.com/images/M/MV5BNzAwOTk3MDg5MV5BMl5BanBnXkFtZTcwNjQxNDY3Mw@@._V1_UY99_CR29,0,99,99_AL_.jpg'),
	(9, 3, 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL__QL50.jpg'),
	(10, 4, 'https://m.media-amazon.com/images/M/MV5BYTgzZTJlMDUtMGIxNy00ODJiLWI3NjAtYzQ4OTQ3MGQ3ZGYwXkEyXkFqcGdeQXVyMDc2NTEzMw@@._V1_UX99_CR0,0,99,99_AL_.jpg'),
	(11, 4, 'https://m.media-amazon.com/images/M/MV5BMTczMTk5MjkwOF5BMl5BanBnXkFtZTgwMDI0Mjk1NDM@._V1_UY99_CR12,0,99,99_AL_.jpg'),
	(12, 4, 'https://m.media-amazon.com/images/M/MV5BMTI2ODEzMTI1MF5BMl5BanBnXkFtZTYwNjI3MDU2._V1_UX100_CR0,0,100,100_AL_.jpg'),
	(13, 5, 'https://m.media-amazon.com/images/M/MV5BMTM5NjA1OTYyOV5BMl5BanBnXkFtZTcwMzgzMTk2Mw@@._V1_UY99_CR69,0,99,99_AL_.jpg'),
	(14, 5, 'https://m.media-amazon.com/images/M/MV5BOTk5NDczOTg3N15BMl5BanBnXkFtZTcwMTgzMTk2Mw@@._V1_UY99_CR67,0,99,99_AL_.jpg'),
	(15, 5, 'https://m.media-amazon.com/images/M/MV5BMTkyMjQ4ODk1NF5BMl5BanBnXkFtZTcwMjcxMTk2Mw@@._V1_UX100_CR0,0,100,100_AL_.jpg'),
	(16, 6, 'https://i.imgur.com/i3aD05u.png'),
	(17, 6, 'https://i.imgur.com/ABinULO.gif'),
	(18, 6, 'https://i.imgur.com/Wflfyct.gif'),
	(19, 7, 'https://i.imgur.com/i3aD05u.png'),
	(20, 7, 'https://i.imgur.com/ABinULO.gif'),
	(21, 7, 'https://i.imgur.com/Wflfyct.gif'),
	(22, 8, 'https://i.imgur.com/i3aD05u.png'),
	(23, 8, 'https://i.imgur.com/ABinULO.gif'),
	(24, 8, 'https://i.imgur.com/Wflfyct.gif'),
	(25, 9, 'https://i.imgur.com/i3aD05u.png'),
	(26, 9, 'https://i.imgur.com/ABinULO.gif'),
	(27, 9, 'https://i.imgur.com/Wflfyct.gif'),
	(28, 10, 'https://i.imgur.com/i3aD05u.png'),
	(29, 10, 'https://i.imgur.com/ABinULO.gif'),
	(30, 10, 'https://i.imgur.com/Wflfyct.gif');
/*!40000 ALTER TABLE `MovieStillDetails` ENABLE KEYS */;

DROP TABLE IF EXISTS `ScreeningStatusMaster`;
CREATE TABLE IF NOT EXISTS `ScreeningStatusMaster` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ScreeningStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `ScreeningStatusMaster`;
/*!40000 ALTER TABLE `ScreeningStatusMaster` DISABLE KEYS */;
INSERT INTO `ScreeningStatusMaster` (`Id`, `ScreeningStatus`) VALUES
	(1, 'UPCOMING'),
	(2, 'NOW SHOWING');
/*!40000 ALTER TABLE `ScreeningStatusMaster` ENABLE KEYS */;

DROP TABLE IF EXISTS `SoundEffectMaster`;
CREATE TABLE IF NOT EXISTS `SoundEffectMaster` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SoundEffect` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `SoundEffectMaster`;
/*!40000 ALTER TABLE `SoundEffectMaster` DISABLE KEYS */;
INSERT INTO `SoundEffectMaster` (`Id`, `SoundEffect`) VALUES
	(1, 'DOLBY'),
	(2, 'DTS'),
	(3, 'RX6'),
	(4, 'SDDS');
/*!40000 ALTER TABLE `SoundEffectMaster` ENABLE KEYS */;

DROP TABLE IF EXISTS `UserMaster`;
CREATE TABLE IF NOT EXISTS `UserMaster` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EmailId` varchar(250) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `UserPassword` varchar(500) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `EmailId` (`EmailId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `UserMaster`;
/*!40000 ALTER TABLE `UserMaster` DISABLE KEYS */;
INSERT INTO `UserMaster` (`Id`, `EmailId`, `FirstName`, `LastName`, `UserPassword`, `CreatedOn`) VALUES
	(1, 'anik.sen@outlook.com', 'Anik', 'Sen', 'VGVzdDE=', '2020-09-23 17:56:45');
/*!40000 ALTER TABLE `UserMaster` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
