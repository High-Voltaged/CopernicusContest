-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2020 at 01:36 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `copernicus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` char(32) NOT NULL,
  `password` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2b$08$JqqlHy0jLezR.mqXXlrEM.8NJKmO4u.YdDo1JXiLqFJYvK4GKdqRO');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `picture_link` char(255) NOT NULL,
  `important` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL,
  `times_read` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `picture_link`, `important`, `category_id`, `times_read`, `timestamp`) VALUES
(73, 'Najważniejsze wynalazki i odkrycia Mikołaja Kopernika', '<b>1. Teoria heliocentryczna</b>\r\nOczywiście, do tych najważniejszych należy propagowanie teorii heliocentrycznej, która była znana już w czasach starożytnych, ale dopiero dzieło Kopernika, „O obrotach sfer niebieskich”, było prawdziwą sensacją w świecie nauki. Sześć ksiąg, składających się na kontrowersyjną pracę, ukazało się w 1543 roku w Norymberdze. To tutaj znalazł się wykład o budowie świata, według którego Słońce znajduje się w centrum Układu Słonecznego, a planety krążą wokół niego.\r\n\r\n\r\n<b>2. Traktatem o monetach</b>\r\nTraktat monetarny Mikołaja Kopernika, zwany również „Traktatem o monetach” był pracą z dziedziny polityki pieniężnej, którą Kopernik wykonał na zlecenie króla Zygmunta Starego. Naukowiec zwrócił w niej uwagę na relację między podażą a inflacją, ale nie tylko.\r\n\r\n\r\n<b>3. Prawo Kopernika-Greshama</b>\r\nPrawo Kopernika-Greshama to jedna z teorii traktatu monetarnego, która zakłada, że jeśli istnieją pieniądze, które są różne, ale zgodnie z prawem równowartościowe, to te, które wykonano z lepszego kruszcu, będą gromadzone, a w obiegu zostaną te gorsze. Thomas Gresham był, podobnie jak Kopernik, ekonomistą, który równolegle zajmował się tym zagadnieniem, a na cześć naukowców prawo to nosi ich imiona.\r\n\r\n<b>4. Twierdzenie Kopernika</b>\r\nTwierdzenie Kopernika zostało odkryte dwukrotnie już dużo wcześniej, ale toruński uczony nie miał o tym pojęcia, stąd jego publikacja w 1543 roku. Zakłada ono, że jeśli wewnątrz okręgu toczy się okrąg o promieniu dwa razy mniejszym, to dowolny ustalony punkt mniejszego okręgu będzie się poruszał prostoliniowo po średnicy tego większego.\r\n\r\n<b>5. Zmienność ekscentryczności Ziemi,</b>\r\nKopernik prowadził obserwacje astronomiczne, dzięki którym udało mu się odkryć zmienność ekscentryczności Ziemi, czyli wielkości, która charakteryzuje kształt orbity, a także ruchu apogeum słonecznego wobec gwiazd stałych.\r\n\r\n<b>6. Reforma kalendarza juliańskiego</b>\r\nOd 1513 do 1516 roku Mikołaj Kopernik brał czynny udział w pracach nad reformą kalendarza juliańskiego. Potrzeba poprawy kalendarza spowodowała, że Kopernik dokładnie wyznaczył długość roku zwrotnikowego na 365 dni, a jego badania przyczyniły się do powstania kalendarza gregoriańskiego niedługo po tym.\r\n\r\n<b>7. Środek planety</b>\r\nKopernik dowiódł, że nie istnieje jeden środek wszystkich sfer i kół niebieskich. Środek planety nie jest zaś środkiem wszechświata, a jedynie wyznacza środek ciężkości i środek sfery księżyca.\r\n\r\n<b>8. Żaden punkt Wszechświata nie jest wyróżniony.</b>\r\nPodstawą współczesnej astronomii jest również przekonanie Kopernika o tym, że ta część Wszechświata, którą możemy obserwować z Ziemi, niczym nie różni się od części, które nie są dostępne dla naszych oczu i teleskopów. Zgodnie z tą zasadą kopernikańską żaden punkt Wszechświata nie jest wyróżniony.\r\n\r\n<b>9. Ziemia wykonuje pełny obrót wokół własnej osi</b>\r\nMikołaj Kopernik opisał zjawisko, które dziś wydaje się absolutną oczywistością, ale w jego czasach brzmiało to jak herezje. Wyjaśnił bowiem, że każdego dnia Ziemia wykonuje pełny obrót wokół własnej osi, a jeśli na firmamencie widzimy jakiś ruch, to nie dlatego, że on nastąpił, ale dlatego, że Ziemia ciągle jest w ruchu.\r\n\r\n<b>10. Źródło Pandemii w Olsztynie</b>\r\nKopernik zajmował się dotkliwym problemem pandemii w Olsztynie i odkrył, że przyczyną choroby zakaźnej było spożywanie chleba, który był magazynowany w fatalnych warunkach. Dzięki jego spostrzeżeniom powstrzymano rozwój zarazy i zaniechano jedzenia brudnego i nieświeżego jedzenia.\r\n\r\nŹródło: https://webprojektor.pl/wynalazki-odkrycia-mikolaja-kopernika/\r\n', 'https://webprojektor.pl/wp-content/uploads/2020/04/kopernik-700x438.jpg', 1, 1, 22, '2020-10-28 23:29:05'),
(74, 'Prawo Kopernika-Greshama', 'Prawo Kopernika-Greshama – zasada mówiąca, że jeśli jednocześnie istnieją dwa rodzaje pieniądza, pod względem prawnym równowartościowe, ale jeden z nich jest postrzegany jako lepszy (np. o wyższej zawartości kruszcu), ten „lepszy” pieniądz będzie gromadzony (tezauryzowany), a w obiegu pozostanie głównie ten „gorszy”. Krótko mówiąc, gorszy pieniądz wypiera lepszy.\r\n\r\nW przypadku rozliczeń z zagranicą, kontrahenci zagraniczni brali pod uwagę jedynie wartość rynkową danego pieniądza (nie zaś cenę urzędową) i życzyli sobie zapłaty w pieniądzu o wyższej wartości. W rezultacie lepszy pieniądz odpływał za granicę.\r\n\r\nOdkrycie tego prawa przypisuje się Mikołajowi Kopernikowi (traktat Monetae cudendae ratio, pol. Rozprawa o urządzeniu monety… z 1526) oraz Thomasowi Greshamowi i kilku innym ekonomistom. Już wcześniej prawidłowości te opisali grecki dramatopisarz z V wieku p.n.e. Arystofanes w komedii Żaby i XIV-wieczny filozof Mikołaj z Oresme w pracy Tractatus de origine, natura, iure et mutationibus monetarum.\r\n\r\nDolaryzacja, np. w krajach Europy Wschodniej w latach 80. czy Ameryce Południowej w latach 90., może być postrzegana jako odwrotność prawa Kopernika-Greshama.\r\n\r\nŹródło: https://pl.wikipedia.org/wiki/Prawo_Kopernika-Greshama', 'https://www.numizmatyczny.pl/photo/3166-3.jpg?sess_id=c12e9fa4d105f18f573738e6ab6e57e5', 1, 11, 4, '2020-10-30 08:02:02'),
(75, 'Kopernik - Historyk gospodarki', 'Czasami Kopernikowi przypisuje się też sformułowanie ilościowej teorii pieniądza głoszącej, że nadmierny wzrost ilości pieniądza w obiegu powoduje spadek jego wartości. Rzeczywiście, pisał on: [Moneta – JŁ] <i>traci wartość najczęściej z powodu zbyt wielkiej ilości, mianowicie jeśli taka ilość srebra zostanie w postaci monet wypuszczona, że samo srebro bardziej jest przez ludzi pożądane niż pieniądz.</i> \r\nTrochę później zaś dodał, że w Prusach na przyszłość trzeba się strzec nadmiaru pieniądza.\r\nSprawa nie jest jednak oczywista. Kopernik nie twierdził, że sama ilość pieniądza (dziś mówilibyśmy o podaży) powoduje inflację. Dla niego moneta to przede wszystkim kruszec. Wybicie dużej ilości monetspowodowałoby zmniejszenie podaży srebra i przez to zwiększenie wartości kruszcu w stosunku do wartości monety. Innymi słowy, Kopernik widział związek między ilością monet a cenami, ale rozumiał go inaczej niż ilościowa teoria pieniądza. Choć Kopernik zdawał sobie sprawę, że potrzebna\r\njest <i>odpowiednia mnogość</i> monet uzasadniająca dodawanie miedzi do srebra w monetach (bo pozwala to na wybicie ich większej ilości przy ograniczonych zasobach), pieniądz nie stanowił jeszcze dla niego towaru, na który zgłaszano popyt. \r\nMożna więc mówić o postawieniu przez Kopernika fundamentów pod jedno z kluczowych praw dotyczących\r\npieniądza, choć do dokończenia gmachu potrzebni byli późniejsi ekonomiści. \r\nJakie więc jest znaczenie Kopernika w historii myśli ekonomicznej? <i>Zasady bicia monety</i>, choć powstałe w ramach bieżącej polityki, to niemal pełna teoria pieniądza. Kopernik wytłumaczył jego pochodzenie, funkcje, konsekwencje zmian oraz sugerował, jaką politykę monetarną należy prowadzić. Poza sformułowaniem prawa Greshama oraz wieloma innymi intuicjami największe wrażenie robi wykorzystanie przez Kopernika nowoczesnych metod badawczych.\r\nCzytał stare dokumenty, zbierał materiał historyczny (co oprócz ekonomisty czyni z niego historyka gospodarki), śledził, jak zmieniał się pieniądz, i na podstawie badań formułował oryginalne myśli i ogólne zasady. Choć <i>Zasady bicia monety</i> powstały w ramach bieżącej polityki (i wykorzystywano je w dyskusji o pruskiej reformie monetarnej), stanowiły one pełną teorię pieniądza.\r\n\r\nAutor: JERZY ŁAZOR, adiunkt w Szkole Głównej Handlowej w Warszawie', 'https://galeria.bankier.pl/p/c/3/1df9acd5374996-645-298-0-0-1500-694.jpg', 0, 1, 8, '2020-10-30 08:30:16'),
(76, 'Brak wykształcenia', 'Niezależnie od tego, jak dobrze Kopernik opanował naukę o budowie wszechświata i jego ruchach, nie zakończyłstudiów żadnym formalnym\r\negzaminem. W 1495 roku opuścił Kraków, a rok później znalazł się w Italii.\r\n\r\nPrzygotowując się do przyszłej kariery u boku wuja Łukasza Watzenrodego, biskupa warmińskiego, w latach 1496–1500 Kopernik studiował w Bolonii prawo kanoniczne. Nie porzucił jednak zainteresowań astronomicznych. Wiemy, że wkrótce po przybyciu do tego miasta zaprzyjaźnił się z profesorem astronomii Domenico Marią Novarą, u którego zresztą wynajmował pokoje. Z Bolonii też pochodzi pierwsza zanotowana obserwacja astronomiczna Kopernika: zakrycie Aldebarana, najjaśniejszej gwiazdy gwiazdozbioru Byka, przez Księżyc 9 marca 1497 roku. Tymczasem na Warmii wuj dbał o właściwy rozwój kościelnej kariery siostrzeńca. W 1497 roku Mikołaj objął (zaocznie) kanonię we Fromborku. Stał się jednym z 16 kanoników warmińskich – ta funkcja zabezpieczała go materialnie na resztę życia.\r\n\r\nLatem 1500 roku Kopernik zakończył studia prawnicze, ale i tym razem nie złożył końcowych egzaminów. Udał się do Rzymu, gdzie znów prowadził obserwacje astronomiczne i być może podjął praktykę prawniczą przy kurii rzymskiej. W 1501 roku przybył do Polski i pojawiłsię we Fromborku. Jednak nie na długo. Od kapituły warmińskiej otrzymał zgodę na powrót do Włoch; wyjechał do Padwy, gdzie w latach 1501–1503 studiował medycynę. Także tu nie zrobił dyplomu, ale 31 maja 1503 roku, przed ostatecznym opuszczeniem Italii, otrzymał doktorat z prawa kanonicznego w Ferrarze. Jesienią 1503 roku powrócił do Lidzbarka Warmińskiego na dwór bp. Watzenrodego. \r\n\r\nAutor: Jarosław Włodarczyk', 'https://upload.wikimedia.org/wikipedia/commons/2/2e/Toru%C5%84%2C_Rynek_Staromiejski_(pomnik_Kopernika)_(6)_(OLA_Z.).JPG', 1, 1, 4, '2020-10-30 08:36:36'),
(77, 'Obserwator Nieba', 'Najsłynniejszy obraz Kopernika namalowany przez Jana Matejkęprzedstawia astronoma na szerokim krużganku wokół wieży obronnej w północno zachodnim rogu murów chroniących katedrę we Fromborku. Dziś ten obiekt jest nazywany Wieżą Kopernika, bo rzeczywiście należała ona do uczonego. Było tam jednak nie obserwatorium, lecz tymczasowe mieszkanie na wypadek, gdyby zaszła potrzeba schronienia się w warowni w czasie wojny. Na co dzień Kopernik mieszkał w kanonii zewnętrznej – domu niedaleko zachodniej flanki katedralnych obwarowań, na sąsiednim wzgórzu, niemal dokładnie naprzeciwko wieży\r\n\r\nAstronom nabył kanonię zapewne w 1513 roku; w dokumentach kapituły zachował się następujący zapis: Doktor Mikołaj zakupił 800 sztuk cegieł i jedną beczkę wapna białego z cegielni i wapniarni należącej do katedry warmińskiej i wpłacił należność do kasy budowlanej katedry. Część cegieł i wapna poszła na wybudowanie w ogrodzie kanonii starannie wypoziomowanego tarasu, z którego można było wygodnie prowadzić obserwacje astronomiczne.\r\n\r\nNajbardziej wyrafinowanym z instrumentów Kopernika było astrolabium: zestaw sześciu pierścieni, odpowiadających najważniejszym kołom na sferze niebieskiej, takim jak południk, równik czy ekliptyka. Astrolabium pierścieniowe służyło do pomiaru odległości kątowych między ciałami niebieskimi, co pozwalało uzyskać dane konieczne do obliczenia parametrów teorii, jak również sprawdzić jej zgodność z naturą.\r\n\r\nAutor: Jarosław Włodarczyk', 'https://upload.wikimedia.org/wikipedia/commons/8/88/Jan_Matejko-Astronomer_Copernicus-Conversation_with_God.jpg', 0, 2, 9, '2020-10-30 08:42:48'),
(78, 'Obserwacja, matematyka i reforma kalendarza', 'U podstaw systemu Kopernika nie leżały wyniki obserwacji astronomicznych, choćby najdokładniejsze, lecz rozmyślania nad harmonią kosmosu, wewnętrzną spójnością systemu świata. Zgłębiając astronomię geocentryczną, Kopernik uznał, że opisuje ona budowę świata za pomocą dość przypadkowej zbieraniny hipotez. Miał wielki szacunek dla kunsztu najznakomitszych przedstawicieli dawnej astronomii, ale jednocześnie utrzymywał: przytrafiło im się to samo co komuś, kto by to stąd to zowąd wziął ręce, nogi, głowę i inne części ciała i namalował je, co prawda, bardzo dobrze, ale tak, że w odniesieniu dojednegoi tegosamegociała nieodpowiadałyby sobie nawzajem i powstałby z nich raczej jakiś dziwoląg niż obraz człowieka (przeł. M. Brożek). Kopernik poszukiwał najprostszych rozwiązań, które w logiczny sposób wyjaśniałyby wszystkie obserwowane ruchy planet. Ostatecznie doszedł do wniosku, że warunek ten spełnia system, w którego środku znajduje się Słońce, a planety krążą wokół niego w kolejności, o której decyduje tempo ich biegu: od najszybszego Merkurego przez Wenus, Ziemię, Marsa, Jowisza aż po najwolniejszego Saturna.\n\nA zatem najważniejsze odkrycie Kopernika polegało na zrozumieniu, że ład świata został zapisany w formie systemu heliocentrycznego. Reszta sprowadzała się do takiego posłużenia się matematyką i obserwacjami, by ten ład uchwycić jak najprecyzyjniej: określić rozmiary planetarnych orbit i ich położenie w przestrzeni. Rzecz wymagająca doskonałej znajomości geometrii i wielu godzin obserwacji oraz czasochłonnych obliczeń, ale mimo wszystko drugorzędna\n\nCo nie oznacza, że prosta. Kopernik musiał się wspiąć na wyżyny renesansowej matematyki, by dopracować szczegóły maszynerii świata heliocentrycznego. Historycy nauki odkryli całkiem niedawno, że w kilku miejscach astronom posłużył się rozwiązaniami geometrycznymi, które wcześniej wymyśliliśredniowieczni uczeni islamscy, a których nie znali Europejczycy. A przynajmniej – wszystko na to wskazuje – wiedzieli o nich niewiele. Kopernik z całą pewnością nie znał języka arabskiego, więc studiowanie rękopisów arabskich astronomów raczej nie wchodzi w grę. Czy ktoś go wtajemniczył w te rozwiązania? Jeśli tak, to gdzie i kiedy? Listownie, w ramach wymiany pomysłów między uczonymi z różnych zakątków świata? A może Kopernik doszedł do tego samodzielnie?\n\nW tamtych czasach Kościół katolicki próbował przeprowadzić reformę kalendarza (odziedziczonego jeszcze po Juliuszu Cezarze), aby zapobiec rozchodzeniu się świąt kościelnych, zwłaszcza Wielkanocy, z porami roku. Już podczas soboru laterańskiego V (1512–1517) Paweł z Middelburga, biskup Fossombrone, zaprosił Kopernika do prac nad reformą kalendarza juliańskiego. Niestety, nie znamy odpowiedzi astronoma, ale od tamtego czasu echa pracy warmińskiego uczonego musiały docierać do Rzymu. W 1535 roku kardynał Mikołaj Schönberg zachęcał listownie astronoma, by podzielił się ze światem swoim odkryciem: Dowiedziałem się [...], żeś ty na temat całego tego systemu astronomicznego napisał dzieło i obliczone w cyfrach ruchy planet ułożyłeś w tablice, czym budzisz u wszystkich nadzwyczajny podziw (przeł. A. Birkenmajer).\n\nAutor: Jarosław Włodarczyk', 'https://s.inyourpocket.com/gallery/212970.jpg', 0, 2, 8, '2020-10-30 08:51:25'),
(79, 'O Obrotach', 'Niedługo później odmianę w życiu Kopernika przyniosła nieoczekiwana wizyta. W maju 1539 roku do Fromborka przybył z Wittenbergi młody matematyk Jerzy Joachim Retyk. To on sprawił, że dzieło życia polskiego astronoma, traktat O obrotach w sześciu księgach, doczekało się druku. Wcześniej, bo w 1540 roku w Gdańsku i w 1541 roku w Bazylei, ukazała się Relacja pierwsza z ksiąg O obrotach Mikołaja Kopernika – pierwsze wprowadzenie do astronomii heliocentrycznej, które Retyk spisał pod okiem Kopernika w Lubawie i Fromborku.\n\nWciąż bez odpowiedzi pozostaje pytanie, jak długo powstawało dzieło O obrotach i czy przed wizytą Retyka we Fromborku Kopernik zamierzał je oddać do druku. Przede wszystkim nie wiemy, kiedy astronom rozpoczął pisanie traktatu. Kopernik w żaden sposób nie zdradził, kiedy odkrył kosmologię heliocentryczną. Jej pierwszy zarys sformułował w kilkunastostronicowej rękopiśmiennej rozprawce zatytułowanej Zarys podstaw astronomii. Wiemy, że musiał ją napisać przed 1514 rokiem, gdyż w sporządzonym w tym roku katalogu biblioteki krakowskiego uczonego Macieja z Miechowa znajduje się pozycja: Rękopis na sześciu kartach o teorii utrzymującej, że Ziemia się porusza, Słońce zaś pozostaje nieruchome. W Zarysie zaś czytamy: spróbuję krótko przedstawić, jak można w systematyczny sposób zachować jednostajność ruchów. Jednakże postanowiłem dla zwięzłości pominąć w tym zarysie dowody matematyczne, zachowując je dla większego dzieła.\n\nMożna na tej podstawie zakładać, że pisanie „większego dzieła” Kopernik rozpoczął ok. 1515 roku. Taki pogląd, wspierany analizą rękopisu O obrotach, głosili polscy badacze Ludwik i Aleksander Birkenmajerowie. Jednocześnie uznawali oni, że dzieło zostało ukończone w 1541 roku. Niektórzy historycy nauki uważają jednak, że pisanie O obrotach Kopernik musiał rozpocząć po roku 1525. Dodajmy, że ostatnia wykorzystana przez niego obserwacja astronomiczna pochodzi z 12 marca 1529 roku. Tak czy owak, pisanie O obrotach, niezależnie od tego, czy trwało kilka, kilkanaście czy kilkadziesiąt lat, nie odbywało się liniowo. Wcześniejsze partie książki były przerabiane i zastępowane nowymi wersjami. Jeden z takich przypadków wiąże się z fragmentem księgi pierwszej, poświęconym geometrii płaskiej i sferycznej. Kiedy bowiem do Fromborka przywędrował Retyk, przywiózł ze sobą wykład trygonometrii Johannesa Regiomontana, opublikowany w 1533 roku. Kopernik wykorzystał to dzieło do wprowadzenia uzupełnień w swoich fragmentach dotyczących geometrii i całość przepisał na nowo.\n\nAutor: Jarosław Włodarczyk', 'http://bi.gazeta.pl/im/2a/7b/11/z18333226IER,Frombork.jpg', 0, 2, 2, '2020-10-30 08:54:53'),
(80, 'Mikołaj Kopernik jako ekonomista', '<i>Choć nieskończona jest ilość plag, które zazwyczaj powodują upadek królestw, księstw i rzeczypospolitych, to (moim zdaniem) najgorsze są cztery: niezgoda, śmiertelność, jałowość ziemi i podły pieniądz. Trzy pierwsze są tak oczywiste, że wszyscy dobrze wiedzą, iż tak właśnie jest; ale czwartą, która dotyczy pieniądza, uznają tylko nieliczni, i to najmądrzejsi, ponieważ doprowadza do upadku rzeczypospolitych nie od razu i nie za pomocą jednego ciosu, ale stopniowo i jakby skrycie </i> -- Tak zaczyna się najważniejszy tekst ekonomiczny Mikołaja Kopernika Zasady bicia monety (Monetae cudendae ratio). Pisany etapami między 1517 a 1526 rokiem, zawiera nie tylko dobitnie sformułowane prawo o złym pieniądzu wypierającym dobry (prawo Kopernika-Greshama), ale też wykład przyczyn istnienia pieniądza, źródła jego wartości oraz wpływu na gospodarkę. Kopernik wszystko to opisał za pomocą precyzyjnych pojęć,szeroko ilustrując przykładami zmian w systemie monetarnym Prus Królewskich, od 1466 roku podległych Polsce.\r\n\r\nSkąd u fromborskiego astronoma, znanego przecież głównie z teorii heliocentrycznej, zainteresowanie pieniądzem? To sytuacja ojczystej prowincji, zalewanej zepsutymi monetami, skłoniła go do zajęcia się tym tematem: Biada wam jednak Prusy, które za złe rządy rzeczypospolitej płacicie karę w postaci, niestety, swej zguby [w oryginale słowo republicae jest napisana małą literą – aut.]. W pierwszych dekadach XVI o reformę zepsutego pieniądza zabiegały pruskie miasta, w zmianę sytuacji angażował się też przełożony Kopernika biskup warmiński Fabian Luzjański. To prawdopodobnie na jego życzenie Kopernik rozpoczął badania w nowej dziedzinie.\r\n\r\n<bold>DO CZEGO SŁUŻY PIENIĄDZ</bold>\r\nZnajomość spraw monetarnych nie wynikała tylko z naukowego zainteresowania tematem. Kopernik pełniłróżne funkcje ekonomiczne w kapitule warmińskiej, m.in. administrował dobrami kapitulnymi w latach 1516–1521. Widział, jaki wpływ na gospodarkę biskupstwa miał „psuty” pieniądz. Tematy pieniężne były też bliskie warstwie zamożnych kupców, z której się wywodził. Członkowie jego rodziny sami angażowali się w próby reform, Kopernik musiał więc od młodości stykać się z tymi sprawami.\r\n\r\nZanim zajmiemy się prawidłowościami opisanymi przez Kopernika, zobaczmy, jakich używał pojęć. W tych czasach w Europie funkcjonował Jerzy Łazor POLSKIE OSIĄGNIĘCIA NAUKOWO-TECHNICZNE Monety z czasów Zygmunta Starego: denar elbląski, denar gdański, grosz pruski i szeląg pruski, fot. Wojciech Kalwat Mikołaj Kopernik jako ekonomista wyłącznie pieniądz kruszcowy, bity ze złota i srebra. Dlatego punktem wyjścia jest dla Kopernika definicja monety, którą rozumie jako złoto lub srebro z wytłoczonym znakiem. Dowodzi, że choć można by używać samego kruszcu, standaryzacja wartości monet ułatwia wymianę – nie trzeba nosić ze sobą wagi ani umieć oceniać jakości stopu. Takie wyjaśnienie, po co istnieją monety, przypomina klasyczną historię powstawania pieniądza, opowiedzianą przez ojca nowoczesnej ekonomii Adama Smitha. Tłumaczył on zastąpienie czystego kruszcu monetami właśnie wygodą\r\n\r\nAstronom z Fromborka postrzegał wartość tak zdefiniowanego pieniądza subtelnie. Zależała ona od ilości zawartego w niej kruszcu, ale jednocześnie była to wartość nominalna, nadana przez władcę. Te dwie wartości (które po łacinie Kopernik określał jako valor i estimatio) powinny być do siebie zbliżone, ale nominalna wyższa od realnej o koszt wybicia monety. To nowoczesne stanowisko. Kopernik odrzucał możliwość czerpania przez władcę dochodów z wypuszczania pieniądza o mniejszej ilości złota, niż wynosi jego wartość nominalna. Innymi słowy – emisja pieniądza nie może stanowić rodzaju podatku nakładanego przez władcę na poddanych. Nowoczesne jest też żądanie ograniczenia liczby podmiotów, które mogą emitować monetę – ideałem dla Kopernika była tylko jedna mennica, dająca gwarancję właściwej ilości i wartości monet. Przypomina to współczesne rozwiązania – z bankiem centralnym jako jedynym uprawnionym do emisji pieniądza. Dziś od takiego banku żąda się niezależności od rządu – dla Kopernika gwarancją była (względnie) niezmienna wartość kruszcu, władca miał jedynie nie zmniejszać jego ilości w monecie. \r\n\r\nTakie stanowisko Kopernik wywodził z podstawowej dla niego funkcji pieniądza, jaką jest bycie miarą wartości: to zaś, co ma być miarą, musi zawsze zachowywać trwałą i ustaloną wielkość. Zła miara, jak fałszywe odważniki w sklepie, prowadzi do wielokrotnego okradania kupujących i sprzedających.\r\n\r\nAutor: Jerzy Łazor', 'https://7.allegroimg.com/s1024/0c446e/7bdc158f4cd79f69f9e5bd0a9b17', 0, 2, 7, '2020-10-30 09:05:02'),
(81, 'Heliocentryzm Kopernika', 'Mikołaj Kopernik w I rozdziale De revolutionibus orbium coelestium (O obrotach sfer niebieskich) dokonał przeglądu wszystkich znanych wówczas teorii na temat ruchów planet, także teorii Arystarcha z Samos (wzmianka o nim nie znalazła się w finalnej wersji pracy) i poparł tę teorię nowymi obliczeniami uzyskanymi dzięki obserwacji i zastosowaniu bardziej rozwiniętej matematyki.\r\n\r\nPrzewrót kopernikański w swojej istocie nie był nowym odkryciem, jak się powszechnie uważa, a jedynie nowym uzasadnieniem twierdzeń znanych od osiemnastu stuleci. Przewrót dokonany przez Mikołaja Kopernika polegał na odwadze myślenia i przeciwstawienia się autorytetom i panującym poglądom. Kopernik zainicjował powstanie nowożytnej nauki, opartej na przekonaniu, że w nauce nie ma niepodważalnych twierdzeń – dogmatów, a każde twierdzenie powinno być weryfikowane.\r\n\r\n<bold>Problemy teorii Kopernika</bold>\r\nZgodnie z koncepcją Kopernika planety poruszają się wokół Słońca po okręgach. Kopernik zaproponował swój model, aby wyeliminować konieczność zakładania, że niektóre planety krążą po dodatkowych pętlach zwanych epicyklami oraz uwzględniania ekwantów. W ówcześnie obowiązującej, geocentrycznej teorii Ptolemeusza, zakładającej nieruchomość Ziemi znajdującej się w centrum Układu Słonecznego, teoria epicykli była niezbędna, aby uzgodnić ją z obserwacjami ruchu planet i Słońca na niebie.\r\n\r\nTeoria Kopernika zakładała ruch planet wokół Słońca po okręgach. Ponieważ orbity planet w rzeczywistości są elipsami (zobacz prawa Keplera), pojawiła się niezgodność teorii z obserwacjami, co zmusiło Kopernika do zaadoptowania teorii epicykli. Największym argumentem przeciw teorii heliocentrycznej była niezmienność położenia gwiazd na sferze niebieskiej. Zakładając, że Ziemia wiruje wokół własnej osi przechodzącej przez oba bieguny, można wyjaśnić obracanie się całej sfery niebieskiej w cyklu 24-godzinnym. Jeżeli przyjąć, że Ziemia porusza się również po orbicie kołowej wokół Słońca, powinniśmy zaobserwować pozorny ruch eliptyczny każdego ciała na sferze niebieskiej w kierunku innym niż płaszczyzna ekliptyki. W szczególności w tej ostatniej płaszczyźnie powinny być widoczne ruchy po odcinku. Okres tych „drgań” ciał niebieskich powinien być równy okresowi obrotu Ziemi wokół Słońca, czyli jednemu rokowi. Od starożytności próbowano zaobserwować zmianę położenia którejkolwiek gwiazdy na niebie, jednak nie udało się to aż do 1839 roku.\r\n\r\nŹródło: https://pl.wikipedia.org/wiki/Heliocentryzm', 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Wright_of_Derby%2C_The_Orrery.jpg', 1, 11, 10, '2020-10-30 09:23:26'),
(82, 'Naukowy heretyk - Mikołaj Kopernik', '<bold>Dlaczego dzieło Mikołaja Kopernika było niebezpieczne dla nauki Kościoła, a jego rozpowszechnianie musiało zostać zakazane?</bold>\n\n\"O obrotach ciał niebieskich\" Mikołaja Kopernika zostało wydane w Norymberdze w roku 1543. Teolog Andrzej Osiander namówił polskiego astronoma, aby nieco złagodził śmiałe tezy heliocentryzmu, które stały w opozycji wobec doktryny Kościoła. Kopernik w przedmowie do swego dzieła przedstawił swoje poglądy jako hipotezy. Mimo to po 73 latach dzieło trafiło na Indeks Ksiąg Zakazanych, czyli spis publikacji, których czytanie i podsiadanie było zabronione pod groźbą ekskomuniki.\n\nSam Mikołaj Kopernik był kanonikiem, duchownym niższej rangi. Początkowo jego dzieło, które nie było rozpowszechnione, nikomu nie przeszkadzało. W 1620 roku Kongregacja wskazała miejsca, które według niej wymagały kilku poprawek. Dopiero głośny proces Galileusza i potępienie przez Kościół wszystkich teorii, które podważały obowiązujący pogląd, że ciała niebieskie krążą wokół Ziemi, spowodowało, że książka Kopernika znalazła się na Indeksie.\n\nO losach publikacji Mikołaja Kopernika rozmawialiśmy w dwójkowym \"Klubie Ludzi Ciekawych Wszystkiego\". Gośćmi Hanny Marii Gizy byli: prof. Andrzej Kus - szef Centrum Astronomii Uniwersytetu Mikołaja Kopernika oraz prof. Janusz Małek z Instytutu Historii i Archiwistyki, również z Uniwersytetu Mikołaja Kopernika.\n\nHanna Maria Giza zwróciła uwagę, że zła sława Kościoła jako tego, który chciał utrzymać ludzkość w nieświadomości i zakazać wszelkiej nauki, jest bardzo uproszczona. Dużym zmartwieniem dla Kościoła było w owym czasie, w połowie XV wieku, wynalezienie druku. W przedmowie do Indeksu mówi się o nim jako o jednym z najgorszych prześladowców wiary - druk jest \"zdradliwą i szkodliwą maszyną\".\n\nKościół przede wszystkim jednak w ten sposób bronił się przed zalewem protestantyzmu. Książki drukowane rozpowszechniały się znacznie szybciej, tym samym niebezpieczne idee trudniej było zatrzymać. Janusz Małek dodał, że w rozważaniach o zamierzchłych czasach należy wystrzegać się oceniania zdarzeń z naszego współczesnego punktu widzenia. Andrzej Kus natomiast powiedział, że cenzura jako taka istnieje, odkąd ludzie pisali – zawsze znalazł się ktoś, komu pewne poglądy nie odpowiadały, i wykorzystywał władzę do ukrywania niewygodnych faktów.\n\nAutor: Hanna Maria Giza', 'https://cdn.vox-cdn.com/thumbor/fTvtFUML7tOKFohIwXORQ6OEMHQ=/0x0:6303x4202/1200x800/filters:focal(2648x1597:3656x2605)/cdn.vox-cdn.com/uploads/chorus_image/image/58741807/917651314.jpg.0.jpg', 0, 2, 1, '2020-10-30 09:48:50'),
(83, 'Upowszechnianie teorii heliocentrycznej', 'Czy jednak Kopernik zdecydowałby się na druk <i>O obrotach</i>, gdyby nie odwiedził go Retyk? Przecież przez większą część życia wzbraniał się przed wydaniem tego dzieła, obawiając się wyszydzenia przez tych, którzy, według jego własnych słów, <i>tępy mają umysł i plączą się między prawdziwymi uczonymi jak trutnie między pszczołami</i>. A jednak posłał je do druku. Przy tym wybór oficyny Petreiusa był jak najbardziej uzasadniony. Ów dom wydawniczy był znany z edycji dzieł naukowych i umiał je rozprowadzać po całej Europie. \r\n\r\nSkład <i>O obrotach</i> rozpoczął się zapewne w maju 1542 roku. O tym, kiedy druk się zakończył, możemy wnioskować na podstawie daty, którą Retyk zapisał na książce przesłanej dziekanowi Uniwersytetu w Wittenberdze: 20 kwietnia 1543 roku. Egzemplarz ten zawiera też ślady ingerencji norymberskiego wydawcy, sprzecznych z zamierzeniami Retyka, a zapewne także Kopernika. Tytuł pierwszego wydania <i>O obrotach</i> brzmi: <i>De revolutionibus orbium coelestium (O obrotach sfer niebieskich);</i> Retyk przekreślił na czerwono <i>orbium coelestium</i>, czyli „sfer niebieskich”, wykreślił też anonimową przedmowę, dodaną bez wiedzy autora i jego ucznia przez teologa Andreasa Osiandra. Zamiast niej był przewidziany poemat greką,skomponowany przez kolegę Retyka, filologa klasycznego Joachima Camerariusa. I poemat ten, mający formę platońskiego dialogu, Camerarius wpisał na stronie przedtytułowej dziekańskiego egzemplarza.\r\n\r\nDziś znamy niemal 280 zachowanych egzemplarzy norymberskiego wydania <i>O obrotach</i> oraz ponad 320 egzemplarzy wydania drugiego, które ukazało się w 1566 roku w Bazylei. I choć nie mamy pewności, jaki był nakład każdego z wydań, uważa się, że pierwsze zostało wydrukowane w 500, zaś drugie w 500–600 egzemplarzach. Dużo to czy mało? Dwa inne niezwykle ważne dla nauki nowożytnej tytuły – Sidereus nuncius (1610) Galileusza i Principia Newtona (1687) – ukazały się w nakładach odpowiednio 400 i 300– 400 egzemplarzy\r\n\r\nNa podstawie zapisków w niektórych zachowanych egzemplarzach <i>O obrotach</i> możemy się przekonać, że traktat ten był dość drogą książką, kosztował 1–2 floreny. Dla porównania: gdy Retyk został profesorem na Uniwersytecie w Lipsku, otrzymywał pensję w wysokości 140 florenów rocznie\r\n\r\nPierwsze wydanie <i>O obrotach</i> jest dziś niezwykle cennym woluminem. Bywa kradzione z bibliotek, pojawia się nieoczekiwanie na aukcjach. Czasami właściciele dzieła Kopernika wyzbywali się cennych egzemplarzy, nie znając ich wartości. Tak było w przypadku wspomnianej kopii przesłanej przez Retyka w kwietniu 1543 roku do Wittenbergi (znane są zaledwie dwa egzemplarze <i>De revolutionibus</i> z odręcznym wpisem poematu Camerariusa). Książka ta pokazała się w latach pięćdziesiątych XX wieku w Londynie, sprzedana za 400 funtów. Jednak już w 1974 roku ten egzemplarz uzyskał na aukcji Sotheby’s cenę 44 tys. funtów, bĳąc ówczesny rekord w kategorii starodruków naukowych. Kolejny rekord został ustanowiony 9 listopada 1989 roku – 473 tys. dolarów. Dziś kompletne egzemplarze pierwszego wydania mogą osiągać ceny od 1 do 2 mln dolarów.\r\n\r\nAutor: Jarosław Włodarczyk', 'https://bgpw.files.wordpress.com/2018/01/o_obrotach_cial_niebieskich2.jpg', 0, 2, 4, '2020-10-30 10:53:25'),
(84, 'Kopernik jako tlumacz', 'Odtąd życie astronoma, z niedługimi przerwami, płynęło na Warmii. Służył kolejnym biskupom (wuj Łukasz zmarł w 1512 roku) i kanonikom swoją medyczną wiedzą, administrował dobrami kapituły (osadzał np. nowych dzierżawców na zniszczonych wojną z zakonem krzyżackim gospodarstwach). Na przełomie lat 1520 i 1521, podczas ostatniej wojny z Krzyżakami, Kopernik uczestniczył w organizacji obrony Olsztyna. W latach 1517–1522 przygotował kolejne wersje traktatu o biciu monety.\n\nPrzez cały ten czas nie zaniechał twórczej pracy, nie tylko zresztą naukowej. W 1508 roku ukończył tłumaczenie <i>Listów obyczajowych, sielskich i miłosnych</i> Teofilakta Symokatty, pisarza z Bizancjum, żyjącego na przełomie VI i VII wieku. Kopernik chciał przybliżyć łacińskiej Europie to dydaktyczne dziełko, mające na celu pokazanie na kilkudziesięciu przykładach, co jest dobre, a co złe w postępkach ludzi. W jednym z listów Erotylos zwracał się do Hypsypili: <i>Nawet palmy wzbierają miłością i żeńska do męskiej dąży miłością wygięta kochankę swoją włosami oplata</i> (tłum. Jan Parandowski). <i>Listy</i> w przekładzie Kopernika zostały wydrukowane w 1509 roku w Krakowie, był to książkowy debiut astronoma.\n\nWstęp do Listów napisał przyjaciel Kopernika Wawrzyniec Korwin. Znajdziemy tam taką opinię o kanoniku z Fromborka: <i>On rozważa szybki ruch Księżyca i zmienne ruchy jego brata</i> [Słońca − JW], <i>jak również drogi gwiazd, wspaniałe dzieło wszechmocnego, i wie, jak objaśnić ukryte przyczyny zjawisk na podstawie nadzwyczajnych zasad</i>. Korwin napisał to w 1508 roku, zatem możliwe, że w tym czasie Kopernik miał już naszkicowane ogólne podstawy astronomii heliocentrycznej – owe „nadzwyczajne zasady”. Jednak zarówno moment odkrycia prawdziwej budowy Układu Słonecznego, jak i rozwój tego pomysłu aż do opracowanych matematycznie modeli ruchów planet są nieznane.\n\nAutor: Jarosław Włodarczyk', 'http://copernicus.torun.pl/en/archives/simocatta/Teofilakt-16.jpg', 0, 2, 5, '2020-10-30 11:11:06'),
(85, 'wefwefwefefe fwef wef w', 'ewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffeewfeffe', 'wefwefwefwef.com', 0, 2, 3, '2020-10-30 12:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Osiągnięcia'),
(2, 'test2'),
(11, 'Teorie'),
(14, 'wefwef'),
(15, 'tgtyyt');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `answer` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_answers`
--

INSERT INTO `quiz_answers` (`id`, `question_id`, `answer`) VALUES
(92, 18, 'Polakiem'),
(93, 18, 'Prusem'),
(94, 18, 'Rosjaninem'),
(95, 18, 'Bołgarem'),
(99, 20, '5 lat'),
(100, 20, '10 lat'),
(101, 20, '25 lat'),
(102, 20, '40 lat'),
(103, 21, 'Kraków, Polska'),
(104, 21, 'Rzym, Włochy'),
(105, 21, 'Warszawa, Polska'),
(106, 21, 'Toruń, Polska'),
(107, 22, 'Prawo kanoniczne'),
(108, 22, 'Fizyke'),
(109, 22, 'Astronomie'),
(110, 22, 'Matematyke i optyke'),
(111, 23, 'Francuski'),
(112, 23, 'Polski'),
(113, 23, 'Łacine'),
(114, 23, 'Włoski'),
(115, 24, 'Ptolemeusza'),
(116, 24, 'Isaac Newtona'),
(117, 24, 'James Kirka'),
(118, 24, 'Keplera'),
(119, 25, 'Geocentryzm'),
(120, 25, 'Heliocentryzm'),
(121, 25, 'Grawitacja'),
(122, 25, 'Przyrost'),
(123, 26, 'Geocentryzm'),
(124, 26, 'Heliocentryzm'),
(125, 26, 'Grawitacja'),
(126, 26, 'Przyrost'),
(127, 27, '10 zł'),
(128, 27, '5 zł'),
(129, 27, '25 zł'),
(130, 27, '1 grosz'),
(135, 29, 'Filologią'),
(136, 29, 'Astrologią'),
(137, 29, 'Ekonomią'),
(138, 29, 'Prawem'),
(139, 30, 'Bezwładności'),
(140, 30, 'Swobodnego spadania'),
(141, 30, 'Rozpadu naturalnego'),
(142, 30, 'Powszechnego ciążenia');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_correct_answers`
--

CREATE TABLE `quiz_correct_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `correct_answer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_correct_answers`
--

INSERT INTO `quiz_correct_answers` (`id`, `question_id`, `correct_answer_id`) VALUES
(32, 18, 92),
(34, 20, 102),
(35, 21, 106),
(36, 22, 110),
(37, 23, 113),
(38, 24, 115),
(39, 25, 120),
(40, 26, 124),
(41, 27, 127),
(43, 29, 137),
(44, 30, 142);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `question`) VALUES
(18, 'Jakiej narodowości był Mikołaj Kopernik?'),
(19, 'Jaką inną nauką zajmował się Kopernik poza astronomią?'),
(20, 'Ile lat pracował Kopernik nad swoją pracą O rotacji sfer niebieskich?'),
(21, 'Gdzie urodził się Kopernik?'),
(22, 'Co studiował Kopernik na Uniwersytecie Krakowskim?'),
(23, 'Na jaki język tłumaczył poezję grecką Kopernik będąc biskupem?'),
(24, 'Whose astronomical system did Copernicus prove wrong?'),
(25, 'Jaka była teoria astronomiczna, którą rozwinął Kopernik?'),
(26, 'Jaka była teoria astronomiczna, którą rozwinął Kopernik?'),
(27, 'Na jakiej polskiej monecie widnieje Kopernik?'),
(28, 'Jaką inną nauką zajmował się Kopernik poza astronomią?'),
(29, 'Jaką inną nauką zajmował się Kopernik poza astronomią?'),
(30, 'O którym z praw fizycznych Kopernik jako jeden z pierwszych wypowiedział się?');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` char(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `token`, `timestamp`) VALUES
(2, 1, 'gennned key', '2020-10-08 19:36:17'),
(3, 1, 'gennned key', '2020-10-08 19:37:29'),
(4, 1, 'c795d04bc270bac6721bb44b6b8bfbbeb7d165c070f934f0189a3d10cb682842', '2020-10-08 20:28:17'),
(5, 1, 'b2cf8ff427c3e26c0d2215e7a55b6e04b0bbfea19cde773dc642d862aefd108f', '2020-10-09 16:59:55'),
(6, 1, 'dadb01e5d915f732f67e1e707f37b77b7ee76fc41434014b2ba11986283b8eca', '2020-10-09 19:21:37'),
(7, 1, '6d609fc6395b89b967453893a24b9697cf8d1170ec38b78e65416f2260204257', '2020-10-09 19:31:09'),
(8, 1, '7b32de3658aa659d5915e4549b8a1326c374b1447ef185e7d6cef808f8e75506', '2020-10-09 19:31:11'),
(9, 1, '3f2c861e2fbe2360c1e4da4b418b278793f61f33e73b898419e3968e749923d7', '2020-10-09 19:31:11'),
(10, 1, 'd06088c05a294adb23a41fdbe61848e2782ce8304c18f97ace3c1511b41c63e5', '2020-10-09 19:31:11'),
(11, 1, 'ec9aa2a956cb3c8bea8a83be9633d7358fda5511ff2292596c7def87d9863f22', '2020-10-09 21:15:00'),
(12, 1, '64b3069dda6a17f21934e3d51800cabc925b45cea77203812f25276662dbb530', '2020-10-09 21:15:02'),
(13, 1, 'ece00fce43e19208068cba3ab1e891a5d2dfc0a1d8a8c532fc7f0b027a0e29f7', '2020-10-09 21:15:04'),
(14, 1, '2ef888921e78af0c2ceec98b41cae2ec9a6a3b2126498650c62a59762049fd8e', '2020-10-09 21:15:04'),
(15, 1, '2850c32652ac18218c50ef73f44c7eb090e15c5fb35bccd938256b84101377da', '2020-10-09 21:15:04'),
(16, 1, '2269bc9f93c33a6aad74d3811c6b937fe63f12b09da5517ba83118001e907b55', '2020-10-09 22:07:20'),
(17, 1, '955a55a9bace67bb02cb0bf428f65e214ad44ba1790cb6cb22920bcbd54be84d', '2020-10-09 22:07:21'),
(18, 1, '0b90ba2bcdd1815441a1f2397feac576f7f31c5d40fb98b64df9fd6757a40c60', '2020-10-10 09:43:23'),
(19, 1, '638557852676c6a72f1d341a8731105cea3bd1fcf4d0bb6fb66383e1d6ab291a', '2020-10-10 09:43:24'),
(20, 1, 'd8ac9937c1bb5789b7da8ac462f688be44bada5383cb81ff748d203850f64345', '2020-10-11 09:32:47'),
(21, 1, 'eb47c5134ecef2ce5628e41acc6ff5807c20fd3e3f8eae4355a00e11ff49bb4a', '2020-10-11 11:16:23'),
(22, 1, 'c81de899d4dbe8eb809ab2133a29a5557fbab54007d1fb603b63d940cd469fcb', '2020-10-11 11:23:52'),
(23, 1, '9c', '2020-10-11 11:25:26'),
(24, 1, 'f65608508dbc58ae0b7c5fa1b0fb06a7e798d30c0d2265870c54fb3bb847479a', '2020-10-11 11:29:11'),
(25, 1, '77a45ed0b47250d1e597e1d1ed7b08e67f62857eb5f8db236b17df6ae556601b', '2020-10-12 17:29:41'),
(26, 1, 'ec4b1af6da5416c9af03919d94585f501f0a6bd680851c710ac0138229ab9b66', '2020-10-12 17:29:42'),
(27, 1, '92afab52ea83d1afd5b645b767d1cce6bb301c068d3a49ed0c2d97a0c02d94ea', '2020-10-18 16:06:59'),
(28, 1, 'fc39b80c53415e11a77f678282057a8ce62dae5cc76a4bc702892c7d9d886683', '2020-10-18 16:07:01'),
(29, 1, 'd47bd06369d0e22dd396536c2eb3c61e865e8366aa43ce5cba32eda3b58b13c1', '2020-10-18 16:07:02'),
(30, 1, 'aab96ad795d5bd79779529fcac663c4863c8ef33e34c3c6affbbed7fa6ee5004', '2020-10-18 16:07:02'),
(31, 1, 'b68828888cdf03ce5096708c0c51e0bde58cdc29fbcc2263c5f4257c85a247dd', '2020-10-18 16:07:02'),
(32, 1, '1453a079a1f95aec153f5a4318f690d872c1f66e0a149ca966af23a219b18704', '2020-10-18 16:07:02'),
(33, 1, '7e6785c3cae04c27f65a8ea93b1f5f8bd80efeb23b9a588b032364ce7efc40d9', '2020-10-18 16:07:03'),
(34, 1, '0315a8cfcb2af61795859079db7c3427f674f6472e896f6d416a5814ce8e3ee6', '2020-10-18 16:07:03'),
(35, 1, '8e62b9eb27938d31266b296419a4d056643792f944421e6a3d22d976973dceb0', '2020-10-18 16:07:03'),
(36, 1, '0d1570f664788758c9560dd75958d0f26e91c296b1f29414c9049085e4157e82', '2020-10-18 16:08:25'),
(37, 1, 'ec9b3c1c2cbb792e927022548daea702260f7249860fa2e36b1b837027f15141', '2020-10-18 16:08:26'),
(38, 1, '6b2f735a4143e1f893c9e435c680d0dd19efdf1179f8f5351334d1cd4ab70605', '2020-10-18 16:08:26'),
(39, 1, 'bc5d24abdf86a00e78f49408c56e4009da2cd76a937b1b56ed62b9a3a0ec1999', '2020-10-18 16:08:26'),
(40, 1, 'a012d0a6c3b87a344db01549f1e7be93190c2948d7c461d545861116eaa1aded', '2020-10-18 16:08:27'),
(41, 1, '9b8577cb336ce706fa46cd96d0b74698cfce2e4aed645912499ff4c77d13d61d', '2020-10-18 16:11:54'),
(42, 1, '743a7f1c62cbce739481d211826b2bc0fcc2c88835806ca970136710c9aa0788', '2020-10-18 16:12:06'),
(43, 1, '39a929ced019a9fe74ca49af9884dd3b3df5202a1036a136d796cf97cf8fd7b6', '2020-10-18 18:15:03'),
(44, 1, '2cc2fed758fdedb55880959cc059df7ff80d3b83e55bbe76e3978ea83cc19bd4', '2020-10-18 18:18:22'),
(45, 1, 'd1b31a6cae507083bf0223631953b4f33f0661a66b3af74ff94ec67b2f5839a7', '2020-10-18 18:18:28'),
(46, 1, '71fec8de945b9d1b08a092ad684f954b8401df3d928e4b84ab9375a799fbb12b', '2020-10-18 18:22:57'),
(47, 1, 'aad1de59bbbfd90d434ff43b406bca999285e949071da923b7ed32dd99106618', '2020-10-19 08:21:23'),
(48, 1, 'f7fa711f5bdc8f164b30a4cc234353581662cde80480cee54797196810d6bb4a', '2020-10-19 08:21:55'),
(49, 1, '46b75767cac36514b6e2527bf09528d5807cc6ffbbf6d850d760b814a586cadb', '2020-10-19 11:30:04'),
(50, 1, '09ec5fbf8ceb3be9236f7ea1e71888f46e8dfa7b073226336ccc3e043edf3429', '2020-10-19 12:50:43'),
(51, 1, 'efdd10d75d1402b74e5446878c0d52d0374f0561319fb74c812322b65f27bd2d', '2020-10-21 12:21:40'),
(52, 1, '5a0428f02ae30b10da38526ebebcc855054ab2a31f86c9b7e4e5fc851c58aedf', '2020-10-21 12:21:41'),
(53, 1, 'a0b859a5126f22a1696a560e647292546cc1de781b5cfa8a41249a773ded9e1c', '2020-10-24 22:48:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `important` (`important`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correct_answer_id` (`correct_answer_id`),
  ADD UNIQUE KEY `question_id` (`question_id`),
  ADD UNIQUE KEY `question_id_2` (`question_id`,`correct_answer_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  ADD CONSTRAINT `quiz_correct_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_correct_answers_ibfk_2` FOREIGN KEY (`correct_answer_id`) REFERENCES `quiz_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
