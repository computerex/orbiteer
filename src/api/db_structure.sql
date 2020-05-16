CREATE DATABASE `ohm`;

CREATE TABLE `ohm`.`addonDB` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(75) NOT NULL,
  `Category` INT(10) NOT NULL,
  `OrbVer` VARCHAR(45) NULL,
  `Author` VARCHAR(45) NULL,
  `Authorsite` VARCHAR(300) NULL,
  `DateAdded` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PictureLink` VARCHAR(75) NULL,
  `filename` VARCHAR(150) NOT NULL,
  `Comments` VARCHAR(3072) NOT NULL,
  `TotalDownloads` INT(10) NOT NULL,
  `fileSize` INT(10) NULL,
  `numRatings` INT(10) NOT NULL,
  `subcat` INT(10) NULL,
  `avgrating` DOUBLE NOT NULL,
  `Downloads` INT(10) NOT NULL,
  `Visible` TINYINT(1) NOT NULL DEFAULT 1,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `isExternal` TINYINT(1) NOT NULL DEFAULT 0,
  `isMaintained` TINYINT(1) NOT NULL DEFAULT 0,
  `md5hash` VARCHAR(45) NOT NULL,
  `authorID` INT(10) NOT NULL,
  `userCommentsThread` INT(10) NOT NULL,
  `firstpostid` INT(10) NOT NULL,
  PRIMARY KEY (`ID`));

INSERT INTO `ohm`.`addonDB` (`Name`, `Category`, `OrbVer`, `Author`, `Authorsite`, `DateAdded`, `PictureLink`, `filename`, `Comments`, `TotalDownloads`, `fileSize`, `numRatings`, `subcat`, `avgrating`, `Downloads`, `Visible`, `Deleted`, `isExternal`, `isMaintained`, `md5hash`, `authorID`, `userCommentsThread`, `firstpostid`) VALUES ('Orbiter Radio MFD 2006-P1', '4', '060929', 'xyon', 'http://orbiterradio.thruhere.net', '2010-05-15 00:00:00', 'ORMFD2006P1SCRN.png', 'OrbiterRadioMFD2006P1.zip', 'An MFD which allows playback and live information of the Orbiter Radio stream.<br /><br />Currently supports playing and stopping, and pulls information as in the screenshot, DJ / show name, song title, bitrate, and number of listeners.<br /><br /><strong>This addon is compatible with, but does not require, OrbiterSound.<br /></strong><br />It uses the BASS library for playback (included) which can be found at <a href=\"http://www.un4seen.com/\">http://www.un4seen.com/</a><br /><br />More details in included Readme.txt file.<br /><br />Update version 1.3 introduces an entirely new method of fetching metadata.<br />Update version 1.1 fixes bugs including the crash on stream disconnect or DJ change.', '563', '189945', '16', '16', '4.833333333', '235', '1', '0', '0', '9', '5f316b8e3643dc24005f373fae4d5e37', '9999', '15709', '170972');
