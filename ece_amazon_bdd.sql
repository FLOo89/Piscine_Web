-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  lun. 29 avr. 2019 à 13:50
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `ece_amazon`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `id` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `codepostal` int(5) NOT NULL,
  `pays` varchar(255) NOT NULL,
  `telephone` int(10) NOT NULL,
  `typecarte` int(255) NOT NULL,
  `numerocarte` int(16) NOT NULL,
  `proprietairecarte` int(255) NOT NULL,
  `expirationcarte` date NOT NULL,
  `cryptocarte` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` int(10) NOT NULL,
  `idvendeur` int(10) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `prix` float NOT NULL,
  `nom` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `musique`
--

CREATE TABLE `musique` (
  `id` int(10) NOT NULL,
  `idvendeur` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` float NOT NULL,
  `date` date NOT NULL,
  `artiste` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sportloisir`
--

CREATE TABLE `sportloisir` (
  `id` int(10) NOT NULL,
  `idvendeur` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` float NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `id` int(10) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `imagefond` varchar(500) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vetement`
--

CREATE TABLE `vetement` (
  `id` int(10) NOT NULL,
  `idvendeur` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` float NOT NULL,
  `marque` varchar(255) NOT NULL,
  `taille` int(10) NOT NULL,
  `sexe` tinyint(1) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvendeur` (`idvendeur`);

--
-- Index pour la table `musique`
--
ALTER TABLE `musique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvendeur` (`idvendeur`);

--
-- Index pour la table `sportloisir`
--
ALTER TABLE `sportloisir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvendeur` (`idvendeur`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vetement`
--
ALTER TABLE `vetement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvendeur` (`idvendeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acheteur`
--
ALTER TABLE `acheteur`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `musique`
--
ALTER TABLE `musique`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sportloisir`
--
ALTER TABLE `sportloisir`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vendeur`
--
ALTER TABLE `vendeur`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vetement`
--
ALTER TABLE `vetement`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`idvendeur`) REFERENCES `vendeur` (`id`);

--
-- Contraintes pour la table `musique`
--
ALTER TABLE `musique`
  ADD CONSTRAINT `musique_ibfk_1` FOREIGN KEY (`idvendeur`) REFERENCES `vendeur` (`id`);

--
-- Contraintes pour la table `sportloisir`
--
ALTER TABLE `sportloisir`
  ADD CONSTRAINT `sportloisir_ibfk_1` FOREIGN KEY (`idvendeur`) REFERENCES `vendeur` (`id`);

--
-- Contraintes pour la table `vetement`
--
ALTER TABLE `vetement`
  ADD CONSTRAINT `vetement_ibfk_1` FOREIGN KEY (`idvendeur`) REFERENCES `vendeur` (`id`);
