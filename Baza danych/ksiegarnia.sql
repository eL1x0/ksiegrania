-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 25 Sty 2018, 22:14
-- Wersja serwera: 10.1.19-MariaDB
-- Wersja PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ksiegarnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admin`
--

CREATE TABLE `admin` (
  `nick` char(20) COLLATE utf8_bin NOT NULL,
  `haslo` char(40) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `admin`
--

INSERT INTO `admin` (`nick`, `haslo`) VALUES
('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dklienta`
--

CREATE TABLE `dklienta` (
  `id` int(11) NOT NULL,
  `imie` text CHARACTER SET utf8 COLLATE utf8_bin,
  `nazwisko` text CHARACTER SET utf8 COLLATE utf8_bin,
  `ulica` text CHARACTER SET utf8 COLLATE utf8_bin,
  `nr_domu` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `miasto` text CHARACTER SET utf8 COLLATE utf8_bin,
  `wojewodztwo` text CHARACTER SET utf8 COLLATE utf8_bin,
  `kodpocztowy` text CHARACTER SET utf8 COLLATE utf8_bin,
  `f_user` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `dklienta`
--

INSERT INTO `dklienta` (`id`, `imie`, `nazwisko`, `ulica`, `nr_domu`, `miasto`, `wojewodztwo`, `kodpocztowy`, `f_user`) VALUES
(4, 'Jan', 'Nowak', 'Kolejowa', '88', 'Nowy', 'Malopolskie', '33-300', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwa` char(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `kategorie`
--

INSERT INTO `kategorie` (`id`, `nazwa`) VALUES
(1, 'Aplikacje biurowe'),
(8, 'CAD'),
(10, 'Fotografia'),
(11, 'Grafika komputerowa'),
(12, 'Podstawy komputera'),
(13, 'Sieci komputerowe'),
(14, 'Bazy danych');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `ISBN` bigint(255) UNSIGNED NOT NULL,
  `title` char(255) COLLATE utf8_bin NOT NULL,
  `author` char(100) COLLATE utf8_bin NOT NULL,
  `publishing` char(40) COLLATE utf8_bin NOT NULL,
  `page` int(10) NOT NULL,
  `print` char(40) COLLATE utf8_bin NOT NULL,
  `category_id` int(255) NOT NULL,
  `price` float NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `img_name` char(255) COLLATE utf8_bin NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`ISBN`, `title`, `author`, `publishing`, `page`, `print`, `category_id`, `price`, `description`, `img_name`, `data`) VALUES
(534324234, 'ABC PowerPoint. Wszystko co musisz o nim wiedzieć.', 'Aleksandra Tomaszewska', 'PSS', 112, 'miękka', 10, 32, 'Wykonanie dobrej prezentacji w PowerPoincie to nic trudnego. Tysiące ludzi codziennie używają tego programu do prowadzenia szkoleń, przedstawiania efektów swojej pracy lub przybliżania innym skomplikowanych zagadnień, a nawet zapisywania osobistych wspomnień. PowerPoint zapewnia swoim użytkownikom przyjazne środowisko, szablony, motywy, wizualne i dźwiękowe efekty specjalne, opcję animowania różnych elementów i wiele innych atrakcji. W nowej odsłonie — 2016 — oferuje także możliwość jednoczesnej pracy kilku osób nad prezentacją w chmurze i korzystanie z genialnej wyszukiwarki Tell Me, która podpowiada, jak wykonać daną operację, i uczy się zachowań użytkownika.\r\n\r\nJeśli chcesz zaprzyjaźnić się z PowerPointem i poznać najważniejsze oraz najbardziej efektowne sposoby tworzenia prezentacji, ta książka będzie dobrym wyborem. Dzięki niej nauczysz się nadawać właściwą strukturę Twojej prezentacji, dodawać do niej tekst i elementy multimedialne, ustalać i zmieniać kolejność slajdów, używać motywów wbudowanych i tworzyć własne. Odkryjesz, jak wyświetlać i drukować Twoje dokumenty, a także modyfikować je w zależności od potrzeb. Liczne ilustracje i jasne opisy pomogą Ci szybko znaleźć te informacje, które najbardziej Cię interesują. Czas zacząć pracę z PowerPointem 2016!\r\nŚrodowisko programu PowerPoint\r\nTworzenie prezentacji na podstawie konspektu i szablonu\r\nPraca z tekstem i pola tekstowe\r\nOpracowywanie układu i wyglądu slajdu\r\nUstalanie kolejności wyświetlania slajdów\r\nKorzystanie z wbudowanych motywów\r\nDodawanie i formatowanie tabel, wykresów i diagramów\r\nWstawianie i edytowanie zdjęć, plików wideo i obiektów Clipart\r\nAnimowanie tekstu i obiektów na slajdach\r\nDodawanie interesujących dźwięków\r\nUdostępnianie i drukowanie prezentacji\r\nTworzenie własnych elementów, motywów i szablonów\r\nDopasowywanie prezentacji do potrzeb różnych odbiorców\r\nPrzygotowywanie prezentacji do wyświetlenia', '4240692abcpower.jpg', '2017-10-22 17:34:00'),
(982323145, '3ds max 2010. Animacja 3D od podstaw. Szkoła efektu', 'Joanna Pasek', 'PSS', 872, 'twarda', 19, 76, 'Trójwymiarowy model świata\r\n\r\nCałościowy opis wykonania filmu animowanego techniką 3D\r\nĆwiczenia ilustrowane zrzutami ekranu, pomagające powtórzyć wszystkie wykonywane operacje na własnym komputerze\r\nPłyta DVD ze wszystkimi scenami, mapami i kompletem innych materiałów\r\nJak stworzyć animację 3D?\r\n\r\nZ zachwytem oglądasz oscarową "Katedrę"? Podziwiasz precyzję, z jaką wykonane są animowane reklamy i teledyski? W świecie gier komputerowych czujesz się jak wirtualna ryba w wodzie? Chcesz rozwijać w sobie boską iskrę tworzenia? Nie zwlekaj zatem i włącz program 3ds Max 2010. Niech ogranicza Cię jedynie wyobraźnia!\r\n\r\nPoznaj słynnego 3ds Maksa – Twoje nowe narzędzie kreowania i animowania trójwymiarowego świata. To właśnie w tym programie powstało wiele znanych Ci animacji i filmów, a także realistycznych graficznie gier oraz zachwycających wizualizacji architektonicznych. Aby stworzyć swoją pierwszą animację, koniecznie zapoznaj się z możliwościami programu 3ds Max 2010, opisanymi w tej książce. Kartka po kartce, klatka po klatce wkroczysz w wirtualną rzeczywistość, poznając zasady modelowania, animacji postaci, kluczowania, opracowywania świateł i materiałów, wprowadzania efektów specjalnych oraz renderingu i montażu całego filmu.\r\n\r\nDowiesz się, jak:\r\ntworzyć obiekty, pozycjonować je i zmieniać ich parametry początkowe;\r\nwprowadzać i przekazywać deformacje obiektu za pomocą stosu modyfikatorów;\r\nposługiwać się modelowaniem siatkowym czy łatami (Patch) i tworzyć powierzchnie na podstawie krzywych: splajnów oraz NURBS;\r\nwykorzystywać w animacji kamery, światła i efekty atmosferyczne (np. światło wolumetryczne);\r\nkreować mapowane i animowane materiały, dodawać efekty renderingu (np. efekt żarzenia), naśladować metale, skórę, drewno, szkło i chrom;\r\nużywać renderera Mental Ray i współpracującego z nim systemu oświetlenia dziennego Daylight;\r\nprzygotować postać do animacji przy użyciu szkieletu (Biped), animować metodą morfingu, z pomocą systemów kości (Bones) i odwrotnej kinematyki;\r\nstosować klucze oraz kontrolery animacji;\r\nmodelować wnętrza tradycyjne i prosto z kosmosu;\r\nprzekształcać animację 3D w kreskówkę.', '62454223dsmax.jpg', '2017-10-22 18:14:00'),
(5343242351, 'ABC Word 2016', 'Aleksandra Tomaszewska', 'PSS', 322, 'miękka', 11, 31, 'Microsoft Word należy do tych aplikacji, bez których nie sposób wyobrazić sobie współczesnego świata. Tworzone w nim dokumenty stanowią podstawę działania milionów firm, a niezwykła łatwość obsługi i elastyczność sprawiają, że każdy może nauczyć się jego obsługi. Jeśli jednak chcesz, żeby Twoje dokumenty wyglądały profesjonalnie, a ich odbiorcy traktowali je poważnie, nie możesz skupiać się wyłącznie na treści. Twój dokument musi zyskać odpowiedni wygląd — do tego właśnie służą w Wordzie najrozmaitsze opcje formatowania, nadawania stylów, dodawania obrazów i wykresów czy zaznaczania zmian wprowadzanych przez kolejnych czytelników.\r\n\r\nABC Word 2016 PL to książka, która pomoże Ci odkryć najistotniejsze funkcje najnowszej wersji Worda. Dowiesz się z niej, jak wygodnie korzystać z programu, tworzyć różne typy dokumentów, zmieniać czcionki, odstępy lub interlinie. Zobaczysz, jak korzystać z szablonów, wstawiać tabele, importować ilustracje z innych programów, tworzyć indeksy lub spisy treści i drukować efekty swojej pracy. Nauczysz się dodawać komentarze i porównywać różne wersje jednego dokumentu. Sprawdzisz też, jak wygląda współpraca w chmurze nad jednym dokumentem tekstowym i jak działa wyszukiwarka Tell Me. Postaw na jakość Twoich dokumentów!\r\nOtwieranie i drukowanie dokumentów\r\nWprowadzanie, kopiowanie, wklejanie, edycja i usuwanie tekstu\r\nFormatowanie tekstu, układanie list i kolumn\r\nWstawianie elementów graficznych\r\nUżywanie stylów i szablonów\r\nCała prawda o tabelach\r\nTworzenie i modyfikowanie konspektów, spisów oraz indeksów\r\nZasady korespondencji seryjnej oraz adresowanie i drukowanie kopert\r\nZaawansowane narzędzia edytora i dostosowywanie go do swoich potrzeb\r\nKorzystanie z komentarzy, śledzenie zmian, porównywanie i scalanie dokumentów', '3399963wordabc.jpg', '2017-10-22 17:39:00'),
(7932541232, 'Po prostu OpenOffice.ux.pl 3.x', 'Waldemar Howil', 'PSS', 823, 'miękka', 9, 42, 'Podatki, rachunki, opłaty. Masz już dość płacenia za wszystko? Do listy obowiązkowych wydatków dochodzi jeszcze oprogramowanie biurowe — niezbędne i drogie? Niekoniecznie! Poznaj zupełnie darmową alternatywę dla popularnego pakietu biurowego rodem zza oceanu. Sięgnij po OpenOffice. To naprawdę nic nie kosztuje, a zyskujesz pełny zestaw biurowy, w postaci edytora tekstu, arkusza kalkulacyjnego, silnika bazodanowego oraz programu do tworzenia prezentacji.\r\n\r\nSprawdź sam, jak działa OpenOffice! Po co płacić, skoro możesz mieć programy o podobnej funkcjonalności zupełnie za darmo? OpenOffice jest dostępny dla każdego - naprawdę nie ponosisz żadnych kosztów. Programy składające się na pakiet OpenOffice.ux.pl z całkowitym powodzeniem wykorzystasz zarówno w domu, jak i swojej małej firmie. A z tą książką nauczysz się zarówno formatować tekst, jak i generować wykresy, używać funkcji arkusza kalkulacyjnego oraz tworzyć prezentacje w programie Impress.\r\n\r\nOpenOffice rozdział po rozdziale:\r\n\r\npodstawowe funkcje i narzędzia pakietu OpenOffice;\r\nprofesjonalne dokumenty, formatowanie tekstów, tabel i komórek, animowanie prezentacji;\r\nporuszanie się po arkuszu kalkulacyjnym;\r\nochrona danych w komórkach;\r\nrodzaje funkcji;\r\ntworzenie prezentacji;\r\nnowa baza danych;\r\npraca z grafiką wektorową w programie Draw;\r\nwykorzystywanie edytora równań Math;\r\nzapisywanie, eksportowanie i drukowanie dokumentów;\r\nnadawanie rozszerzeń umożliwiających dostęp do pliku z programów innych pakietów biurowych;\r\narchiwizacja danych.\r\n', '5024017openpoprostu.jpg', '2017-10-22 17:17:00'),
(8127836721, 'MySQL. Vademecum profesjonalisty.', 'Paul DuBois', 'PSS', 521, 'twarda', 21, 78, 'Kompendium wiedzy o MySQL!\r\n\r\nMySQL to jedna z najpopularniejszych baz danych wykorzystywanych we współczesnych aplikacjach internetowych. Swój sukces zawdzięcza prostej konfiguracji, niewielkim wymaganiom oraz wysokiej niezawodności. Jeżeli do tego dołożymy genialny współczynnik możliwości do ceny — baza jest darmowa — oraz doskonałą współpracę z językiem PHP, to otrzymamy rewelacyjny produkt. Warto pamiętać, że MySQL to prawdziwy system bazodanowy, wspierający zaawansowane techniki replikacji danych i mogący przechowywać bez problemu miliardy rekordów.\r\n\r\nTa książka to kompletny poradnik poświęcony wykorzystaniu bazy danych MySQL oraz administrowaniu tą bazą. W trakcie lektury dowiesz się, jak najlepiej składować dane w bazie, jak optymalizować zapytania oraz jak pobierać metadane. Ponadto nauczysz się uzyskiwać dostęp do bazy z użyciem języków C, Perl oraz PHP. Niezwykle istotna jest część trzecia niniejszej publikacji. Poświęcona została w całości zagadnieniom związanym z administrowaniem bazą MySQL. Zrozumiesz dzięki niej, w jaki sposób baza przechowuje dane, jak zoptymalizować jej wydajność oraz co musisz zrobić, by zagwarantować najwyższy poziom bezpieczeństwa. Warto, żebyś zawczasu zapoznał się z rozdziałem poświęconym wykonywaniu i odtwarzaniu kopii zapasowej. Książka jest doskonałym źródłem informacji zarówno dla programistów, jak i administratorów korzystających z tej bazy danych.\r\n\r\nDzięki tej książce:\r\n- poznasz dogłębnie bazę danych MySQL\r\n- zoptymalizujesz jej działanie\r\n- podłączysz się do jej zasobów za pomocą języków C, Perl i PHP\r\n- w pełni wykorzystasz potencjał bazy danych MySQL', '4209930MySQLVademecum.jpg', '2017-10-22 18:19:00'),
(52345234234, 'AutoCAD. Pierwsze kroki', 'Andrzej Pikoń', 'PSS', 224, 'miękka', 13, 89, 'AutoCAD od dłuższego już czasu stanowi standard w dziedzinie projektowania wspomaganego komputerowo, podobnym standardem stały się również doskonałe opracowania Andrzeja Pikonia ułatwiające praktyczną naukę tego oprogramowania. Nie inaczej jest z najnowszym podręcznikiem dla początkujących poświęconym ostatniej polskiej wersji rozwiązania firmy Autodesk, czyli programowi AutoCAD 2014 PL. \r\n\r\n\r\nKsiążka „AutoCAD 2014 PL. Pierwsze kroki” wprowadza czytelnika rozpoczynającego swoją przygodę z narzędziami CAD w świat nowoczesnego oprogramowania inżynierskiego, krok po kroku wyjaśniając zawiłości związane z tworzeniem, edytowaniem i drukowaniem dokumentacji technicznej oraz ułatwiając wyrobienie właściwych nawyków w pracy z aplikacją.\r\n\r\nPoczątkujący użytkownik AutoCAD-a znajdzie w niej wszystko, co niezbędne do gruntownego poznania środowiska. Dzięki jasnym wskazówkom i rysunkom przedstawiającym poszczególne etapy pracy nauczy się tworzyć i modyfikować proste oraz bardziej złożone obiekty, dobierać odpowiednie linie, stosować kreskowania, posługiwać się szykami, korzystać z uchwytów, kontrolować wymiary, dodawać opisy tekstowe, a także używać bloków i warstw. Pozna też możliwości związane z parametryzacją rysunków oraz dowie się jak przeglądać i drukować rysunki.\r\n\r\nJeśli CAD, to AutoCAD. Jeśli podręcznik, to tylko AutoCAD 2014 PL. Pierwsze kroki!\r\n\r\n\r\n•    Najważniejsze informacje o środowisku\r\n•    Podstawowe operacje rysunkowe\r\n•    Poruszanie się w przestrzeni rysunku\r\n•    Tworzenie i modyfikowanie obiektów\r\n•    Stosowanie różnych rodzajów linii i kreskowania\r\n•    Korzystanie z szyku kołowego i prostokątnego\r\n•    Wstawianie tekstów i wymiarowanie obiektów\r\n•    Parametryzacja rysunku, używanie bloków i warstw\r\n•    Przygotowywanie do wydruku i drukowanie rysunku ', '8848632autocad.jpg', '2017-10-22 17:52:00'),
(98423425422, 'Mistrz analizy danych. Od danych do wiedzy', 'John W. Foreman', 'PSS', 211, 'twarda', 7, 67, 'Nauka o danych, znana również pod nazwą data science, jest stosunkowo nową, interdyscyplinarną dziedziną, zajmującą się różnymi technikami analizy danych, ich implementacją i wykorzystywaniem do różnych celów. Zalety nauki o danych doceniają specjaliści z wielu branż: analitycy biznesowi, statystycy, architekci oprogramowania i osoby zajmujące się sztuczną inteligencją. Tak naprawdę ta dziedzina nie koncentruje się na kodowaniu i bazach danych, ale raczej na metodach wyłuskiwania z danych najróżniejszych cennych informacji. Wartość tej wiedzy niejednokrotnie okazuje się ogromna.\r\n\r\nNiniejsza książka jest przystępnym wprowadzeniem do nauki o danych. Jest przeznaczona dla osób, które chcą stosować techniki analizy danych w biznesie. Te techniki, opisane na podstawie praktycznych przypadków, to m.in. optymalizacja, prognozowanie i symulacja, a także sztuczna inteligencja, teoria grafów, analiza skupień i wykrywanie anomalii. Dzięki tej książce nie tylko zrozumiesz zasady analizowania danych, ale także nauczysz się wybierać technikę właściwą do rozwiązania danego problemu. Poznasz też techniki pracy z prototypami. Co ciekawe, niemal wszystkie opisane tu metody zostały zaprezentowane w arkuszu kalkulacyjnym.\r\n\r\nW książce opisano m.in.\r\n\r\noptymalizację za pomocą programowania liniowego i całkowitoliczbowego\r\nszereg czasowy, wykrywanie trendów i wahań sezonowych\r\nprzewidywanie za pomocą wygładzania wykładniczego\r\nmetodę symulacji Monte Carlo\r\ntest Tukeya i lokalne czynniki odstające\r\njęzyk R — zaawansowane techniki analizy danych', '1586669mistrzanalizydanych.jpg', '2017-10-22 17:17:00'),
(563243243256, 'Microsoft Office 2013. Praktyczne programowanie makr i dodatków', 'Dawid Borycki', 'PSS', 741, 'twarda', 8, 66, 'Microsoft Office to niezwykle elastyczny i przy tym bardzo popularny pakiet biurowy. Dużej części jego użytkowników wystarczają podstawowe możliwości pakietu. Jednak istnieje spora grupa osób chcących mieć dostęp do jeszcze bardziej zaawansowanych narzędzi bez konieczności rezygnowania z uniwersalnej wersji Office’a. Dla nich właśnie powstają niewielkie aplikacje-dodatki, które można kupić w sklepach internetowych. Jeśli chcesz dowiedzieć się, jak projektować takie przydatne programy, trafiłeś na idealną książkę.\r\n\r\nW tej publikacji znajdziesz omówienie sposobów tworzenia makr, dodatków i aplikacji dla Microsoft Office 2013 i 365 z wykorzystaniem trzech najpopularniejszych technologii: Visual Studio Tools for Office, Visual Basic for Applications oraz JavaScript Object Model. Każda z nich została opisana na konkretnych przykładach. Pokazano tu sekwencję kroków, które trzeba wykonać, by makropolecenie lub dodatek zaczęły poprawnie działać. Omówiono różne opcje, biblioteki kontrolek, sposoby integracji dodatków z programami Office’a i kwestie publikacji gotowych aplikacji. Rozszerz możliwości swojego pakietu Office!\r\n\r\nProjekt aplikacji-dodatku VSTO\r\nKontrolki Windows Forms w dodatkach VSTO\r\nTworzenie tabel, zarządzanie dokumentami i wbudowane okna dialogowe w VSTO\r\nKorespondencja seryjna i dostęp do danych z wykorzystaniem technologii ADO.NET Entity Framework\r\nIntegracja skoroszytów z zewnętrznymi źródłami danych\r\nRejestracja, edycja i publikacja makr z wykorzystaniem VBA\r\nWykorzystanie VBA do tworzenia wykresów, regresji liniowej oraz korespondencji seryjnej\r\nDostęp do wbudowanych funkcji Excela z poziomu VBA\r\nProgramowanie makr w Wordzie: tabele i wykresy, zarządzanie dokumentami\r\nSzablon projektu aplikacji dla pakietu Office 2013 i 365 w JavaScript Object Model\r\nProgramowanie widoków i dostęp do zawartości dokumentów w JavaScript Object Model\r\nWykorzystanie danych z serwisów internetowych na przykładzie Google Maps w JavaScript Object Model', '1962677office2013.jpg', '2017-10-22 17:19:00'),
(856786567546, 'Komputer PC. Poradnik bez kantów', 'Bartosz Danowski', 'PSS', 117, 'miękka', 18, 53, 'Czy jesteś w stanie wyobrazić sobie współczesną rodzinę radzącą sobie bez komputera? A może należysz do grona tych osób, które ciągle uważają, że komputer jest im niepotrzebny? Może uznajesz jego obsługę za rzecz na tyle skomplikowaną, że nie znajdujesz czasu na poznawanie jej niuansów? Umiejętność korzystania z możliwości peceta i posiadanie własnego komputera to dziś niemal konieczność. Oczywiście, nadal możesz zdobywać informacje z różnych dzienników, stać w bankowych kolejkach, by opłacić kablówkę, a z rodziną mieszkającą za granicą rozmawiać przez telefon stacjonarny za grube pieniądze. Jednak dzięki komputerowi zrobisz to znacznie szybciej, sprawniej, taniej i bez wychodzenia z domu. Nadal sądzisz, że komputer jest Ci niepotrzebny? Pomyśl o uporządkowaniu swojej kolekcji książek, odświeżeniu kontaktu ze starymi znajomymi (którzy już na pewno kupili komputery), wcieleniu się w rolę kierowcy WRC i poczytaniu recenzji najnowszych filmów przed wybraniem się do kina. Tak - na to wszystko pozwoli Ci domowy komputer.\r\n\r\nKsiążka "Komputer PC. Poradnik bez kantów" rozwieje Twoje wątpliwości i obawy dotyczące obsługi tego niezwykłego urządzenia. Czytając ją, przekonasz się, że nie taki komputer straszny, jak go malują. Dowiesz się, jak wybrać optymalny zestaw, jak czytać ulotki reklamowe i na co zwracać uwagę przy zakupie sprzętu. Samodzielnie połączysz elementy zestawu i uruchomisz komputer. Nauczysz się korzystać z systemu operacyjnego Windows Vista, instalować oprogramowanie i przeglądać strony internetowe. Poznasz bezpłatny pakiet biurowy OpenOffice, wyślesz i odbierzesz pocztę elektroniczną, nagrasz płyty CD i przygotujesz swój album. Komputer stanie się Twoim niezastąpionym narzędziem pracy i komunikacji ze światem!\r\n\r\nWybór elementów zestawu komputerowego\r\nMontaż komputera\r\nPierwsze uruchomienie\r\nInstalacja i wstępna konfiguracja systemu Windows Vista\r\nPraca z oknami i menu systemu Windows\r\nInstalacja oprogramowania\r\nEdycja dokumentów i arkuszy kalkulacyjnych w OpenOffice\r\nAktualizacja systemu\r\nOchrona przed wirusami\r\nPrzeglądanie witryn WWW\r\nKorzystanie z poczty elektronicznej\r\nNagrywanie płyt CD i DVD\r\nOdtwarzanie muzyki i filmów', '9104888pcpoczatkujacy.jpg', '2017-10-22 18:11:00'),
(892732737213, 'CCNA 200-120. Zostań administratorem sieci komputerowych Cisco', 'Adam Józefiok', 'PSS', 876, 'twarda', 20, 99, 'Poznaj sieć i ją spleć!\r\n\r\nCo siedzi w sieci, czyli wstęp do sieci komputerowych\r\nJak sterować ruchem bitów, czyli routery, przełączniki i technologie sieciowe\r\nZ czym to się je, czyli ćwiczenia praktyczne z budowania i obsługi sieci\r\nSieci komputerowe dawno już oplotły cały świat. Nawet w cieniu peruwiańskiej dżungli można znaleźć kafejkę internetową, nie mówiąc już o bardziej cywilizowanych okolicach. Każda firma potrzebuje swojej własnej sieci, dostosowanej do jej potrzeb. Twoja nie jest wyjątkiem. Teraz masz szansę nauczyć się samodzielnie budować wyspecjalizowane sieci komputerowe i zarządzać nimi tak, jak uznasz za stosowne. Z tą książką poznasz wszystkie niezbędne elementy sieci i zorientujesz się, jak najsensowniej ich używać. A potem, jeśli będziesz chciał, będziesz mógł przystąpić do egzaminu CCNA i zostać profesjonalnym „pająkiem”!\r\n\r\nMateriał zawarty w książce Adama Józefioka jest ułożony w taki sposób, by krok po kroku wprowadzić Cię w świat sieci komputerowych. Znajdziesz tu informacje o modelach sieci, konfiguracji podstawowych urządzeń Cisco i programach niezbędnych do posługiwania się sieciami. Odkryjesz, czym różnią się od siebie poszczególne typy sieci i technologie przesyłania danych, zrozumiesz zasady działania routingu statycznego i dynamicznego, nauczysz się obsługiwać protokoły sieciowe. A potem wykorzystasz te wiadomości w serii praktycznych ćwiczeń — i będziesz gotowy sprostać wyzwaniom każdej sieci!\r\nModele sieci, Ethernet, program Wireshark i emulator GNS3\r\nWprowadzenie do systemu operacyjnego IOS i konfiguracja urządzeń Cisco\r\nAdresacja IPv4 oraz IPv6\r\nPrzełączniki sieciowe oraz sieci VLAN\r\nProtokół STP i jego następcy\r\nWprowadzenie do routerów Cisco\r\nRouting pomiędzy sieciami VLAN, statyczny i dynamiczny\r\nListy ACL, Network Address Translation (NAT) oraz DHCP\r\nRedundancja w sieci i wykorzystanie nadmiarowości\r\nTechnologie sieci WAN oraz sieci VPN\r\nSłownik pojęć z wyjaśnieniamiPoznaj sieć i ją spleć!\r\n\r\nCo siedzi w sieci, czyli wstęp do sieci komputerowych\r\nJak sterować ruchem bitów, czyli routery, przełączniki i technologie sieciowe\r\nZ czym to się je, czyli ćwiczenia praktyczne z budowania i obsługi sieci\r\nSieci komputerowe dawno już oplotły cały świat. Nawet w cieniu peruwiańskiej dżungli można znaleźć kafejkę internetową, nie mówiąc już o bardziej cywilizowanych okolicach. Każda firma potrzebuje swojej własnej sieci, dostosowanej do jej potrzeb. Twoja nie jest wyjątkiem. Teraz masz szansę nauczyć się samodzielnie budować wyspecjalizowane sieci komputerowe i zarządzać nimi tak, jak uznasz za stosowne. Z tą książką poznasz wszystkie niezbędne elementy sieci i zorientujesz się, jak najsensowniej ich używać. A potem, jeśli będziesz chciał, będziesz mógł przystąpić do egzaminu CCNA i zostać profesjonalnym „pająkiem”!\r\n\r\nMateriał zawarty w książce Adama Józefioka jest ułożony w taki sposób, by krok po kroku wprowadzić Cię w świat sieci komputerowych. Znajdziesz tu informacje o modelach sieci, konfiguracji podstawowych urządzeń Cisco i programach niezbędnych do posługiwania się sieciami. Odkryjesz, czym różnią się od siebie poszczególne typy sieci i technologie przesyłania danych, zrozumiesz zasady działania routingu statycznego i dynamicznego, nauczysz się obsługiwać protokoły sieciowe. A potem wykorzystasz te wiadomości w serii praktycznych ćwiczeń — i będziesz gotowy sprostać wyzwaniom każdej sieci!\r\nModele sieci, Ethernet, program Wireshark i emulator GNS3\r\nWprowadzenie do systemu operacyjnego IOS i konfiguracja urządzeń Cisco\r\nAdresacja IPv4 oraz IPv6\r\nPrzełączniki sieciowe oraz sieci VLAN\r\nProtokół STP i jego następcy\r\nWprowadzenie do routerów Cisco\r\nRouting pomiędzy sieciami VLAN, statyczny i dynamiczny\r\nListy ACL, Network Address Translation (NAT) oraz DHCP\r\nRedundancja w sieci i wykorzystanie nadmiarowości\r\nTechnologie sieci WAN oraz sieci VPN\r\nSłownik pojęć z wyjaśnieniami', '5147888ccna200.jpg', '2017-10-22 18:16:00'),
(5621124534543, 'Adobe Photoshop CS6. Kreatywne efekty w fotografii ślubnej', 'Franciszek Gołębiowski', 'PSS', 771, 'twarda', 17, 65, 'Fotografia ślubna to temat rzeka. Utrwalenie tego szczególnego momentu w życiu młodych i ich rodzin niesie ze sobą szczególny rodzaj odpowiedzialności. W końcu dokumentacja fotograficzna ślubu i wesela zostanie z nimi na zawsze, stanowiąc dowód i pamiątkę tych szczęśliwych chwil! Dlatego też ważne jest, by fotograf przystąpił do realizacji swojego zadania odpowiednio przygotowany.\r\nW dzisiejszym, cyfrowym świecie dobry aparat i sprawne oko nie wystarczą. Co zrobić ze zdjęciami, które są niemal doskonałe, ale zarówno Ty sam, jak i klienci czujecie, że brak im tego czegoś? Tego, co można udoskonalić, korzystając z narzędzi dostępnych w Adobe Photoshop — najpopularniejszym na świecie programie do obróbki grafiki rastrowej. \r\nCzego więcej trzeba w nowoczesnym świecie mediów? Kursu video, który pozwoli bez problemu i w przyjemny sposób rozpocząć pracę z programem w jego najnowszej wersji CS6!\r\nCo Cię czeka podczas naszego profesjonalnego szkolenia?\r\n\r\nNauczysz się poprawnie pracować z warstwami, grupami oraz maskami.\r\nDowiesz się, jak obsługiwać filtry, oraz poznasz poprawną kolejność nakładania ich na poszczególne warstwy.\r\nPoznasz przydatne skróty ułatwiające pracę.\r\nŁatwo opanujesz zagadnienia techniczne i nabierzesz poprawnego podejścia do obróbki zdjęć.\r\nOdkryjesz kilka naprawdę pomocnych trików wykorzystywanych przez profesjonalnych fotografów w ich codziennej pracy.', '9418823PScs6.jpg', '2017-10-22 18:09:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podkategorie`
--

CREATE TABLE `podkategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `idkat` int(11) NOT NULL,
  `nazwapod` char(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `podkategorie`
--

INSERT INTO `podkategorie` (`id`, `idkat`, `nazwapod`) VALUES
(7, 1, 'Excel'),
(8, 1, 'MS Office'),
(9, 1, 'OpenOffice'),
(10, 1, 'PowerPoint'),
(11, 1, 'Word'),
(13, 8, 'AutoCAD'),
(17, 10, 'Edycja zdjęć'),
(18, 12, 'Podstawy obsługi'),
(19, 11, '3ds max'),
(20, 13, 'Budowa sieci'),
(21, 14, 'MySQL');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `mail` char(50) COLLATE utf8_bin NOT NULL,
  `password` char(40) COLLATE utf8_bin NOT NULL,
  `punkty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `mail`, `password`, `punkty`) VALUES
(1, 'testowy@wp.pl', '2c051d9f4e7c0b1f51b6732bfa062c10272b7b7f', 10),
(8, 'test@wp.pl', 'cdf547ed4c64e6994af35cfcd69c4204c9227a97', 0),
(9, 'zaq@wp.pl', 'cdf547ed4c64e6994af35cfcd69c4204c9227a97', 0),
(10, 'fff@wp.pl', 'cdf547ed4c64e6994af35cfcd69c4204c9227a97', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wysylka`
--

CREATE TABLE `wysylka` (
  `id` int(11) NOT NULL,
  `rodzaj` char(60) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wysylka`
--

INSERT INTO `wysylka` (`id`, `rodzaj`, `cena`) VALUES
(1, 'Kurierska', 15),
(2, 'Poczta Polska', 12),
(3, 'Inpost', 10),
(4, 'Odbiór osobisty', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie_produkty`
--

CREATE TABLE `zamowienie_produkty` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ISBN` bigint(255) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zamowienie_produkty`
--

INSERT INTO `zamowienie_produkty` (`id`, `order_id`, `ISBN`, `quantity`) VALUES
(5, 4, 2147483647, 1),
(6, 5, 2147483647, 1),
(7, 6, 982323145, 9),
(8, 7, 2147483647, 1),
(9, 8, 8127836721, 2),
(10, 9, 8127836721, 1),
(11, 10, 8127836721, 1),
(12, 11, 8127836721, 1),
(13, 12, 8127836721, 7),
(14, 13, 5621124534543, 1),
(15, 14, 856786567546, 1),
(16, 15, 982323145, 1),
(17, 16, 8127836721, 1),
(18, 17, 8127836721, 1),
(19, 18, 892732737213, 1),
(20, 19, 982323145, 1),
(21, 20, 982323145, 1),
(22, 21, 8127836721, 1),
(23, 22, 8127836721, 1),
(24, 23, 892732737213, 1),
(25, 24, 8127836721, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zmaowienie`
--

CREATE TABLE `zmaowienie` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` char(60) NOT NULL,
  `surname` char(60) NOT NULL,
  `street` char(60) NOT NULL,
  `home` char(60) NOT NULL,
  `zip_code` char(60) NOT NULL,
  `city` char(60) NOT NULL,
  `state` char(60) NOT NULL,
  `typeOfShipment` int(11) NOT NULL,
  `totalPrice` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zmaowienie`
--

INSERT INTO `zmaowienie` (`id`, `user_id`, `name`, `surname`, `street`, `home`, `zip_code`, `city`, `state`, `typeOfShipment`, `totalPrice`, `date`, `status`) VALUES
(13, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 3, 74, '2018-01-25', 'wyslano'),
(14, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 3, 63, '2018-01-25', 'w realizacji'),
(15, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 3, 86, '2018-01-25', 'wyslano'),
(16, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 3, 88, '2018-01-25', 'w realizacji'),
(17, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 4, 68, '2018-01-25', 'w realizacji'),
(18, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 4, 98, '2018-01-25', 'w realizacji'),
(19, 9, 'aa', 'a', 'aaa', 'aa', '2323', 'qadasd', 'sdsad', 3, 86, '2018-01-25', 'w realizacji'),
(20, 9, '434', '343', '32432', '4324', '343', '43', '432434', 3, 86, '2018-01-25', 'w realizacji'),
(21, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 3, 73, '2018-01-25', 'w realizacji'),
(22, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 3, 83, '2018-01-25', 'w realizacji'),
(23, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', '3333', 4, 93, '2018-01-25', 'w realizacji'),
(24, 8, 'Jan', 'Nowak', 'Kolejowa', '88', '33-300', 'Nowy', 'Malopolskie', 3, 88, '2018-01-25', 'w realizacji');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`nick`);

--
-- Indexes for table `dklienta`
--
ALTER TABLE `dklienta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `f_user` (`f_user`);

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `podkategorie`
--
ALTER TABLE `podkategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wysylka`
--
ALTER TABLE `wysylka`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zamowienie_produkty`
--
ALTER TABLE `zamowienie_produkty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zmaowienie`
--
ALTER TABLE `zmaowienie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `dklienta`
--
ALTER TABLE `dklienta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT dla tabeli `podkategorie`
--
ALTER TABLE `podkategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT dla tabeli `wysylka`
--
ALTER TABLE `wysylka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `zamowienie_produkty`
--
ALTER TABLE `zamowienie_produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT dla tabeli `zmaowienie`
--
ALTER TABLE `zmaowienie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dklienta`
--
ALTER TABLE `dklienta`
  ADD CONSTRAINT `dklienta_ibfk_1` FOREIGN KEY (`f_user`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
