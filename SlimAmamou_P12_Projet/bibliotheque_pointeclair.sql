-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 20 nov. 2022 à 23:26
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque_pointeclair`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories_documents`
--

CREATE TABLE `categories_documents` (
  `IdCategorie` int(4) NOT NULL,
  `Categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories_documents`
--

INSERT INTO `categories_documents` (`IdCategorie`, `Categorie`) VALUES
(1, 'Roman'),
(2, 'Bande dessinee'),
(3, 'Jeux video'),
(4, 'DVD'),
(5, 'Blu-ray'),
(6, 'CD'),
(7, 'Religieux'),
(8, 'Sciences'),
(17, 'Dictionnaires, encyclopedies'),
(18, 'Poesie, theatre'),
(19, 'Livre');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE `documents` (
  `IdDocument` int(12) NOT NULL,
  `Titre` varchar(80) NOT NULL,
  `Auteur` varchar(70) NOT NULL,
  `AnneeDePublication` varchar(4) NOT NULL,
  `Categorie` int(6) NOT NULL,
  `Genre` int(6) NOT NULL,
  `Type` int(6) NOT NULL,
  `Description` varchar(400) NOT NULL,
  `ISBN(livres)` varchar(60) DEFAULT NULL,
  `DocumentTotal` int(3) NOT NULL,
  `DocumentDisponible` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`IdDocument`, `Titre`, `Auteur`, `AnneeDePublication`, `Categorie`, `Genre`, `Type`, `Description`, `ISBN(livres)`, `DocumentTotal`, `DocumentDisponible`) VALUES
(1, 'DOUZE HOMMES EN COLÈRE', 'Sidney Lumet', '1957', 4, 1, 3, 'LA VIE D\'UN HOMME EST ENTRE LES MAINS DU JURY. - Lors du procès d\'un jeune homme pauvre, le jury se retire pour délibérer et voter la sentence. A onze voix contre une, le jeune homme est déclaré coupable.', NULL, 2, 1),
(2, 'LES SEPT SAMOURAÏS', ' Akira Kurosawa', '1955', 4, 9, 3, 'Au Moyen-Age, un petit village japonais est sans cesse attaqué par une bande de pillards sans scrupule. Un jour, sept samouraïs sans maître acceptent de défendre les villageois apeurés.', NULL, 2, 1),
(3, 'CASABLANCA', 'Michael Curtiz', '1942', 4, 1, 3, 'En pleine Seconde Guerre mondiale, Rick Blaine, un Américain exilé, est à la tête du night club le plus prisé de Casablanca, qui sert avant tout de refuge pour tout ceux qui souhaiterait quitter le pays.', NULL, 1, 1),
(4, 'PSYCHOSE', 'Alfred Hitchcock', '1954', 4, 1, 3, 'Considéré comme le premier slasher de l\'histoire du cinéma, Psychose invente les codes du film de serial killer en mettant en scène la fugue de Marion Crane dans un motel désert.', NULL, 1, 0),
(5, 'LA VIE EST BELLE', 'Frank Capra', '1947', 4, 1, 3, 'Depuis la mort de son père, George Bailey a repris l\'entreprise familiale de prêts à la construction et se bat perpétuellement contre l\'homme le plus riche de la ville qui tente de ruiner ses efforts.', NULL, 2, 0),
(6, 'Piège de cristal', 'John McTiernan', '1988', 4, 9, 2, 'John McClane, policier new-yorkais, est venu rejoindre pour les fêtes de Noël sa femme Holly, dont il est séparé depuis plusieurs mois, dans le secret espoir d\'une réconciliation.', NULL, 1, 0),
(7, 'Mad Max - Fury Road', 'George Miller', '2015', 5, 4, 3, 'Max est capturé et fait prisonnier dans la Citadelle dirigée par Immortan Joe. C’est alors qu\'il se retrouve embarqué dans une course poursuite explosive.', NULL, 3, 0),
(26, 'Terminator 2 - Le Jugement dernier', 'James Cameron', '1991', 4, 4, 3, 'En 2029, après son échec pour éliminer Sarah Connor, Skynet programme un nouveau Terminator, le T-1000, pour retourner dans le passé et éliminer son fils John Connor, futur leader de la résistance humaine', NULL, 3, 0),
(27, 'Une journée en enfer', 'John McTiernan', '1995', 4, 9, 3, 'À New York, une bombe explose dans un grand magasin. Peu de temps après, un homme du nom de Simon contacte la police et revendique l\'attentat.', NULL, 1, 0),
(28, 'Matrix', 'Lilly et Lana Wachowski', '1999', 4, 4, 3, 'Neo, un des pirates les plus recherchés du cyber-espace, reçoit de mystérieux messages cryptés d\'un certain Morpheus. Celui-ci l\'exhorte à aller au-delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu\'est-ce que la Matrice ?', NULL, 2, 0),
(29, 'Kill Bill - Volume 1', 'Quentin Tarantino', '2003', 4, 9, 3, 'Au cours d\'une cérémonie de mariage en plein désert, un commando fait irruption dans la chapelle et tire sur les convives. Laissée pour morte, la Mariée enceinte retrouve ses esprits après un coma de quatre ans.', NULL, 1, 1),
(30, 'The Dark Knight', 'Christopher Nolan', '2008', 4, 4, 3, 'Avec l\'appui du lieutenant de police Jim Gordon et du procureur de Gotham, Harvey Dent, Batman vise à éradiquer le crime organisé qui pullule dans la ville. ', NULL, 1, 0),
(31, 'Heat', 'Michael Mann ', '1995', 4, 1, 3, 'Neil McCauley, cambrioleur de génie, et son équipe de gangster, attaquent un fourgon blindé en plein Los Angeles. L\'assaut tourne au bain de sang, lorsque les trois gardes du fourgon sont tués à bout portant.', NULL, 1, 0),
(32, 'Aliens, le retour', 'James Cameron', '1986', 4, 4, 3, 'Après 57 ans de dérive dans l\'espace, Ellen Ripley est secourue par la corporation Weyland-Yutani. Malgré son rapport concernant l’incident survenu sur le Nostromo, elle n’est pas prise au sérieux par les militaires quant à la présence de xénomorphes sur la planète LV-426 où se posa son équipage…', NULL, 1, 0),
(33, 'Orgueil & Préjugés ', 'Joe Wright', '2005', 4, 10, 3, 'Mrs. Bennet veut marier ses filles afin de leur assurer un avenir. L\'arrivée de nouveaux voisins les plonge dans des affaires de coeur tumultueuses.', NULL, 3, 1),
(34, 'Jane Eyre', 'Cary Joji Fukunaga', '2011', 5, 10, 3, 'Nouvelle adaptation de l\'histoire de Jane Eyre, gouvernante de la petite Adèle chez le riche Edward Rochester, un homme ombrageux.', NULL, 2, 0),
(35, 'Forrest Gump', 'Robert Zemeckis', '1994', 4, 1, 4, 'Forrest Gump est le symbole d\'une époque, un candide dans une Amérique qui a perdu son innocence. Merveilleusement interprété par Tom Hanks, Forrest vit une série d\'aventures, de l\'état d\'handicapé physique à celui de star du football, de héros du Vietnam au roi de la crevette, des honneurs de la Maison Blanche au bonheur d\'une grande histoire d\'amour. Son coeur dépasse les limites de son Q.I.', NULL, 2, 0),
(36, 'Men in Black', 'Barry Sonnenfeld', '1997', 4, 4, 4, 'Récemment séparé de son vieux partenaire, retourné à la vie civile sans aucun souvenir de sa vie d\'homme en noir, K, le plus expérimenté des agents du MIB décide de former J, un jeune policier. Ensemble, ils vont afronter une nouvelle menace : Edgar le cafard...', NULL, 1, 1),
(37, 'Les Blues Brothers ', 'John Landis', '1980', 4, 1, 4, 'Dès sa sortie de prison, Jake Blues est emmené par son frère Elwood chez Soeur Mary Stigmata, qui dirige l\'orphelinat dans lequel ils ont été élevés. Ils doivent réunir 5 000 dollars pour sauver l\'établissement, sinon c\'est l\'expulsion.', NULL, 1, 0),
(38, 'Shrek', 'Andrew Adamson et Vicky Jenson', '2001', 4, 8, 4, 'Shrek, un ogre verdâtre, cynique et malicieux, a élu domicile dans un marécage qu\'il croit être un havre de paix. Un matin, alors qu\'il sort faire sa toilette, il découvre de petites créatures agaçantes qui errent dans son marais.Shrek se rend alors au château du seigneur Lord Farquaad, qui aurait soit-disant expulsé ces êtres de son royaume.', NULL, 2, 0),
(39, 'Les Temps modernes', 'Charlie Chaplin', '1936', 4, 1, 4, 'Charlot est ouvrier dans une gigantesque usine. Il resserre quotidiennement des boulons. Mais les machines, le travail à la chaîne le rendent malade, il abandonne son poste, recueille une orpheline et vit d\'expédients. Le vagabond et la jeune fille vont s\'allier pour affronter ensemble les difficultés de la vie...', NULL, 2, 2),
(40, 'Chérie, nous avons été rétrécis', 'Dean Cundey', '1996', 4, 8, 4, 'Avant de remiser définitivement sa machine infernale, Wayne ne peut s\'empêcher de la revoir une dernière fois et la catastrophe se produit : il s\'est rétréci ainsi que son frère et leurs épouses. Une grande panique s\'ensuit et les parents lilliputiens s\'évertuent d\'attirer l\'attention des enfants.', NULL, 1, 1),
(41, 'Evan tout-puissant', 'Tom Shadyac', '2007', 4, 5, 4, 'Une nouvelle vie commence pour Evan Baxter, sa femme Joan et leurs trois fils. Fraîchement élu député de New York, et bien décidé à marquer l\'histoire de son pays, l\'ex-présentateur vedette demande à Dieu de l\'aider à \"changer le monde\", sans se douter qu\'il a déjà été choisi pour une mission de la plus haute importance... ', NULL, 1, 1),
(42, 'Le Pari', 'Didier Bourdon et Bernard Campan', '1997', 4, 8, 4, 'Bernard est professeur dans une banlieue et vit avec Victoria. Didier est un riche pharmacien du XIXe arrondissement de Paris, marié à Murielle, la sœur de Victoria. Tout oppose les deux beaux-frères et ils se détestent. ', NULL, 1, 1),
(43, 'Nos jours heureux', 'Olivier Nakache et Eric Toledano', '2006', 4, 8, 2, 'Vincent Rousseau dirige pour la première fois une colonie de vacances et se retrouve vite confronté aux difficultés que soulève son poste : des enfants indisciplinés, des animateurs pas toujours très professionnels, les activités à organiser, la visite de Jeunesse et Sport et bien d\'autres problèmes.', NULL, 1, 1),
(44, 'La Famille Addams', 'Barry Sonnenfeld ', '1991', 4, 8, 4, 'Rififi chez les Addams, célèbre famille macabre qui vit dans un manoir hanté, lorsque débarque l\'oncle Fétide, sosie d\'un des membres de la famille disparu vingt-cinq ans plus tôt...', NULL, 2, 2),
(45, 'Mon voisin Totoro', 'Hayao Miyazaki', '1988', 4, 15, 1, 'Un professeur d\'université, M. Kusakabe, et ses deux filles, Satsuki, onze ans, et Mei, quatre ans, s\'installent dans leur nouvelle maison à la campagne. Celle-ci est proche de l\'hôpital où leur mère est hospitalisée. Les deux enfants vont alors faire la rencontre des esprits de la forêt.', NULL, 1, 1),
(46, 'Le Roi Lion', 'Roger Allers et Rob Minkoff ', '1994', 4, 5, 1, 'Dans la savane africaine, Simba, le fils du roi lion Mufasa, vient de naître et il est présenté à tous les animaux sur lesquels il est appelé à régner un jour. Mais si la liesse s\'empare de la plupart des animaux, Scar, le frère de Mufasa, qui voit une fois de plus le trône lui échapper, rumine dans l\'ombre et prépare sa vengeance.', NULL, 2, 2),
(47, 'Le Voyage de Chihiro', 'Hayao Miyazaki', '2001', 4, 5, 1, 'Lors du déménagement de sa famille, Chihiro, une fillette de 10 ans, erre dans un monde régi par les dieux, sorcières et monstres.', NULL, 1, 1),
(48, 'Le Monde de Nemo', 'Andrew Stanton et Lee Unkrich', '2003', 4, 5, 1, 'Marin, un poisson clown, s\'occupe seul de son fils Némo après la mort de son épouse. Lorsque Némo se fait capturer, il va sauver son fils adoré.\r\n\r\n', NULL, 1, 1),
(49, 'Harry Potter à l\'école des sorciers', 'Chris Columbus ', '2001', 4, 5, 4, 'Orphelin, Harry Potter est élevé par son oncle et sa tante qui l\'obligent à vivre dans un placard. Ces derniers, lui cachent qu\'il est en fait fils de sorciers et que sa place est à Poudlard, la prestigieuse école de magie. Le jour de ses 11 ans, un géant nommé Hagrid lui révèle enfin la vérité. ', NULL, 2, 2),
(50, 'Mary Poppins', 'Robert Stevenson', '1964', 4, 1, 4, 'Après le départ de leur nurse, un banquier et sa femme passent une annonce pour la remplacer. Mary Poppins, une femme particulière, se présente.', NULL, 1, 1),
(51, 'Le Livre de la jungle', 'Wolfgang Reitherman', '1967', 4, 5, 1, 'Un matin, Bagheera, la panthère noire, découvre un petit garçon abandonné. Elle l\'emporte et le confie à une famille de loups. On l\'appellera Mowgli.', NULL, 1, 1),
(52, 'Hook ou la revanche du Capitaine Crochet', 'Steven Spielberg', '1991', 4, 5, 1, 'Peter Pan, à présent adulte, est devenu Peter Banning, un avocat d\'affaires débordé. Il a tiré un trait sur son passé, s\'est marié et a eu deux enfants, qu\'il a tendance à négliger. A l\'occasion de Noël, il se retrouve avec sa famille chez Wendy, devenue grand-mère. ', NULL, 2, 1),
(53, 'A deux mètres de toi', 'Justin Baldoni ', '2019', 5, 12, 2, 'Deux adolescents atteints de maladies graves se rencontrent à l\'hôpital et tombent amoureux.', NULL, 2, 2),
(54, 'Les Âmes vagabondes', 'Andrew Niccol', '2013', 5, 5, 2, 'La Terre est envahie. L’humanité est en danger. Nos corps restent les mêmes, mais nos esprits sont contrôlés. Melanie Stryder vient d’être capturée. Elle refuse cependant de laisser place à l’être qui tente de la posséder. ', NULL, 1, 1),
(55, 'Divergente', 'Neil Burger', '2014', 5, 9, 2, 'Tris vit dans un monde post apocalyptique où la société est divisée en cinq clans. À 16 ans, elle doit choisir son appartenance pour toute sa vie.\r\n\r\n', NULL, 1, 1),
(56, 'Le Labyrinthe', 'Wes Ball', '2014', 5, 4, 2, 'Thomas ne sait plus qui il est, ni d\'où il vient. Il se retrouve dans un monde mystérieux entouré par un grand labyrinthe impénétrable.', NULL, 1, 1),
(57, 'Sublimes Créatures', 'Richard LaGravenese', '2013', 5, 5, 2, 'Dans une petite ville en Caroline du Sud, Ethan, un jeune étudiant, se réveille après un rêve étrange récurent : celui d’une fille qui lui est inconnue. Ce même matin il découvre sur son iPod une chanson insolite, quasi hypnotique, « 16 lunes », et remarque une curieuse odeur de romarin et de citron.', NULL, 1, 1),
(58, 'La Stratégie Ender', 'Gavin Hood', '2013', 5, 9, 2, 'Un jeune garçon surdoué suit une formation militaire réservée à l\'élite pour sauver l\'espèce humaine d\'une éventuelle invasion extraterrestre.', NULL, 1, 1),
(59, 'Sortilège', 'Daniel Barnz', '2011', 5, 12, 2, 'Kyle Kingsbury, un adolescent populaire, voit son apparence physique transformée en tout ce qu\'il hait le plus par une sorcière.', NULL, 2, 2),
(60, 'Nos étoiles contraires', 'Josh Boone', '2014', 5, 12, 2, 'Adaptation du roman « The Fault in Our Stars » : Un jeune garçon et une jeune fille atteints d’un cancer en phase terminale tombent amoureux.', NULL, 1, 1),
(61, 'L\'Arnacœur', 'Pascal Chaumeil', '2010', 4, 8, 2, 'Alex est un séducteur professionnel qui a pour mission de casser les couples. Mais il ne s\'attaque qu\'aux couples où la femme est malheureuse.', NULL, 1, 1),
(62, 'Un havre de paix', 'Lasse Hallström', '2013', 5, 12, 3, 'Une jeune et mystérieuse femme arrive dans une petite ville pour commencer une nouvelle vie. Elle rencontre un jeune veuf, qui pourrait bien lui offrir ce nouveau départ. Mais elle semble cacher de sombres secrets, qui ne vont pas tarder à la rattraper.', NULL, 2, 2),
(63, 'Je te promets', 'Michael Sucsy ', '2013', 5, 10, 3, 'Un couple récemment marié subit un grave accident de voiture qui fait tomber la femme dans un coma profond. Quand elle se réveille, elle souffre de graves pertes de mémoire. Son mari décide alors de la reconquérir de nouveau.', NULL, 1, 1),
(64, 'Shakespeare in Love', 'John Madden', '1998', 4, 8, 3, 'William Shakespeare croule sous les dettes. Il a promis à son commanditaire, Mr. Henslowe, de lui livrer rapidement une nouvelle pièce, Roméo et Ethel, la fille du pirate.', NULL, 1, 1),
(65, 'LE PETIT ASTRONAUTE', 'Jean-Paul Eid', '2021', 2, 2, 4, 'Tous les ans, Juliette fait son pèlerinage en vélo dans le quartier de son enfance. Mais cette année, devant l\'ancien appartement familial, une affiche: À vendre - Visite libre. En ouvrant, les portes de son décor de jeunesse, les souvenirs remontent. Les amis, les petits bonheurs, mais surtout l\'arrivée bouleversante de son frère Tom: le petit astronaute.', '13 :	9782870256984', 4, 4),
(66, 'PAUL', 'Michel Rabagliati, MICHEL GIGUÈRE', '2022', 2, 1, 4, 'Rarement un auteur a-t-il démontré un apport aussi exceptionnel au rayonnement de la culture québécoise que Michel Rabagliati. Pour rendre hommage au travail magistral de ce célèbre bédéiste, La Pastèque est fière de publier un ouvrage de plus de 275 pages dans lequel vous trouverez tout sur votre auteur préféré : une entrevue passionnante, des analyses de Michel Giguère sur Paul et des inédits à ', '13 :	9636370972816', 2, 2),
(67, 'RENÉ LÉVESQUE - QUELQUE CHOSE COMME UN GRAND HOMME', 'Marc Tessier', '2021', 2, 6, 4, 'René Lévesque est le Québécois à l\'origine des plus grands changements économiques, politiques et sociaux survenus au Québec au 20e siècle. Pendant sa carrière, il a été démonisé par une partie de la presse anglophone et francophone, traité d\'ami de Khrouchtchev, de communiste et de « Castro du nord » par les Libéraux et l\'Union nationale. ', '13 :	97828709966691', 1, 1),
(68, 'ALISS ADAPTATION BD', 'Patrick Senécal', '2020', 2, 2, 4, 'Alice, une jeune fille de banlieue, quitte le cégep et le cocon familial pour aller vivre sa vie là où tout est possible : la métropole.', '13 :	9782870979862', 2, 2),
(69, 'MORT DE RIRE', 'Jean Lacombe', '2022', 2, 8, 4, 'Bande dessinée qui met avant la percée d\'un humoriste dans le monde nocturne du spectacle. ', '13 :	9782897771317', 2, 2),
(70, 'PAR TOUTATIS !: NOUVELLES AVENTURES DE LAPINOT', 'Trondheim Lewis', '2022', 2, 8, 4, 'Quand Lapinot se réveille en pleine forêt, il n’en croit ni ses yeux ni ses oreilles… un gros bonhomme, vêtu de braies bleues et blanches et affublé d’un casque l’apostrophe : « Astérix! ». Lapinot, incrédule, laisse ce curieux personnage en plan et poursuit son chemin.', '13 :	9782844148964', 2, 2),
(71, 'BD GOLDORAK', 'Xavier Dorison', '2021', 2, 9, 4, 'La guerre entre les forces de Véga et Goldorak est un lointain souvenir. Actarus et sa soeur sont repartis sur Euphor tandis qu\'Alcor et Vénusia tentent de mener une vie normale. Mais, des confins de l\'espace, surgit le plus puissant des golgoths : l\'Hydragon. ', '13 :	9782505078463', 1, 1),
(72, 'UN PARIS POUR DALLAIRE', 'Marc Tessier', '2022', 2, 12, 4, 'Bande dessinée qui met avant la percée d\'un peintre dans le monde très select de l\'art.', '13 :	9782897771171', 1, 1),
(73, 'DEMAIN LES CHATS', 'Bernard Werber', '2021', 2, 5, 4, 'Humains, ne craignez rien...\r\nNous allons sauver votre civilisation.', '13 :	9782226449306', 1, 1),
(74, 'BLAKE ET MORTIMER TOME 26 LA VALLÉE DES IMMORTELS VOL. 2', 'Yves Sente', '2020', 2, 2, 4, 'Pendant que Mortimer est kidnappé par les sbires du général Xi-Li qui l\'emmènent dans son repaire secret, le capitaine Blake, aidé de l\'agente nationaliste chinoise Ylang Ti, part à la recherche de son ami qui a pu semer des indices derrière lui.', '13 :	9782870972816', 1, 1),
(75, 'Femme fleuve', 'Anaïs Barbeau-Lavalette', '2022', 1, 12, 3, '	\r\n» ACCUEIL » LIVRES » LITTÉRATURE » ROMANS QUÉBÉCOIS ET CANADIENS\r\nFemme fleuve - ANAÏS BARBEAU-LAVALETTE\r\nAgrandir\r\n\r\nFemme fleuve\r\nDe Anaïs Barbeau-Lavalette\r\n \r\n26,95 $Coup de Coeur Renaud-Bray\r\n\r\nEn stock : Expédié en 48 heures.\r\nQuantité \r\n1\r\nAjouter à ma liste de souhaits\r\nDisponibilité en succursale\r\n\r\n Google +11  6  4 \r\n \r\nRésumé\r\n\r\nUn peintre se retrouve sur la grève d\'un grand fleuve ', '978292505922', 1, 1),
(76, 'La Shéhérazade des pauvres', 'Michel Tremblay', '2022', 1, 2, 3, 'Hosanna est un personnage fétiche de Michel Tremblay qui, après son heure de gloire dans la pièce éponyme, est resté dans l’ombre d’une humiliation affligeante. Ridiculisé à l’école, chétif, surnommé « Banana Split », il a gagné sa vie comme coiffeur pour dames sur la Plaza St-Hubert, où il exerce toujours ce métier, cinquante ans plus tard, en temps de pandémie.', '9782760913387', 2, 2),
(77, 'Le Pendu', 'Louise Penny', '2022', 1, 3, 3, 'Par une froide matinée de novembre, un joggeur traversant les bois qui entourent le paisible village de Three Pines aperçoit un homme pendu à un arbre. Il s’avère que le mort séjournait à l’Auberge, où il était sans doute venu chercher la paix et la tranquillité, mais il n’aura trouvé que cette issue fatale. S’est-il enlevé la vie ou a-t-il été assassiné ?', '9782898110757', 1, 1),
(78, 'J\'ai faim !', 'Élise Gravel', '2022', 1, 6, 1, 'Le petit monstre a faim. Qu’est-ce qu’il pourrait manger? Un morceau de pizza ! Comme il a encore faim, il avale ensuite l’assiette, la boîte de pizza, la table, la maison, jusqu’à ce qu’il ne reste plus que l’enfant qui le regarde ! Oh oh ! Après les incontournables Une patate à vélo, Je suis terrible et C’est moi qui décide !', '9782897743482', 1, 1),
(79, 'J\'en ai marre des carottes !', 'David Campbell et Daron Parton', '2022', 1, 8, 1, 'C’est l’heure du dîner et Betty ne veut pas manger de carottes. Une pizza, un steak, un hot-dog, ou des cacahuètes… Tout lui fait envie, mais surtout pas de carottes ! Même affamée, elle trouve des tonnes d’excuses pour ne pas manger…', '9782359908985', 2, 2),
(80, 'Quel talent !', 'Hannah Whitty et Paula Bowles', '2022', 1, 15, 1, 'Sam aime danser, Olivia aime réciter des textes sur scène. Alors, lorsque le rôle qui leur convient PARFAITEMENT est attribué à quelqu’un d’autre, ils décident d’élaborer un plan…Est-ce qu’une fille doit obligatoirement jouer le rôle de la princesse et un garçon celui du chevalier ?', '9782359909197', 1, 1),
(81, 'Alexandra Kim, la Sibérienne :', 'Keum-Suk Kim', '2021', 2, 7, 4, 'Un roman graphique retraçant le destin de la révolutionnaire coréenne Alexandra Kim (1885-1918), une femme qui a défendu ses idéaux en Extrême-Orient jusqu\'à sa mort.', '9782366245134', 1, 1),
(82, 'Le Dictionnaire de Clifford', 'Collectif', '2013', 17, 6, 1, 'Les enfants vont aimer ce dictionnaire illustré avec Clifford, leur chien rouge préféré! Ce dictionnaire de 128 pages comprend : Un classement alphabétique avec 10 à 25 mots illustrés par lettre', '9781443129275', 1, 1),
(83, 'Tanger sous la pluie', 'Fabien Grolleau et Abdel De Bruxelles', '2022', 2, 6, 4, 'Le 29 janvier 1912, déprimé suite au décès de son père, Matisse se rend à Tanger avec sa femme pour changer d\'air. Le couple s\'installe à l\'hôtel de la Villa de France, un palace sur les hauteurs de la ville. La pluie incessante met à mal son projet de peindre la nature marocaine. Contraint de rester dans sa chambre, l\'artiste demande un modèle.', '9782205079715', 1, 1),
(84, 'Une patate à vélo', 'Élise Gravel', '2017', 1, 15, 1, 'Avez-vous déjà vu une patate à vélo? Un brocoli qui compte jusqu\'à dix ? Une mouche qui parle au téléphone ? Avec l\'humour qu\'on lui connaît, Elise Gravel propose un album tout-carton dans lequel d\'amusants personnages posent des gestes tous plus improbables les uns que les autres, pour le plus grand plaisir des petits lecteurs !', '9782897740160', 2, 2),
(85, 'Qui a pété ?', 'Heath Mckenzie', '2021', 2, 15, 1, 'Un bruit monstrueux a réveillé les animaux de la jungle ! Démasque l\'auteur de ce PET dans ce livre sonore hilarant.', '9782981927705', 1, 1),
(86, 'Est-ce qu’un ours fait caca dans les bois?', 'Jonny Leighton et Mike Byrne', '2021', 2, 15, 1, 'Barry, un ours timide, se réveille et cherche un endroit tranquille pour faire ses besoins. Mais les autres animaux des bois, qui n\'ont aucune gêne à se soulager n\'importe où, le dérangent sans cesse. Avec des détails à repérer dans les illustrations.\r\n', '9782359906691', 2, 2),
(92, 'Prédictions Angéliques 2023 ', 'Joane Flansberry', '2022', 7, 16, 4, 'Véritable bible de l’aide angélique pour la nouvelle année, Prédictions Angéliques a renouvelé le concept des ouvrages traditionnels de prévisions annuelles et offre au lecteur des informations utiles pour bien réussir son année 2023.', '9782897885144', 1, 1),
(93, 'Le Zen et l’art de sauver la planète', 'Thich Nhât Hanh', '2022', 7, 16, 4, 'Pour éviter que meure la beauté du monde…\r\nNous sommes confrontés à de multiples crises\r\nsimultanées : destruction écologique, inégalités croissantes,\r\ninjustice raciale, pandémie dévastatrice… Pour faire face à\r\nces défis, il nous faut développer notre acuité, notre\r\ncompassion et notre courage.', '9782890449695', 1, 1),
(94, 'Oracle : amour inconditionnel', 'Aurore Roegiers', '2022', 7, 16, 4, 'Eveillez votre intuition et renouez avec votre créativité. Ralentir, suivre le flow, voir plus loin, cultiver la sérénité, prendre votre envol, être dans votre pleine expression ou parcourir les chemins de la consécration... Grâce à ces 40 cartes \"compétences\" , amplifiez votre pouvoir créateur et devenez maître de votre destinée.', '9782017168928', 1, 1),
(95, 'Socrate, Jésus, Bouddha', 'Frédéric Lenoir', '2011', 8, 16, 4, 'Dans des cultures différentes mais à des époques marquées par le primat du groupe sur l\'individu, trois maîtres, Socrate, Jésus et Bouddha ont apporté un souffle de liberté qui a donné naissance à un homme moderne avant l\'heure : un individu autonome, responsable de ses choix, mais qui doit gagner sa liberté au prix de la recherche de la vérité. Prix Louis Pauwels 2010 (SGDL).', '9782253134251', 1, 1),
(96, 'Famille royale', 'Stéphane Rousseau', '2022', 19, 18, 3, 'Famille royale dresse le portrait d\'une famille atypique et aimante. Une famille qui navigue entre le dysfonctionnel et la magie; l\'usine et les campings nudistes; les maladies incurables et la fête; les non-dits et la boisson; la classe moyenne et les succès fou d\'un fils-vedette. ', '9782924965795', 2, 2),
(97, 'Marc Laurendeau : du rire cynique au regard journalistique', 'Marc Laurendeau et Pierre Huet', '2022', 19, 18, 3, 'Marc Laurendeau occupe une place de choix dans le cœur des Québécois depuis plus de 60 ans. C’est d’abord au sein de l’inoubliable quatuor humoristique Les Cyniques, fondé par lui avec trois camarades d’université au début des années 1960, qu’il a entrepris sa carrière publique.', '9782898250323', 1, 1),
(98, 'Surrender: 40 Songs, One Story', 'Bono', '2022', 19, 18, 3, 'Bono, artiste, militant et chanteur du groupe de rock irlandais U2, a écrit ses mémoires : honnête et irrévérencieux, intime et profond, Surrender est l\'histoire de la vie remarquable qu\'il a vécue, des défis qu\'il a dû relever et des amis et de la famille qui l\'ont façonné et soutenu.', '9780385695350', 3, 3),
(99, 'Le Vrai District 31 : De la réalité à la fiction', ' Philippe Paul', '2022', 19, 18, 3, 'L’ex-enquêteur Philippe Paul invite le lecteur à s’assoir dans le siège passager\r\nd’une auto-patrouille pour découvrir les faits les plus marquants de son parcours\r\nde jeune policier au poste de police du district 31 de Montréal à la fin des années\r\n1980. On vit ainsi toutes ces premières professionnelles si marquantes : le premier\r\nmeurtre, la première transaction de drogue, la première opération', '9782897116361', 1, 1),
(100, 'La Téméraire : Nicole Juteau, de première policière au Québec à agente double', 'Annie Roy', '2022', 19, 18, 3, 'Nicole Juteau a réussi à se tailler une place, de son enfance à Montréal-Nord dans les années 50-60 à son entourloupette pour être acceptée en technique policière au Collège Ahuntsic, en passant par Nicolet, l\'école de police où elle est des trois premières étudiantes. En plein coeur de l\'Année internationale de la femme, le 11 septembre 1975, elle est assermentée comme première policière au Québe', '9782897116279', 1, 1),
(101, 'Migrations : grandeur et misère de la vie en mouvement', 'Sonia Shah', '2022', 8, 6, 4, 'Dans son essai intitulé Migrations, Sonia Shah déconstruit le paradigme d’un monde immuable et ordonné. En effet, les preuves que le vivant est en mouvement sont de plus en plus éloquentes. Le phénomène de la migration serait en ce sens une réponse adaptative aux changements environnementaux et un vecteur important de diversité biologique et culturelle.', '9782897198114', 1, 1),
(102, 'Science et nature, une encyclopédie visuelle', 'Collectif', '2022', 17, 6, 4, 'Voici une encyclopédie rédigée par des experts et qui s’adresse à toute la famille, que ce soit pour les études ou simplement pour le plaisir d’apprendre sur la science et la nature !', '9782897818746', 1, 1),
(103, 'La Chèvre et le chou : débat entre un artisan fermier et un militant végane', 'Jean-François Dubé', '2022', 8, 14, 3, 'Très critique de l’\'industrie agroalimentaire, mais aussi très perplexe devant les actions des militants de la cause animale, Dominic Lamontagne a voulu engager un dialogue avec un militant végane pour approfondir les enjeux liés à l’\'alimentation et à l’\'avenir de l’\'agriculture. Sous forme d’\'échange épistolaire, il croise le fer avec Jean-François Dubé autour de trois grands thèmes: l’\'éthique,', '9782897198213', 1, 1),
(104, 'Du temps et de l\'eau : requiem pour un glacier', 'Andri Snaer Magnason', '2020', 8, 6, 4, 'Un appel à la mobilisation endossé par les Mères au front.\r\nÀ partir des plus récentes données scientifiques mais aussi d’entrevues, entre autres avec le dalaï-lama, Magnason présente la réalité des changements climatiques comme jamais personne ne l’a fait avant lui, dans un récit mobilisateur qui offre en même temps une bonne dose d’espoir face à un avenir incertain.', '9782897722562', 1, 1),
(105, 'Théories en 30 secondes', 'Paul Parsons', '2012', 8, 6, 4, 'Les 50 théories scientifiques les plus intrigantes, expliquées en moins d\'une minute.', '9782896472741', 1, 1),
(106, 'Tout est chimie dans notre vie', 'Mai Thi Nguyen-Kim', '2021', 8, 6, 4, 'L\'effet du dentifrice sur les dents, celui du café sur le cerveau, les odeurs corporelles ou encore les molécules du stress, ce récit nourri d\'anecdotes amène le lecteur, tout au long d\'une journée, à la découverte des réactions chimiques à l\'oeuvre dans les actions du quotidien.', '9782290236178', 1, 1),
(107, 'L\'Innocence et la loi', 'Michael Connelly', '2022', 1, 3, 3, 'Au sortir d\'une fête après un procès victorieux, Mickey Haller est arrêté pour défaut de plaques de voiture. En ouvrant le coffre, le policier découvre le cadavre d\'un escroc défendu par l\'avocat avant qu\'il n\'essaie de l\'arnaquer. Incarcéré, Haller doit prouver son innocence face à Dana Berg, l\'avocate surnommée Couloir-de-la-mort. Même son demi-frère Harry Bosch peine à résoudre ce mystère.', '9782253104223', 1, 1),
(108, 'Celle qui brûle', 'Paula Hawkins', '2022', 1, 17, 3, 'À Londres, un jeune homme est poignardé à mort dans sa péniche. Trois femmes de son entourage font l\'objet de soupçons : sa tante Carla, sa voisine Miriam et Laura, une jeune femme avec qui la victime a passé sa dernière nuit. Toutes les trois ont en effet subi une injustice et pourraient avoir voulu se venger.', '9782266323802', 1, 1),
(109, 'Les Cibles', 'Chrystine Brouillet', '2022', 1, 3, 3, 'Rien de plus frustrant pour un policier qu’un cold case : une enquête qui, par manque de\r\npreuves, reste non résolue. Malgré toute son expérience, Maud Graham a toujours de la\r\ndifficulté à accepter que ces cas inexpliqués fassent partie du métier. Surtout que, dans\r\nune ville paisible comme Québec, les actes criminels ne sont pas légion. Néanmoins, de\r\nnouveaux indices viennent remettre à l’avant', '9782897116392', 2, 2),
(110, 'Sauvage', 'Jane Harper', '2019', 1, 4, 3, 'De retour à Melbourne, Aaron Falk apprend la disparition d\'Alice Russell. Cette femme d\'affaires, qui n\'est jamais revenue de son séjour d\'entreprise dans le bush, est le témoin clé de sa dernière enquête financière et détient des documents compromettants. Avec sa collègue Carmen, il part pour le bush australien en plein hiver. Prix polar du meilleur roman international 2018.', '9782253086253', 1, 1),
(111, 'Le Diable, tout le temps', 'Donald Ray Pollock', '2014', 1, 5, 3, 'De la fin de la Seconde Guerre mondiale aux années 1960, les destins de plusieurs personnages se croisent et révèlent la part d\'ombre de chacun : un vétéran tourmenté prêt à tout pour sauver sa femme malade, un couple étrange qui tue des auto-stoppeurs, un prédicateur et un musicien infirme fuyant la loi et leur passé. Premier roman.', '9782253175889 ', 1, 1),
(112, 'Rentrer son ventre et sourire', 'Laurence Beaudoin-Masse', '2020', 19, 15, 2, 'Tous les jours, Élie motive ses centaines de milliers d\'abonnées à devenir la meilleure version d\'elles-mêmes. Bien loin de l\'adolescente complexée qu\'elle était, elle est maintenant en couple avec le chanteur Samuel Vanasse et figure parmi les influenceuses les plus populaires au pays. Elle a réussi. Elle brille. Et pourtant, entre l\'obsession du « poids idéal » et l\'envie irrésistible de garroch', '9782897143701 ', 1, 1),
(113, 'The First to Die at the End', ' Adam Silvera', '2022', 19, 16, 2, 'Dans ce préquel du best-seller n°1 du New York Times, Ils meurent tous les deux à la fin, deux nouveaux inconnus passent ensemble une journée qui va changer leur vie après les premiers appels fatidiques du Death-Cast.\r\nC\'est la nuit précédant la mise en ligne du Death-Cast, et une question préoccupe tout le monde : Le Death-Cast peut-il réellement prédire le moment où quelqu\'un va mourir, ou s\'agi', '9780063240803 ', 1, 1),
(114, 'L\'Été devant nous #03 N. éd.\r\n', 'Jenny Han', '2022', 1, 10, 2, 'Alors que Belly et Jeremiah vont se marier, Conrad décide d\'avouer ses sentiments à Belly.', '9782226474261 ', 1, 1),
(115, 'Dix jours avant la fin du monde\r\n', 'Manon Fargetton', '2018', 1, 4, 2, 'France, dans les années 2010. Des explosions d\'origine inconnue frappent la terre. Toute vie est condamnée à disparaître d\'ici dix jours. Six jeunes hommes et femmes s\'unissent pour mettre fin à cette menace.', '9782075110808 ', 1, 1),
(116, 'Les Fiancés de l\'hiver #01\r\n', 'Christelle Dabos', '2013', 1, 4, 2, 'Ce roman a obtenu le prix du premier roman jeunesse organisé à l\'occasion du 40e anniversaire des Editions Gallimard jeunesse. Ayant pour vocation de découvrir et faire connaître de nouveaux talents, il s\'adressait aux auteurs de tous âges, n\'ayant jamais été publiés. La sélection s\'est effectuée parmi 1.362 manuscrits reçus.', '9782070653768 ', 1, 1),
(117, 'Naja #07\r\n', 'Anne Robillard', '2022', 1, 5, 3, 'Le dernier tome de cette série... Wellan et Sierra atteignent Alnilam, avec Onyx. Ce dernier cause une grande panique chez les sorciers. Lors de sa visite du continent, Onyx capte une terrifiante menace! Une fois de retour chez lui, Onyx tient une promesse importante, qui apportera beaucoup de bonheur à plus d’une famille! Pour sa part, Skaïe croit avoir enfin réussi à créer un vortex', '9782924442937 ', 1, 1),
(118, 'Atlas six #01', 'Olivie Blake', '2022', 1, 4, 3, 'Tous les dix ans, les plus talentueux magiciens de leur génération concourent pour gagner leur place au sein de la Société alexandrienne, une organisation secrète et élitiste. Cette année, six talents s\'affrontent : Libby Rhodes, Nicolas Ferrer de Varona, Reina Mori, Tristan Caine, Callum Nova et Parisa Kamali. Ils ont été recrutés par le mystérieux Atlas Blakely.', '9782749949840 ', 1, 1),
(119, 'K.A., la prédatrice\r\n', 'Maude Royer', '2022', 1, 5, 3, 'Une enfant esseulée et négligée qui raconte ses journées à travers une porte obstinément close. Une première mue. Une adolescente harcelée, au corps dépourvu de poils, évoluant dans un monde de non-dits et de demi-vérités. Une deuxième mue. Une jeune femme manipulatrice, au magnétisme animal, qu’un psychiatre espère encore pouvoir sauver. Une troisième mue. Une femme froide, sans états d’âme, ayan', '9782898191176 ', 1, 1),
(120, 'Animal Crossing: New Horizons', 'Nintendo Switch', '2020', 3, 17, 4, 'Une nouvelle vie pleine d\'insouciance vous attend juste au-delà de l\'horizon ! Sautez de l\'avion et prenez pied sur votre propre île déserte où de nouvelles amitiés, découvertes et opportunités vous attendent. Le paradis est ce que vous en faites dans Animal Crossing: New Horizons', NULL, 1, 1),
(121, 'Mario 3D World + Bowser\'s Fury', 'Nintendo Switch', '2021', 3, 17, 4, 'Rejoignez Mario, Luigi, Peach et Toad, et partez à l\'aventure pour sauver le royaume des Libellas dans Super Mario 3D World + Bowser’s Fury sur Nintendo Switch ! En solo ou avec jusqu\'à trois autres joueurs, allez sauver la Princesse Libella et ses sujets dans cette version retravaillée de Super Mario 3D World.\r\nEnsuite, en solo ou avec un ami, vous pouvez aider Bowser Jr. à faire retrouver à son ', NULL, 3, 3),
(122, 'Super Smash Bros. Ultimate', 'Nintendo Switch', '2018', 3, 17, 4, 'Divers modes et options vous permettent de jouer à plusieurs ! Dans le mode Smash, vous pouvez sélectionner vos stages et choisir vos règles pour des combats impliquant jusqu\'à huit joueurs ! Dans Smash en bande, vous pouvez aussi former une équipe de 3 ou 5 combattants pour affronter l\'équipe adverse. Et ce n\'est que le début !', NULL, 1, 1),
(123, 'Hyrule Warriors : L\'Ère du Fléau', 'Nintendo Switch', '2020', 3, 17, 4, 'Un siècle avant les événements de The Legend of Zelda: Breath of the Wild, le sort d\'Hyrule est plus que jamais sur le point de se jouer. Menez vos forces au combat et affrontez la puissance du Fléau Ganon dans le conflit ultime pour la survie du royaume.', NULL, 2, 2),
(124, 'Pokémon Épée', 'Nintendo Switch', '2020', 3, 17, 4, 'Préparez-vous à découvrir la région de Galar et à rencontrer de nouveaux Pokémon dans Pokémon Épée, en exclusivité sur Nintendo Switch !', NULL, 2, 2),
(125, 'FIFA 23', 'Electronic Arts Pc', '2022', 3, 15, 2, 'Il s\'agit de la dernière version du célèbre licence de football en collaboration avec la FIFA. FIFA 23 apporte des améliorations techniques, de nouveaux modes et de nouveaux joueurs pour créer les équipes de foot.', NULL, 2, 2),
(126, 'FIFA 23', 'Electronic Arts PS5', '2022', 3, 15, 2, 'Il s\'agit de la dernière version du célèbre licence de football en collaboration avec la FIFA. FIFA 23 apporte des améliorations techniques, de nouveaux modes et de nouveaux joueurs pour créer les équipes de foot.', NULL, 2, 2),
(127, 'FIFA 23', 'Electronic Arts Xbox Series', '2022', 3, 15, 2, 'Il s\'agit de la dernière version du célèbre licence de football en collaboration avec la FIFA. FIFA 23 apporte des améliorations techniques, de nouveaux modes et de nouveaux joueurs pour créer les équipes de foot.', NULL, 1, 1),
(128, 'FIFA 23', 'Electronic Arts PS4', '2022', 3, 15, 2, 'Il s\'agit de la dernière version du célèbre licence de football en collaboration avec la FIFA. FIFA 23 apporte des améliorations techniques, de nouveaux modes et de nouveaux joueurs pour créer les équipes de foot.', NULL, 1, 1),
(129, 'FIFA 23', 'Electronic Arts ONE', '2022', 3, 15, 2, 'Il s\'agit de la dernière version du célèbre licence de football en collaboration avec la FIFA. FIFA 23 apporte des améliorations techniques, de nouveaux modes et de nouveaux joueurs pour créer les équipes de foot.', NULL, 1, 1),
(130, 'Cyberpunk 2077', 'CD Projekt Pc', '2022', 3, 17, 3, 'Cyberpunk 2077 est un jeu de rôle futuriste et dystopique inspiré du jeu de rôle papier du même nom. Dans un monde devenu indissociable de la cybernétique, l\'indépendance des robots humanoïdes pose quelques problèmes..', NULL, 1, 1),
(131, 'Cyberpunk 2077', 'CD Projekt PS5', '2022', 3, 17, 3, 'Cyberpunk 2077 est un jeu de rôle futuriste et dystopique inspiré du jeu de rôle papier du même nom. Dans un monde devenu indissociable de la cybernétique, l\'indépendance des robots humanoïdes pose quelques problèmes..', NULL, 1, 1),
(132, 'Cyberpunk 2077', 'CD Projekt Xbox Series', '2022', 3, 17, 3, 'Cyberpunk 2077 est un jeu de rôle futuriste et dystopique inspiré du jeu de rôle papier du même nom. Dans un monde devenu indissociable de la cybernétique, l\'indépendance des robots humanoïdes pose quelques problèmes..', NULL, 1, 1),
(133, 'Cyberpunk 2077', 'CD Projekt PS4', '2022', 3, 17, 3, 'Cyberpunk 2077 est un jeu de rôle futuriste et dystopique inspiré du jeu de rôle papier du même nom. Dans un monde devenu indissociable de la cybernétique, l\'indépendance des robots humanoïdes pose quelques problèmes..', NULL, 1, 1),
(134, 'Cyberpunk 2077', 'CD Projekt ONE', '2022', 3, 17, 3, 'Cyberpunk 2077 est un jeu de rôle futuriste et dystopique inspiré du jeu de rôle papier du même nom. Dans un monde devenu indissociable de la cybernétique, l\'indépendance des robots humanoïdes pose quelques problèmes..', NULL, 1, 1),
(135, 'Thriller', 'Michael Jackson', '1982', 6, 1, 3, 'est le sixième album studio de l\'artiste américain Michael Jackson, son deuxième chez Epic Records. Coproduit par Quincy Jones, il sort le 30 novembre 1982, à la suite du succès commercial et critique de l\'album Off the Wall (1979). Thriller explore des genres musicaux tels le funk, le post-disco, la musique soul, le soft rock, le R&B et la pop. ', NULL, 3, 3),
(136, 'Back in Black', 'AC/DC', '1980', 6, 1, 3, 'Sorti le 25 juillet 1980, est le 6e album du groupe de hard rock AC/DC. Il s\'agit du premier album du groupe enregistré avec le chanteur Brian Johnson, remplaçant Bon Scott, le précédent chanteur3, décédé six mois plus tôt et à qui l\'album rend hommage.', NULL, 2, 2),
(137, 'The Dark Side of the Moon', 'Pink Floyd', '1973', 6, 1, 3, ' le huitième album studio du groupe britannique de rock progressif Pink Floyd, sorti le 1er mars 1973 chez Harvest Records. Le groupe présente une première version de l\'album, principalement développée lors de prestations en public, plusieurs mois avant le début de l\'enregistrement.', NULL, 2, 2),
(138, 'Saturday Night Fever', 'Bee Gees / Artistes divers', '1977', 6, 1, 3, 'Saturday Night Fever est la bande originale du film La Fièvre du samedi soir, composée en grande partie par les Bee Gees, enregistrée au château d\'Hérouville4 en 1977 et sortie en 1978. Elle a reçu le Grammy Award de l\'album de l\'année en 1979.', NULL, 2, 2),
(139, 'Come On Over', 'Shania Twain', '1997', 6, 1, 3, 'Come On Over est le troisième album de Shania Twain. Dévoilant sa vraie personnalité, elle s\'implique davantage dans l\'écriture des chansons. Avec 40 millions d\'exemplaires vendus à travers le monde, c\'est l\'un des albums les plus vendus de l\'histoire', NULL, 1, 1),
(140, 'Led Zeppelin IV', 'Led Zeppelin', '1971', 6, 1, 3, 'Led Zeppelin IV est le titre généralement utilisé mais non officiel pour nommer le quatrième album du groupe de rock britannique Led Zeppelin sorti le 8 novembre 1971 et dont la pochette originale ne comprenait pas la moindre inscription, y compris sur la tranche.', NULL, 2, 2),
(141, 'Abbey Road', 'The Beatles', '1969', 6, 1, 3, 'Abbey Road est le onzième album original publié par les Beatles, paru le 12 septembre 1969 en France, le 26 septembre 1969 au Royaume-Uni, et le 1er octobre aux États-Unis et au Canada. Bien que sa sortie précède celle de Let It Be, paru en mai 1970, il est le dernier album enregistré par les « Fab Four ». Le 20 août 1969, les quatre Beatles sont réunis pour la toute dernière fois en studio et, le', NULL, 3, 3),
(142, 'Nevermind', 'Nirvana', '1991', 6, 1, 3, 'Nevermind est le deuxième album studio du groupe américain de grunge Nirvana, sorti le 24 septembre 1991 par le label DGC Records. Kurt Cobain écrit et compose seul quasiment toutes les chansons de l\'album et le groupe commence à enregistrer en avril 1990 avec le producteur Butch Vig mais la session est interrompue prématurément.', NULL, 2, 2),
(143, 'Supernatural', 'Santana', '1999', 6, 1, 3, 'Cet album est le plus grand succès commercial de Santana avec plus de 30 millions d\'exemplaires vendus dans le monde1.', NULL, 1, 1),
(144, 'Détroit', 'Caroline Shaw', '2021', 6, 2, 3, 'ant de nouvelles compositions semblent établir des liens entre le minimalisme contemporain et la musique ancienne. Narrow Sea voit le compositeur Shaw, lauréat du prix Pulitzer, créer une variété très américaine de minimalisme antique, mettant en vedette la soprano d’opéra Dawn Upshaw.', NULL, 1, 1),
(145, 'Changer de sonnerie', 'Robert Ames', '2021', 6, 2, 3, 'Robert Ames, fondateur du London Contemporary Orchestra, est un lien crucial dans la musique moderne, l’arrangeur et chef d’orchestre reliant Jonny Greenwood, Frank Ocean, Little Simz, Jónsi et Actrice aux minimalistes contemporains.', NULL, 1, 1),
(146, 'Inkling', 'Ensemble de broches', '2021', 6, 2, 3, 'L’intrigant Spindle Ensemble de Bristol présente le compositeur et pianiste Daniel Inzani soutenu par des vibrations, un violon et un violoncelle. Leur deuxième LP présente un minimalisme convaincant à la Philip Glass, mais pousse également vers l’exotisme à la Morricone, ', NULL, 1, 1),
(147, 'Connexion', 'KMRU', '2021', 6, 2, 3, 'La page Bandcamp de KMRU – un artiste sonore basé entre Berlin et Nairobi, AKA Joseph Kamaru – vaut toujours le détour pour les textures ambiantes. Logue, le troisième des cinq mini-albums qu’il a sortis cette année, est un mélange addictif d’électro méditative, de synth-pop au ralenti et d’enregistrements bucoliques d’Afrique de l’Est.', NULL, 1, 1),
(148, 'Angleterre profonde', 'Gazelle Twin & NYX', '2021', 6, 2, 3, 'L’album 2018 de Gazelle Twin Pastoral était un voyage fébrile au cœur du centre de l’Angleterre, mêlant chants folkloriques menaçants, techno voyous et paroles satiriques, avec la chanteuse, compositrice et productrice Elizabeth Bernholz servant de bouffon rétro-futuriste. ', NULL, 1, 1),
(149, 'Adan balayé par le vent', 'Ichiko Aoba', '2021', 6, 2, 3, 'Cette chanteuse, auteur-compositeur et guitariste japonaise est surtout connue pour son approche merveilleusement capricieuse de la bossa nova, mais sa première collaboration avec le pianiste et compositeur Taro Umebayashi marque un changement de cap marqué.', NULL, 1, 1),
(150, 'Fondre', 'Gloss vierge', '2021', 6, 2, 3, 'Le dernier né de ce duo de Sacramento est un ajout fascinant au genre naissant de l’ambient Americana. Il rassemble les tropes sonores déterminants de la musique roots américaine (woozy pedal steel, slurring fiddles, brushed drums et reverb-tremped guitare électrique) sous forme de sons désincarnés passés à travers un filtre ambiant.', NULL, 1, 1),
(151, 'Travail honnête', 'Space Afrika', '2021', 6, 2, 3, 'Le troisième album à proprement parler du duo de Manchester est un véritable voyage immersif – 19 pistes d’enregistrements de terrain manipulés, de drones de synthé, de lignes de basse hantées et de breakbeats à peine présents.', NULL, 1, 1),
(152, 'Tonebeds for Poetry', 'Stick in the Wheel', '2021', 6, 2, 3, 'Mieux connu pour sa musique folk punk à l’accent londonien, ce LP voit le duo de Walthamstow puiser dans leur expérience en électronique expérimentale pour offrir un voyage psychogéographique à travers la capitale. Les poèmes anglo-saxons sont refondus en sludge metal ;', NULL, 1, 1),
(153, 'Promesses', 'Floating Points', '2021', 6, 2, 3, 'Promises est une remarquable collaboration à trois qui est à la fois une suite orchestrale, un morceau d’improvisation libre et un chef-d’œuvre électronique révolutionnaire.  Des improvisations de jazz modal sans friction et un riff de clavecin baroque en constante mutation, ralentissant tout le temps votre perceptions du temps et de l’espace.', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE `employes` (
  `Matricule` int(6) NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `Courriel` varchar(200) NOT NULL,
  `Province` varchar(25) NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `Ville` varchar(40) NOT NULL,
  `CodePostal` varchar(20) NOT NULL,
  `DateEmboche` date NOT NULL,
  `Type` int(3) NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employes`
--

INSERT INTO `employes` (`Matricule`, `Nom`, `Prenom`, `Telephone`, `Courriel`, `Province`, `Adresse`, `Ville`, `CodePostal`, `DateEmboche`, `Type`, `Password`) VALUES
(101, 'Slim', 'Amamou', '15149466123', 'Slim@bibliothequeadmin.ca', 'Quebec', '2323, 16em rue', 'Laval', 'h2d5t6', '2022-11-01', 1, 'P12.cdicollege'),
(103, 'Martin', 'Roy', '12386575656', 'Martin@bibliothequeadmin.ca', 'Quebec', '4545, boulvard Cartier', 'Laval', 'h6r6d9', '2022-11-01', 1, 'Istructor.cdi1'),
(104, 'Melanie', 'Richard', '15389965300', 'Melanie@bibliotheque.ca', 'Quebec', '12, Rue Gutengerg', 'Pointe Clair', 'p7c8a1', '2022-11-01', 2, 'bibliothecaire.1'),
(105, 'Aude', 'Lalande', '12413253250', 'Aude@bibliotheque.ca', 'Quebec', '321, place du festival', 'Pointe Clair', 'p7c8b2', '2022-11-01', 2, 'bibliothecaire.2'),
(106, 'Vicent', 'Emile', '322 125 8888', 'emile@bibliotheque.ca', 'Quebec', '121,#12,Rue LaManche', 'Saint Paul', 'S8S8D6', '2022-11-06', 2, 'Bibliotecaire.3'),
(108, 'Lalande', 'Catherine', '235 999 6922', 'catherin@bibliothequeadmin.cs', 'Quebec', '3266,Rue Mercier', 'Pointe Clair', 'Y8I9P6', '2022-11-06', 1, 'Bibliotecaire.admin3'),
(109, 'Maalaoui', 'Rayaane', '235 999 6900', 'Rayaane@Bibliothequeadmin.ca', 'Quebec', '3,#1203, blv st-Denis', 'Montreal', 'M9Y8I9', '2022-11-08', 1, 'Bibliotecaire.admin4'),
(110, 'Jean Pascal', 'Emile', '235 363 3214', 'emile@bibliothequeAdmin.com', 'Quebec', '336, #104, rue laFrance', 'Port Cartier', 'p8y8r2', '2022-11-18', 1, 'Bibliotecaire.admin5');

-- --------------------------------------------------------

--
-- Structure de la table `genre_documents`
--

CREATE TABLE `genre_documents` (
  `IdGenre` int(4) NOT NULL,
  `Genre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `genre_documents`
--

INSERT INTO `genre_documents` (`IdGenre`, `Genre`) VALUES
(1, 'classique'),
(2, 'contemporains'),
(3, 'policier, espionage'),
(4, 'science fiction'),
(5, 'fatastique'),
(6, 'educatif'),
(7, 'histoire reel'),
(8, 'comedie'),
(9, 'action'),
(10, 'romantique'),
(11, 'documentaire'),
(12, 'drame'),
(13, 'horreur'),
(14, 'intrigant'),
(15, 'decontractant'),
(16, 'spirituel'),
(17, 'aventure'),
(18, 'biographie');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `IdMembre` int(10) NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `Courriel` varchar(100) NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`IdMembre`, `Nom`, `Prenom`, `Adresse`, `Telephone`, `Courriel`, `Password`) VALUES
(1, 'Roy', 'Sebastien', '3215, Blv Cartier, j9y8j9', '124 5632323', 'sebastien@gmail.com', 'Seb.3215biblio'),
(2, 'Guilbaut', 'Mark', '2323,app96, lesvesque', '322 522 6633', 'mark@gmail.com', 'Mark.biblio3'),
(4, 'Kobayachi', 'Fares', '362, blv le duck, t8y8i5', '211 325 9696', 'fares@gmail.com', 'Biblio.fares32'),
(5, 'Paul', 'MarieLuise', '1235, chemin le ber', '235 968 6266', 'marieluise@gmail.com', 'Biblio.Luise2'),
(6, 'Farfouri', 'Habiba', '236, rue le march&eacute;, k6h6u6', '322 522 6122', 'habiba@gmail.com', 'Habhoub.3369'),
(7, 'Ross', 'Linda', '102,#12,Rue le Duc, p7y8u9', '235 669 8585', 'linda@gmail.com', 'Lili.biblio6'),
(8, 'Christopher', 'Smith', '275,blv st Jerome, o2p3d6', '235 698 6545', 'chris@gmail.com', 'Chris?%bib2'),
(9, 'Klay', 'Mohamed Ali', '33, 33&egrave;me rue, h4y7r8', '211 325 3333', 'momo@hotmail.com', 'momo.leboss3F'),
(10, 'Imed', 'Ben Younes', '326,#102, rue la france, p8u8t9', '236 666 9966', 'imed@gmail.com', 'Imed.biblio9');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `IdTransaction` bigint(20) NOT NULL,
  `IdDocument` int(12) NOT NULL,
  `IdMembre` int(10) NOT NULL,
  `MatriculeEmploye` int(6) DEFAULT NULL,
  `Type` int(6) NOT NULL,
  `DateReservation` date DEFAULT NULL,
  `DatePret` date DEFAULT NULL,
  `DateRetour` date DEFAULT NULL,
  `RetourReel` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`IdTransaction`, `IdDocument`, `IdMembre`, `MatriculeEmploye`, `Type`, `DateReservation`, `DatePret`, `DateRetour`, `RetourReel`) VALUES
(33, 34, 7, 109, 1, NULL, '2022-11-12', '2022-11-16', '2022-11-14'),
(34, 35, 8, 103, 1, NULL, '2022-11-12', '2022-11-16', '2022-11-14'),
(35, 36, 1, 103, 1, NULL, '2022-11-12', '2022-11-16', '2022-11-14'),
(36, 37, 2, 106, 1, NULL, '2022-11-08', '2022-11-16', '2022-11-14'),
(37, 38, 5, 108, 1, NULL, '2022-11-10', '2022-11-13', '2022-11-14'),
(42, 152, 6, 103, 1, NULL, '2022-11-12', '2022-11-16', '2022-11-15'),
(43, 151, 5, 103, 1, NULL, '2022-11-09', '2022-11-16', '2022-11-15'),
(46, 1, 5, 105, 1, NULL, '2022-11-09', '2022-11-19', '2022-11-18'),
(59, 3, 1, 101, 1, NULL, '2022-11-18', '2022-11-20', '2022-11-18'),
(79, 1, 1, 101, 1, NULL, '2022-11-18', '2022-11-21', '2022-11-20'),
(81, 3, 5, 101, 1, NULL, '2022-11-18', '2022-11-21', '2022-11-20'),
(82, 4, 1, 101, 1, NULL, '2022-11-18', '2022-11-21', '2022-11-20'),
(83, 6, 9, 101, 1, NULL, '2022-11-18', '2022-11-24', '2022-11-20'),
(84, 7, 9, 101, 1, NULL, '2022-11-18', '2022-11-23', NULL),
(90, 3, 8, 101, 1, NULL, '2022-11-20', '2022-11-22', '2022-11-20'),
(91, 3, 4, 101, 2, '2022-11-20', NULL, NULL, NULL),
(92, 4, 8, 101, 1, NULL, '2022-11-20', '2022-11-23', '2022-11-20'),
(93, 7, 9, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(94, 5, 6, 101, 1, NULL, '2022-11-20', '2022-11-24', NULL),
(95, 26, 1, 101, 1, NULL, '2022-11-20', '2022-11-21', NULL),
(96, 27, 6, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(97, 1, 8, 101, 1, NULL, '2022-11-20', '2022-11-25', NULL),
(98, 2, 4, 101, 1, NULL, '2022-11-20', '2022-11-24', NULL),
(99, 29, 8, 101, 1, NULL, '2022-11-20', '2022-11-24', '2022-11-20'),
(100, 7, 8, 101, 1, NULL, '2022-11-20', '2022-11-25', NULL),
(101, 5, 5, 101, 1, NULL, '2022-11-20', '2022-11-24', NULL),
(102, 26, 8, 101, 1, NULL, '2022-11-20', '2022-11-24', NULL),
(103, 30, 8, 101, 1, NULL, '2022-11-20', '2022-11-22', NULL),
(104, 31, 1, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(105, 26, 8, 101, 1, NULL, '2022-11-20', '2022-11-22', NULL),
(106, 28, 9, 101, 1, NULL, '2022-11-20', '2022-11-25', NULL),
(107, 28, 4, 101, 1, NULL, '2022-11-20', '2022-11-25', NULL),
(108, 32, 2, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(109, 34, 5, 101, 1, NULL, '2022-11-20', '2022-11-24', NULL),
(110, 34, 6, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(111, 35, 1, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(112, 35, 7, 101, 1, NULL, '2022-11-20', '2022-11-24', NULL),
(113, 36, 2, 101, 1, NULL, '2022-11-20', '2022-11-23', '2022-11-20'),
(114, 37, 9, 101, 1, NULL, '2022-11-20', '2022-11-25', NULL),
(115, 38, 4, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(116, 38, 7, 101, 1, NULL, '2022-11-20', '2022-11-22', NULL),
(117, 33, 5, 101, 1, NULL, '2022-11-20', '2022-11-22', NULL),
(118, 33, 6, 101, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(120, 38, 7, 101, 2, '2022-11-20', NULL, NULL, NULL),
(121, 39, 9, 101, 1, NULL, '2022-11-20', '2022-11-24', '2022-11-20'),
(122, 6, 8, 104, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(123, 134, 10, NULL, 2, '2022-11-20', NULL, NULL, NULL),
(124, 29, 10, NULL, 2, '2022-11-20', NULL, NULL, NULL),
(125, 52, 7, 103, 2, '2022-11-20', NULL, NULL, NULL),
(126, 4, 4, 103, 1, NULL, '2022-11-20', '2022-11-23', NULL),
(127, 52, 8, 103, 1, NULL, '2022-11-20', '2022-11-23', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `types_documents`
--

CREATE TABLE `types_documents` (
  `IdType` int(4) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `types_documents`
--

INSERT INTO `types_documents` (`IdType`, `Type`) VALUES
(1, 'enfant'),
(2, 'ado'),
(3, 'adulte'),
(4, 'famille');

-- --------------------------------------------------------

--
-- Structure de la table `types_employes`
--

CREATE TABLE `types_employes` (
  `IdPostes` int(3) NOT NULL,
  `Type` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `types_employes`
--

INSERT INTO `types_employes` (`IdPostes`, `Type`) VALUES
(1, 'administrateur'),
(2, 'employe');

-- --------------------------------------------------------

--
-- Structure de la table `types_transactions`
--

CREATE TABLE `types_transactions` (
  `IdType` int(3) NOT NULL,
  `TypeTransaction` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `types_transactions`
--

INSERT INTO `types_transactions` (`IdType`, `TypeTransaction`) VALUES
(1, 'pret'),
(2, 'reservation');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories_documents`
--
ALTER TABLE `categories_documents`
  ADD PRIMARY KEY (`IdCategorie`);

--
-- Index pour la table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`IdDocument`),
  ADD KEY `Categorie` (`Categorie`),
  ADD KEY `Genre` (`Genre`),
  ADD KEY `Type` (`Type`);

--
-- Index pour la table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`Matricule`),
  ADD KEY `Type` (`Type`);

--
-- Index pour la table `genre_documents`
--
ALTER TABLE `genre_documents`
  ADD PRIMARY KEY (`IdGenre`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`IdMembre`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`IdTransaction`),
  ADD KEY `Type` (`Type`),
  ADD KEY `MatriculeEmploye` (`MatriculeEmploye`),
  ADD KEY `IdMembre` (`IdMembre`),
  ADD KEY `IdDocument` (`IdDocument`);

--
-- Index pour la table `types_documents`
--
ALTER TABLE `types_documents`
  ADD PRIMARY KEY (`IdType`);

--
-- Index pour la table `types_employes`
--
ALTER TABLE `types_employes`
  ADD PRIMARY KEY (`IdPostes`),
  ADD UNIQUE KEY `IdPostes` (`IdPostes`);

--
-- Index pour la table `types_transactions`
--
ALTER TABLE `types_transactions`
  ADD PRIMARY KEY (`IdType`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories_documents`
--
ALTER TABLE `categories_documents`
  MODIFY `IdCategorie` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `documents`
--
ALTER TABLE `documents`
  MODIFY `IdDocument` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT pour la table `employes`
--
ALTER TABLE `employes`
  MODIFY `Matricule` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT pour la table `genre_documents`
--
ALTER TABLE `genre_documents`
  MODIFY `IdGenre` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `IdMembre` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `IdTransaction` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT pour la table `types_documents`
--
ALTER TABLE `types_documents`
  MODIFY `IdType` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `types_employes`
--
ALTER TABLE `types_employes`
  MODIFY `IdPostes` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `types_transactions`
--
ALTER TABLE `types_transactions`
  MODIFY `IdType` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`Categorie`) REFERENCES `categories_documents` (`IdCategorie`),
  ADD CONSTRAINT `documents_ibfk_2` FOREIGN KEY (`Type`) REFERENCES `types_documents` (`IdType`),
  ADD CONSTRAINT `documents_ibfk_3` FOREIGN KEY (`Genre`) REFERENCES `genre_documents` (`IdGenre`);

--
-- Contraintes pour la table `employes`
--
ALTER TABLE `employes`
  ADD CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `types_employes` (`IdPostes`);

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`IdMembre`) REFERENCES `membres` (`IdMembre`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`IdDocument`) REFERENCES `documents` (`IdDocument`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`MatriculeEmploye`) REFERENCES `employes` (`Matricule`),
  ADD CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`Type`) REFERENCES `types_transactions` (`IdType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
