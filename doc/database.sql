-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Loomise aeg: Okt 15, 2014 kell 12:26 PM
-- Serveri versioon: 5.6.20
-- PHP versioon: 5.5.15

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Andmebaas: `blog`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `Autor` int(11) NOT NULL,
  `Sisesta tekst` int(11) NOT NULL,
  `Kuupaev` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Kommentaar postitusele:......` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
`post_id` int(10) unsigned NOT NULL,
  `post_subject` varchar(255) NOT NULL,
  `post_text` text NOT NULL,
  `post_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Andmete tõmmistamine tabelile `post`
--

INSERT INTO `post` (`post_id`, `post_subject`, `post_text`, `post_created`, `user_id`) VALUES
(1, '', '0', '2014-09-10 09:50:11', 1),
(2, 'posti teema', 'posti tekst', '2014-09-10 09:50:11', 1),
(3, 'ksfhbs aofdjfb', 'aii apIFNF WSP ifopq fhsdjgf', '2014-10-13 08:12:20', 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
`tag_id` int(10) unsigned NOT NULL,
  `tag_name` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Andmete tõmmistamine tabelile `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1, 'sthaaap'),
(2, 'sumfing');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(10) unsigned NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Andmete tõmmistamine tabelile `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `deleted`) VALUES
(1, 'demo', 'demo', 0);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`post_id`), ADD KEY `user_id` (`user_id`);

--
-- Indeksid tabelile `post_tags`
--
ALTER TABLE `post_tags`
 ADD PRIMARY KEY (`post_id`,`tag_id`), ADD KEY `tag_id` (`tag_id`);

--
-- Indeksid tabelile `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`tag_id`);

--
-- Indeksid tabelile `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `post`
--
ALTER TABLE `post`
MODIFY `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT tabelile `tag`
--
ALTER TABLE `tag`
MODIFY `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT tabelile `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Piirangud tabelile `post_tags`
--
ALTER TABLE `post_tags`
ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);

--
-- Piirangud tabelile `tag`
--
ALTER TABLE `tag`
ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `post` (`post_id`);
SET FOREIGN_KEY_CHECKS=1;
