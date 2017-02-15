-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 20, 2016 at 01:27 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teste`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL,
  `end_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `content`, `date`, `end_ip`) VALUES
(25, 33, 'Francisco Chygalo Tchym Tchim', 'Gostei... Miuto bom', 1463761242, '192.168.254.30'),
(24, 33, 'Eduardo Felizardo', 'Muito bom!!!', 1463761221, '192.168.254.30'),
(21, 32, 'shocker', 'Simplesmente excelente!!!\r\nMeus parabÃ©ns!\r\nÃ‰ um dos mais completos artigos sobre o Gentoo que eu jÃ¡ vi!\r\n\r\nFiquei curioso e vou instalÃ¡-lo por aqui, para conhecer mais... :)\r\n\r\n[]''s\r\nAlan Cota.', 1463759894, '192.168.254.30'),
(22, 32, 'anunakin', 'Valeu, em breve devo publicar outros artigos.\r\n\r\nApenas uma errata no Artigo:\r\nNa pÃ¡gina 3,\r\nAonde lÃª-se: # mkswapon /dev/hda1\r\nDeveria ser: # swapon /dev/hda1', 1463759921, '192.168.254.30'),
(23, 32, 'jroliv', 'Parabens cara!!\r\nExcelente Artigo... !!\r\nInstalei o Gentoo uma vez seguindo o tutorial do site oficial, dÃ¡ um certo trabalho.. e paciencia..!!\r\nMas Ã© gratificante, o Gentoo Ã© rÃ¡pido e prÃ¡tico com o Portage!\r\nLegal... publica mais artigos..\r\nah.. quem for instalar, tem que descompactar o Stage certo para a CPU utilizada!\r\n\r\nabraÃ§o!', 1463759992, '192.168.254.30'),
(26, 33, 'Pedro Henrique', 'Ao ligar meu pc aparece: Detect driver dones, no any drive found e logo em seguida a mÃ¡quina vai pra uma tela onde Ã© exibida outra mensagem: pcie-to-sataII/IDE Raid controller bios v1.06.70...Por favor, alguÃ©m pode me ajudar nesta questÃ£o, isso porque, nÃ£o tenho idÃ©ia de como resolver esse problema! Obrigado', 1463761263, '192.168.254.30');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `num_comments` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `num_comments`, `date`) VALUES
(33, 'O que Ã© RAID?', 'RAID, sigla de redundant array of independent disks (Conjunto Redundante de Discos Independentes), Ã© um mecanismo criado com o objetivo de melhorar o desempenho e seguranÃ§a dos discos rÃ­gidos existentes em um PC qualquer, atravÃ©s do uso de HDs extras.\r\n\r\nExistem vÃ¡rios mecanismos de RAID distintos, dos quais se destacam o  RAID 0 atÃ© o RAID 6, alÃ©m dos RAID 10 e RAID 01.  Cada um deles Ã© destinado para um problema em especÃ­fico, portanto, possuindo caracterÃ­sticas prÃ³prias. Neste artigo vamos abordar em detalhes o RAID 0 e RAID 1, os quais sÃ£o esquemas de redundÃ¢ncia de dados mais usados na atualidade.\r\n\r\nRAID 0 e a divisÃ£o de dados\r\n\r\nRAID 0A divisÃ£o de dados consiste em usar um disco extra em paralelo para armazenÃ¡-los, dividindo a informaÃ§Ã£o atravÃ©s dos dois HDs disponÃ­veis. Sua vantagem estÃ¡ no fato de ser possÃ­vel ler e gravar o dobro de informaÃ§Ãµes ao mesmo tempo, assim diminuindo o tempo de operaÃ§Ã£o quase pela metade. Tal esquema Ã©  a base do RAID 0. Vamos exemplificar o seu funcionamento atravÃ©s do seguinte exemplo. Suponha que o seu computador tenha um Ãºnico disco rÃ­gido e vocÃª deseja que o dobro de dados seja transmitido ao mesmo tempo.\r\n\r\nNo RAID 0,  um novo disco Ã© utilizado em paralelo com o jÃ¡ existente, dividindo o conteÃºdo entre os dois HDS. Suponha que uma palavra seja formada pelos caracteres A1A2...A7A8. Neste mecanismo, nÃ³s mandarÃ­amos os caracteres com final Ã­mpar, para o disco 0 e com o final par para o disco 1. O resultado pode ser conferido na ilustraÃ§Ã£o ao lado.\r\n\r\nTanto na leitura e na escrita em uma posiÃ§Ã£o qualquer, ela serÃ¡ acessada em ambos os discos ao mesmo tempo. Isso faz com que dois dados sejam lidos ou escritos no mesmo momento, dobrando a taxa de leitura ou gravaÃ§Ã£o. Logo, se a taxa de transferÃªncia era de 100 MB/s, ela passaria a trabalhar como 200 MB/s. As principais desvantagens deste mÃ©todo sÃ£o o custo adicional do HD extra e o fato de que um erro em um disco compromete toda a informaÃ§Ã£o armazenada.\r\n\r\nRAID 1 e a replicaÃ§Ã£o de conteÃºdo\r\nRAID 1\r\nA replicaÃ§Ã£o, como seu prÃ³prio nome indica,  faz com que dois ou mais discos possuam exatamente o mesmo conteÃºdo, tornando um cÃ³pia idÃªntica do outro. Assim, sempre haverÃ¡ um backup pronto para ser utilizado. Consequentemente Ã© necessÃ¡rio tambÃ©m duplicar o hardware utilizado. Tal esquema Ã© a base do RAID 1.  \r\n\r\nSuponha que por algum motivo um computador apresente perdas de dados em seu disco rÃ­gido. Com o RAID 1, um segundo disco seria usado paralelamente ao primeiro, funcionando como cÃ³pia idÃªntica. Em uma escrita, os dados necessitam ser modificados nos dois discos ao mesmo tempo. Por exemplo, a palavra A1A2A3A4 ficaria armazenada do mesmo modo em ambos HDs.\r\n\r\nAssim a taxa de transferÃªncia de dados continuaria a mesma, mas o espaÃ§o utilizado seria o dobro do real, pois um disco rÃ­gido de 250 MB exigiria outra cÃ³pia idÃªntica de 250 MB.\r\n\r\n\r\n\r\nRAIDs que trabalham com paridade\r\n\r\nDuplicar um disco inteiro como backup pode nÃ£o ser uma Ã³tima opÃ§Ã£o, principalmente se a sua mÃ¡quina utiliza vÃ¡rios Hds ao mesmo tempo. Por isso, os mecanismos de RAID 3 atÃ© o RAID 6 efetuam cÃ¡lculos de paridade de uma mesma posiÃ§Ã£o em todos os discos e armazenam o resultado em um novo disco. Dependendo do RAID utilizado, o esquema de paridade varia um pouco, mas o princÃ­pio continua o mesmo. Em seguida, um novo cÃ¡lculo de paridade Ã© efetuado. Caso os resultados obtidos sejam distintos, significa que algum bit estÃ¡ incorreto. A figura abaixo exemplifica o esquema, reapresentando o RAID 4.\r\n\r\nRAID 4\r\n\r\nComo Ã© possÃ­vel perceber, os discos 0, 1 e 2 sÃ£o os que efetivamente guardam os dados, enquanto que o disco 3 guarda a paridade. Deste modo, para 3 HDs, precisamos somente um disco adicional, o que gera uma economia de hardware comparado com o RAID 1.', 3, 1463761194),
(32, 'Instalando e usando o Gentoo GNU/Linux', 'IntroduÃ§Ã£o\r\n\r\n\r\nJustificativa\r\n\r\nA crescente utilizaÃ§Ã£o do Gentoo GNU/Linux em ambientes pessoais, servidores e mesmo em dispositivos mÃ³veis, tem aumentado o interesse do pÃºblico nessa distribuiÃ§Ã£o, que tem em seu ponto forte o maior obstÃ¡culo aos iniciantes. Trata-se do processo de instalaÃ§Ã£o, o qual Ã©, por padrÃ£o, totalmente em modo texto, podendo ser executado de milhares de formas possÃ­veis. Este tutorial visa esclarecer os passos necessÃ¡rios Ã  instalaÃ§Ã£o e os princÃ­pios bÃ¡sicos da utilizaÃ§Ã£o do gerenciador de pacotes, o Portage.\r\n\r\nObjetivo\r\n\r\nDotar o participante de conhecimentos necessÃ¡rios Ã  instalaÃ§Ã£o do Gentoo GNU/Linux, seus arquivos de configuraÃ§Ã£o, bem como nos fundamentos da utilizaÃ§Ã£o do gerenciador de pacotes Portage.\r\n\r\nRequisitos\r\n\r\n    Conhecimentos bÃ¡sicos de Linux ou outros sistemas Unix;\r\n    NoÃ§Ãµes de compilaÃ§Ã£o e configuraÃ§Ã£o do Kernel; \r\n\r\n\r\nFilosofia\r\n\r\nImagine um sistema operacional feito sob medida para uso em sua mÃ¡quina, utilizando cada instruÃ§Ã£o que a CPU Ã© capaz de processar e, acima de tudo, sendo estÃ¡vel e ao contrÃ¡rio do que possa imaginar, bastante fÃ¡cil de manter e gerenciar. Este Ã© o Gentoo GNU/Linux.\r\n\r\nInstalaÃ§Ã£o\r\n\r\nComo jÃ¡ foi citado, hÃ¡ milhares de formas de se fazer uma instalaÃ§Ã£o do Gentoo. Por esse motivo irei definir, para efeitos prÃ¡ticos e de limitaÃ§Ã£o de tempo, que nossa instalaÃ§Ã£o neste tutorial adotarÃ¡ uma instalaÃ§Ã£o sem compilaÃ§Ãµes. Apenas o kernel serÃ¡ compilado. Estaremos no estÃ¡gio 3 e o CD de pacotes da versÃ£o 2005.0 do Gentoo.\r\n\r\nEste procedimento nÃ£o afetarÃ¡ em nada o entendimento de como proceder a compilaÃ§Ã£o total e a otimizaÃ§Ã£o para a mÃ¡xima performance do sistema, usando cada ciclo da CPU. Note que a recompilaÃ§Ã£o total do sistema ainda pode ser feita apÃ³s a instalaÃ§Ã£o, usando uma simples linha de comando.\r\n\r\nEste mÃ©todo tem se mostrado muito mais vantajoso, pois te libera a mÃ¡quina para uso quase que no mesmo tempo demandado por uma distribuiÃ§Ã£o Linux tÃ­pica, podendo fazer as compilaÃ§Ãµes em segundo plano e durante a madrugada.\r\n\r\nATENÃ‡ÃƒO: Todos os procedimentos contidos neste tutorial usarÃ£o linhas de comando e versÃµes de programas usados no Gentoo 2005.0. VersÃµes posteriores deste documento irÃ£o conter informaÃ§Ãµes sobre outros mÃ©todos de instalaÃ§Ã£o e mais detalhes sobre a otimizaÃ§Ã£o do sistema.\r\n\r\nMÃ©todos de InstalaÃ§Ã£o\r\n\r\nBasicamente o Gentoo adota trÃªs mÃ©todos de instalaÃ§Ã£o: o totalmente compilado (stage 1), o parcialmente compilado (stage 2) e o previamente compilado (stage 3). Algumas distribuiÃ§Ãµes jÃ¡ usam uma abordagem parecida, porÃ©m bastante limitada, como a SuSE, que possui kerneis prÃ©-compilados especÃ­ficos para diversos processadores como Pentium 4 e Athlon XP, porÃ©m seus outros pacotes sÃ£o todos genÃ©ricos i686.\r\n\r\n    Stage 1: Totalmente compilado;\r\n    Stage 2: Parcialmente compilado;\r\n    Stage 3: Previamente compilado; \r\n\r\n\r\nO CD de pacotes (GRP - Gentoo Resource Packages)\r\n\r\nTrata-se de um conjunto de pacotes previamente compilados para uma plataforma especÃ­fica e disponÃ­vel para vÃ¡rias destas como: Pentium 3, AMD64. Sparc 64, MAC G4 e G5, Athlon XP, e muitas outras. O CD de pacotes Ã© distribuÃ­do somente sob a forma de torrents.\r\n\r\n    http://torrents.gentoo.org \r\n\r\n\r\nEste CD contÃ©m versÃµes prÃ©-compiladas do KDE, GNOME, X.org, OpenOffice.org, dentre outros. Sendo estes os programas mais usados no ambiente Linux, torna o processo de instalaÃ§Ã£o do Gentoo muito mais fÃ¡cil, prÃ¡tico e rÃ¡pido.\r\n\r\nAlÃ©m do CD de pacotes podemos citar que a nova versÃ£o do Gentoo, a 2005.0, jÃ¡ conta com um pacote chamado stage3-x86-hardened, contendo um kernel genÃ©rico prÃ©-compilado para x86, bem como alguns programas associados ao kernel e que dependem deste para compilaÃ§Ã£o (splashutils, alsa-drivers, etc). Este pacote possui configuraÃ§Ãµes voltadas especificamente para seguranÃ§a.\r\n\r\nCompilar ou nÃ£o compilar?\r\n\r\nO processo de compilaÃ§Ã£o, considerando-se o porte do equipamento, pode demandar vÃ¡rias horas e atÃ© mesmo dias para se completar uma instalaÃ§Ã£o completa do Gentoo, incluindo KDE, GNOME, OpenOffice, dentre outros. PorÃ©m a otimizaÃ§Ã£o do sistema tem um benefÃ­cio que supera todas estas adversidades. A performance global do sistema Ã© insuperÃ¡vel e, a longo prazo, vocÃª acaba ganhando todas essas horas de compilaÃ§Ã£o sob a forma de processo e programas mais velozes.', 3, 1463759637);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`) VALUES
(1, 'admin', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
