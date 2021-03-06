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
(534324234, 'ABC PowerPoint. Wszystko co musisz o nim wiedzie??.', 'Aleksandra Tomaszewska', 'PSS', 112, 'mi??kka', 10, 32, 'Wykonanie dobrej prezentacji w PowerPoincie to nic trudnego. Tysi??ce ludzi codziennie u??ywaj?? tego programu do prowadzenia szkole??, przedstawiania efekt??w swojej pracy lub przybli??ania innym skomplikowanych zagadnie??, a nawet zapisywania osobistych wspomnie??. PowerPoint zapewnia swoim u??ytkownikom przyjazne ??rodowisko, szablony, motywy, wizualne i d??wi??kowe efekty specjalne, opcj?? animowania r????nych element??w i wiele innych atrakcji. W nowej ods??onie ??? 2016 ??? oferuje tak??e mo??liwo???? jednoczesnej pracy kilku os??b nad prezentacj?? w chmurze i korzystanie z genialnej wyszukiwarki Tell Me, kt??ra podpowiada, jak wykona?? dan?? operacj??, i uczy si?? zachowa?? u??ytkownika.\r\n\r\nJe??li chcesz zaprzyja??ni?? si?? z PowerPointem i pozna?? najwa??niejsze oraz najbardziej efektowne sposoby tworzenia prezentacji, ta ksi????ka b??dzie dobrym wyborem. Dzi??ki niej nauczysz si?? nadawa?? w??a??ciw?? struktur?? Twojej prezentacji, dodawa?? do niej tekst i elementy multimedialne, ustala?? i zmienia?? kolejno???? slajd??w, u??ywa?? motyw??w wbudowanych i tworzy?? w??asne. Odkryjesz, jak wy??wietla?? i drukowa?? Twoje dokumenty, a tak??e modyfikowa?? je w zale??no??ci od potrzeb. Liczne ilustracje i jasne opisy pomog?? Ci szybko znale???? te informacje, kt??re najbardziej Ci?? interesuj??. Czas zacz???? prac?? z PowerPointem 2016!\r\n??rodowisko programu PowerPoint\r\nTworzenie prezentacji na podstawie konspektu i szablonu\r\nPraca z tekstem i pola tekstowe\r\nOpracowywanie uk??adu i wygl??du slajdu\r\nUstalanie kolejno??ci wy??wietlania slajd??w\r\nKorzystanie z wbudowanych motyw??w\r\nDodawanie i formatowanie tabel, wykres??w i diagram??w\r\nWstawianie i edytowanie zdj????, plik??w wideo i obiekt??w Clipart\r\nAnimowanie tekstu i obiekt??w na slajdach\r\nDodawanie interesuj??cych d??wi??k??w\r\nUdost??pnianie i drukowanie prezentacji\r\nTworzenie w??asnych element??w, motyw??w i szablon??w\r\nDopasowywanie prezentacji do potrzeb r????nych odbiorc??w\r\nPrzygotowywanie prezentacji do wy??wietlenia', '4240692abcpower.jpg', '2017-10-22 17:34:00'),
(982323145, '3ds max 2010. Animacja 3D od podstaw. Szko??a efektu', 'Joanna Pasek', 'PSS', 872, 'twarda', 19, 76, 'Tr??jwymiarowy model ??wiata\r\n\r\nCa??o??ciowy opis wykonania filmu animowanego technik?? 3D\r\n??wiczenia ilustrowane zrzutami ekranu, pomagaj??ce powt??rzy?? wszystkie wykonywane operacje na w??asnym komputerze\r\nP??yta DVD ze wszystkimi scenami, mapami i kompletem innych materia????w\r\nJak stworzy?? animacj?? 3D?\r\n\r\nZ zachwytem ogl??dasz oscarow?? "Katedr??"? Podziwiasz precyzj??, z jak?? wykonane s?? animowane reklamy i teledyski? W ??wiecie gier komputerowych czujesz si?? jak wirtualna ryba w wodzie? Chcesz rozwija?? w sobie bosk?? iskr?? tworzenia? Nie zwlekaj zatem i w????cz program 3ds Max 2010. Niech ogranicza Ci?? jedynie wyobra??nia!\r\n\r\nPoznaj s??ynnego 3ds Maksa ??? Twoje nowe narz??dzie kreowania i animowania tr??jwymiarowego ??wiata. To w??a??nie w tym programie powsta??o wiele znanych Ci animacji i film??w, a tak??e realistycznych graficznie gier oraz zachwycaj??cych wizualizacji architektonicznych. Aby stworzy?? swoj?? pierwsz?? animacj??, koniecznie zapoznaj si?? z mo??liwo??ciami programu 3ds Max 2010, opisanymi w tej ksi????ce. Kartka po kartce, klatka po klatce wkroczysz w wirtualn?? rzeczywisto????, poznaj??c zasady modelowania, animacji postaci, kluczowania, opracowywania ??wiate?? i materia????w, wprowadzania efekt??w specjalnych oraz renderingu i monta??u ca??ego filmu.\r\n\r\nDowiesz si??, jak:\r\ntworzy?? obiekty, pozycjonowa?? je i zmienia?? ich parametry pocz??tkowe;\r\nwprowadza?? i przekazywa?? deformacje obiektu za pomoc?? stosu modyfikator??w;\r\npos??ugiwa?? si?? modelowaniem siatkowym czy ??atami (Patch) i tworzy?? powierzchnie na podstawie krzywych: splajn??w oraz NURBS;\r\nwykorzystywa?? w animacji kamery, ??wiat??a i efekty atmosferyczne (np. ??wiat??o wolumetryczne);\r\nkreowa?? mapowane i animowane materia??y, dodawa?? efekty renderingu (np. efekt ??arzenia), na??ladowa?? metale, sk??r??, drewno, szk??o i chrom;\r\nu??ywa?? renderera Mental Ray i wsp????pracuj??cego z nim systemu o??wietlenia dziennego Daylight;\r\nprzygotowa?? posta?? do animacji przy u??yciu szkieletu (Biped), animowa?? metod?? morfingu, z pomoc?? system??w ko??ci (Bones) i odwrotnej kinematyki;\r\nstosowa?? klucze oraz kontrolery animacji;\r\nmodelowa?? wn??trza tradycyjne i prosto z kosmosu;\r\nprzekszta??ca?? animacj?? 3D w kresk??wk??.', '62454223dsmax.jpg', '2017-10-22 18:14:00'),
(5343242351, 'ABC Word 2016', 'Aleksandra Tomaszewska', 'PSS', 322, 'mi??kka', 11, 31, 'Microsoft Word nale??y do tych aplikacji, bez kt??rych nie spos??b wyobrazi?? sobie wsp????czesnego ??wiata. Tworzone w nim dokumenty stanowi?? podstaw?? dzia??ania milion??w firm, a niezwyk??a ??atwo???? obs??ugi i elastyczno???? sprawiaj??, ??e ka??dy mo??e nauczy?? si?? jego obs??ugi. Je??li jednak chcesz, ??eby Twoje dokumenty wygl??da??y profesjonalnie, a ich odbiorcy traktowali je powa??nie, nie mo??esz skupia?? si?? wy????cznie na tre??ci. Tw??j dokument musi zyska?? odpowiedni wygl??d ??? do tego w??a??nie s??u???? w Wordzie najrozmaitsze opcje formatowania, nadawania styl??w, dodawania obraz??w i wykres??w czy zaznaczania zmian wprowadzanych przez kolejnych czytelnik??w.\r\n\r\nABC Word 2016 PL to ksi????ka, kt??ra pomo??e Ci odkry?? najistotniejsze funkcje najnowszej wersji Worda. Dowiesz si?? z niej, jak wygodnie korzysta?? z programu, tworzy?? r????ne typy dokument??w, zmienia?? czcionki, odst??py lub interlinie. Zobaczysz, jak korzysta?? z szablon??w, wstawia?? tabele, importowa?? ilustracje z innych program??w, tworzy?? indeksy lub spisy tre??ci i drukowa?? efekty swojej pracy. Nauczysz si?? dodawa?? komentarze i por??wnywa?? r????ne wersje jednego dokumentu. Sprawdzisz te??, jak wygl??da wsp????praca w chmurze nad jednym dokumentem tekstowym i jak dzia??a wyszukiwarka Tell Me. Postaw na jako???? Twoich dokument??w!\r\nOtwieranie i drukowanie dokument??w\r\nWprowadzanie, kopiowanie, wklejanie, edycja i usuwanie tekstu\r\nFormatowanie tekstu, uk??adanie list i kolumn\r\nWstawianie element??w graficznych\r\nU??ywanie styl??w i szablon??w\r\nCa??a prawda o tabelach\r\nTworzenie i modyfikowanie konspekt??w, spis??w oraz indeks??w\r\nZasady korespondencji seryjnej oraz adresowanie i drukowanie kopert\r\nZaawansowane narz??dzia edytora i dostosowywanie go do swoich potrzeb\r\nKorzystanie z komentarzy, ??ledzenie zmian, por??wnywanie i scalanie dokument??w', '3399963wordabc.jpg', '2017-10-22 17:39:00'),
(7932541232, 'Po prostu OpenOffice.ux.pl 3.x', 'Waldemar Howil', 'PSS', 823, 'mi??kka', 9, 42, 'Podatki, rachunki, op??aty. Masz ju?? do???? p??acenia za wszystko? Do listy obowi??zkowych wydatk??w dochodzi jeszcze oprogramowanie biurowe ??? niezb??dne i drogie? Niekoniecznie! Poznaj zupe??nie darmow?? alternatyw?? dla popularnego pakietu biurowego rodem zza oceanu. Si??gnij po OpenOffice. To naprawd?? nic nie kosztuje, a zyskujesz pe??ny zestaw biurowy, w postaci edytora tekstu, arkusza kalkulacyjnego, silnika bazodanowego oraz programu do tworzenia prezentacji.\r\n\r\nSprawd?? sam, jak dzia??a OpenOffice! Po co p??aci??, skoro mo??esz mie?? programy o podobnej funkcjonalno??ci zupe??nie za darmo? OpenOffice jest dost??pny dla ka??dego - naprawd?? nie ponosisz ??adnych koszt??w. Programy sk??adaj??ce si?? na pakiet OpenOffice.ux.pl z ca??kowitym powodzeniem wykorzystasz zar??wno w domu, jak i swojej ma??ej firmie. A z t?? ksi????k?? nauczysz si?? zar??wno formatowa?? tekst, jak i generowa?? wykresy, u??ywa?? funkcji arkusza kalkulacyjnego oraz tworzy?? prezentacje w programie Impress.\r\n\r\nOpenOffice rozdzia?? po rozdziale:\r\n\r\npodstawowe funkcje i narz??dzia pakietu OpenOffice;\r\nprofesjonalne dokumenty, formatowanie tekst??w, tabel i kom??rek, animowanie prezentacji;\r\nporuszanie si?? po arkuszu kalkulacyjnym;\r\nochrona danych w kom??rkach;\r\nrodzaje funkcji;\r\ntworzenie prezentacji;\r\nnowa baza danych;\r\npraca z grafik?? wektorow?? w programie Draw;\r\nwykorzystywanie edytora r??wna?? Math;\r\nzapisywanie, eksportowanie i drukowanie dokument??w;\r\nnadawanie rozszerze?? umo??liwiaj??cych dost??p do pliku z program??w innych pakiet??w biurowych;\r\narchiwizacja danych.\r\n', '5024017openpoprostu.jpg', '2017-10-22 17:17:00'),
(8127836721, 'MySQL. Vademecum profesjonalisty.', 'Paul DuBois', 'PSS', 521, 'twarda', 21, 78, 'Kompendium wiedzy o MySQL!\r\n\r\nMySQL to jedna z najpopularniejszych baz danych wykorzystywanych we wsp????czesnych aplikacjach internetowych. Sw??j sukces zawdzi??cza prostej konfiguracji, niewielkim wymaganiom oraz wysokiej niezawodno??ci. Je??eli do tego do??o??ymy genialny wsp????czynnik mo??liwo??ci do ceny ??? baza jest darmowa ??? oraz doskona???? wsp????prac?? z j??zykiem PHP, to otrzymamy rewelacyjny produkt. Warto pami??ta??, ??e MySQL to prawdziwy system bazodanowy, wspieraj??cy zaawansowane techniki replikacji danych i mog??cy przechowywa?? bez problemu miliardy rekord??w.\r\n\r\nTa ksi????ka to kompletny poradnik po??wi??cony wykorzystaniu bazy danych MySQL oraz administrowaniu t?? baz??. W trakcie lektury dowiesz si??, jak najlepiej sk??adowa?? dane w bazie, jak optymalizowa?? zapytania oraz jak pobiera?? metadane. Ponadto nauczysz si?? uzyskiwa?? dost??p do bazy z u??yciem j??zyk??w C, Perl oraz PHP. Niezwykle istotna jest cz?????? trzecia niniejszej publikacji. Po??wi??cona zosta??a w ca??o??ci zagadnieniom zwi??zanym z administrowaniem baz?? MySQL. Zrozumiesz dzi??ki niej, w jaki spos??b baza przechowuje dane, jak zoptymalizowa?? jej wydajno???? oraz co musisz zrobi??, by zagwarantowa?? najwy??szy poziom bezpiecze??stwa. Warto, ??eby?? zawczasu zapozna?? si?? z rozdzia??em po??wi??conym wykonywaniu i odtwarzaniu kopii zapasowej. Ksi????ka jest doskona??ym ??r??d??em informacji zar??wno dla programist??w, jak i administrator??w korzystaj??cych z tej bazy danych.\r\n\r\nDzi??ki tej ksi????ce:\r\n- poznasz dog????bnie baz?? danych MySQL\r\n- zoptymalizujesz jej dzia??anie\r\n- pod????czysz si?? do jej zasob??w za pomoc?? j??zyk??w C, Perl i PHP\r\n- w pe??ni wykorzystasz potencja?? bazy danych MySQL', '4209930MySQLVademecum.jpg', '2017-10-22 18:19:00'),
(52345234234, 'AutoCAD. Pierwsze kroki', 'Andrzej Piko??', 'PSS', 224, 'mi??kka', 13, 89, 'AutoCAD od d??u??szego ju?? czasu stanowi standard w dziedzinie projektowania wspomaganego komputerowo, podobnym standardem sta??y si?? r??wnie?? doskona??e opracowania Andrzeja Pikonia u??atwiaj??ce praktyczn?? nauk?? tego oprogramowania. Nie inaczej jest z najnowszym podr??cznikiem dla pocz??tkuj??cych po??wi??conym ostatniej polskiej wersji rozwi??zania firmy Autodesk, czyli programowi AutoCAD 2014 PL. \r\n\r\n\r\nKsi????ka ???AutoCAD 2014 PL. Pierwsze kroki??? wprowadza czytelnika rozpoczynaj??cego swoj?? przygod?? z narz??dziami CAD w ??wiat nowoczesnego oprogramowania in??ynierskiego, krok po kroku wyja??niaj??c zawi??o??ci zwi??zane z tworzeniem, edytowaniem i drukowaniem dokumentacji technicznej oraz u??atwiaj??c wyrobienie w??a??ciwych nawyk??w w pracy z aplikacj??.\r\n\r\nPocz??tkuj??cy u??ytkownik AutoCAD-a znajdzie w niej wszystko, co niezb??dne do gruntownego poznania ??rodowiska. Dzi??ki jasnym wskaz??wkom i rysunkom przedstawiaj??cym poszczeg??lne etapy pracy nauczy si?? tworzy?? i modyfikowa?? proste oraz bardziej z??o??one obiekty, dobiera?? odpowiednie linie, stosowa?? kreskowania, pos??ugiwa?? si?? szykami, korzysta?? z uchwyt??w, kontrolowa?? wymiary, dodawa?? opisy tekstowe, a tak??e u??ywa?? blok??w i warstw. Pozna te?? mo??liwo??ci zwi??zane z parametryzacj?? rysunk??w oraz dowie si?? jak przegl??da?? i drukowa?? rysunki.\r\n\r\nJe??li CAD, to AutoCAD. Je??li podr??cznik, to tylko AutoCAD 2014 PL. Pierwsze kroki!\r\n\r\n\r\n???    Najwa??niejsze informacje o ??rodowisku\r\n???    Podstawowe operacje rysunkowe\r\n???    Poruszanie si?? w przestrzeni rysunku\r\n???    Tworzenie i modyfikowanie obiekt??w\r\n???    Stosowanie r????nych rodzaj??w linii i kreskowania\r\n???    Korzystanie z szyku ko??owego i prostok??tnego\r\n???    Wstawianie tekst??w i wymiarowanie obiekt??w\r\n???    Parametryzacja rysunku, u??ywanie blok??w i warstw\r\n???    Przygotowywanie do wydruku i drukowanie rysunku ', '8848632autocad.jpg', '2017-10-22 17:52:00'),
(98423425422, 'Mistrz analizy danych. Od danych do wiedzy', 'John W. Foreman', 'PSS', 211, 'twarda', 7, 67, 'Nauka o danych, znana r??wnie?? pod nazw?? data science, jest stosunkowo now??, interdyscyplinarn?? dziedzin??, zajmuj??c?? si?? r????nymi technikami analizy danych, ich implementacj?? i wykorzystywaniem do r????nych cel??w. Zalety nauki o danych doceniaj?? specjali??ci z wielu bran??: analitycy biznesowi, statystycy, architekci oprogramowania i osoby zajmuj??ce si?? sztuczn?? inteligencj??. Tak naprawd?? ta dziedzina nie koncentruje si?? na kodowaniu i bazach danych, ale raczej na metodach wy??uskiwania z danych najr????niejszych cennych informacji. Warto???? tej wiedzy niejednokrotnie okazuje si?? ogromna.\r\n\r\nNiniejsza ksi????ka jest przyst??pnym wprowadzeniem do nauki o danych. Jest przeznaczona dla os??b, kt??re chc?? stosowa?? techniki analizy danych w biznesie. Te techniki, opisane na podstawie praktycznych przypadk??w, to m.in. optymalizacja, prognozowanie i symulacja, a tak??e sztuczna inteligencja, teoria graf??w, analiza skupie?? i wykrywanie anomalii. Dzi??ki tej ksi????ce nie tylko zrozumiesz zasady analizowania danych, ale tak??e nauczysz si?? wybiera?? technik?? w??a??ciw?? do rozwi??zania danego problemu. Poznasz te?? techniki pracy z prototypami. Co ciekawe, niemal wszystkie opisane tu metody zosta??y zaprezentowane w arkuszu kalkulacyjnym.\r\n\r\nW ksi????ce opisano m.in.\r\n\r\noptymalizacj?? za pomoc?? programowania liniowego i ca??kowitoliczbowego\r\nszereg czasowy, wykrywanie trend??w i waha?? sezonowych\r\nprzewidywanie za pomoc?? wyg??adzania wyk??adniczego\r\nmetod?? symulacji Monte Carlo\r\ntest Tukeya i lokalne czynniki odstaj??ce\r\nj??zyk R ??? zaawansowane techniki analizy danych', '1586669mistrzanalizydanych.jpg', '2017-10-22 17:17:00'),
(563243243256, 'Microsoft Office 2013. Praktyczne programowanie makr i dodatk??w', 'Dawid Borycki', 'PSS', 741, 'twarda', 8, 66, 'Microsoft Office to niezwykle elastyczny i przy tym bardzo popularny pakiet biurowy. Du??ej cz????ci jego u??ytkownik??w wystarczaj?? podstawowe mo??liwo??ci pakietu. Jednak istnieje spora grupa os??b chc??cych mie?? dost??p do jeszcze bardziej zaawansowanych narz??dzi bez konieczno??ci rezygnowania z uniwersalnej wersji Office???a. Dla nich w??a??nie powstaj?? niewielkie aplikacje-dodatki, kt??re mo??na kupi?? w sklepach internetowych. Je??li chcesz dowiedzie?? si??, jak projektowa?? takie przydatne programy, trafi??e?? na idealn?? ksi????k??.\r\n\r\nW tej publikacji znajdziesz om??wienie sposob??w tworzenia makr, dodatk??w i aplikacji dla Microsoft Office 2013 i 365 z wykorzystaniem trzech najpopularniejszych technologii: Visual Studio Tools for Office, Visual Basic for Applications oraz JavaScript Object Model. Ka??da z nich zosta??a opisana na konkretnych przyk??adach. Pokazano tu sekwencj?? krok??w, kt??re trzeba wykona??, by makropolecenie lub dodatek zacz????y poprawnie dzia??a??. Om??wiono r????ne opcje, biblioteki kontrolek, sposoby integracji dodatk??w z programami Office???a i kwestie publikacji gotowych aplikacji. Rozszerz mo??liwo??ci swojego pakietu Office!\r\n\r\nProjekt aplikacji-dodatku VSTO\r\nKontrolki Windows Forms w dodatkach VSTO\r\nTworzenie tabel, zarz??dzanie dokumentami i wbudowane okna dialogowe w VSTO\r\nKorespondencja seryjna i dost??p do danych z wykorzystaniem technologii ADO.NET Entity Framework\r\nIntegracja skoroszyt??w z zewn??trznymi ??r??d??ami danych\r\nRejestracja, edycja i publikacja makr z wykorzystaniem VBA\r\nWykorzystanie VBA do tworzenia wykres??w, regresji liniowej oraz korespondencji seryjnej\r\nDost??p do wbudowanych funkcji Excela z poziomu VBA\r\nProgramowanie makr w Wordzie: tabele i wykresy, zarz??dzanie dokumentami\r\nSzablon projektu aplikacji dla pakietu Office 2013 i 365 w JavaScript Object Model\r\nProgramowanie widok??w i dost??p do zawarto??ci dokument??w w JavaScript Object Model\r\nWykorzystanie danych z serwis??w internetowych na przyk??adzie Google Maps w JavaScript Object Model', '1962677office2013.jpg', '2017-10-22 17:19:00'),
(856786567546, 'Komputer PC. Poradnik bez kant??w', 'Bartosz Danowski', 'PSS', 117, 'mi??kka', 18, 53, 'Czy jeste?? w stanie wyobrazi?? sobie wsp????czesn?? rodzin?? radz??c?? sobie bez komputera? A mo??e nale??ysz do grona tych os??b, kt??re ci??gle uwa??aj??, ??e komputer jest im niepotrzebny? Mo??e uznajesz jego obs??ug?? za rzecz na tyle skomplikowan??, ??e nie znajdujesz czasu na poznawanie jej niuans??w? Umiej??tno???? korzystania z mo??liwo??ci peceta i posiadanie w??asnego komputera to dzi?? niemal konieczno????. Oczywi??cie, nadal mo??esz zdobywa?? informacje z r????nych dziennik??w, sta?? w bankowych kolejkach, by op??aci?? kabl??wk??, a z rodzin?? mieszkaj??c?? za granic?? rozmawia?? przez telefon stacjonarny za grube pieni??dze. Jednak dzi??ki komputerowi zrobisz to znacznie szybciej, sprawniej, taniej i bez wychodzenia z domu. Nadal s??dzisz, ??e komputer jest Ci niepotrzebny? Pomy??l o uporz??dkowaniu swojej kolekcji ksi????ek, od??wie??eniu kontaktu ze starymi znajomymi (kt??rzy ju?? na pewno kupili komputery), wcieleniu si?? w rol?? kierowcy WRC i poczytaniu recenzji najnowszych film??w przed wybraniem si?? do kina. Tak - na to wszystko pozwoli Ci domowy komputer.\r\n\r\nKsi????ka "Komputer PC. Poradnik bez kant??w" rozwieje Twoje w??tpliwo??ci i obawy dotycz??ce obs??ugi tego niezwyk??ego urz??dzenia. Czytaj??c j??, przekonasz si??, ??e nie taki komputer straszny, jak go maluj??. Dowiesz si??, jak wybra?? optymalny zestaw, jak czyta?? ulotki reklamowe i na co zwraca?? uwag?? przy zakupie sprz??tu. Samodzielnie po????czysz elementy zestawu i uruchomisz komputer. Nauczysz si?? korzysta?? z systemu operacyjnego Windows Vista, instalowa?? oprogramowanie i przegl??da?? strony internetowe. Poznasz bezp??atny pakiet biurowy OpenOffice, wy??lesz i odbierzesz poczt?? elektroniczn??, nagrasz p??yty CD i przygotujesz sw??j album. Komputer stanie si?? Twoim niezast??pionym narz??dziem pracy i komunikacji ze ??wiatem!\r\n\r\nWyb??r element??w zestawu komputerowego\r\nMonta?? komputera\r\nPierwsze uruchomienie\r\nInstalacja i wst??pna konfiguracja systemu Windows Vista\r\nPraca z oknami i menu systemu Windows\r\nInstalacja oprogramowania\r\nEdycja dokument??w i arkuszy kalkulacyjnych w OpenOffice\r\nAktualizacja systemu\r\nOchrona przed wirusami\r\nPrzegl??danie witryn WWW\r\nKorzystanie z poczty elektronicznej\r\nNagrywanie p??yt CD i DVD\r\nOdtwarzanie muzyki i film??w', '9104888pcpoczatkujacy.jpg', '2017-10-22 18:11:00'),
(892732737213, 'CCNA 200-120. Zosta?? administratorem sieci komputerowych Cisco', 'Adam J??zefiok', 'PSS', 876, 'twarda', 20, 99, 'Poznaj sie?? i j?? sple??!\r\n\r\nCo siedzi w sieci, czyli wst??p do sieci komputerowych\r\nJak sterowa?? ruchem bit??w, czyli routery, prze????czniki i technologie sieciowe\r\nZ czym to si?? je, czyli ??wiczenia praktyczne z budowania i obs??ugi sieci\r\nSieci komputerowe dawno ju?? oplot??y ca??y ??wiat. Nawet w cieniu peruwia??skiej d??ungli mo??na znale???? kafejk?? internetow??, nie m??wi??c ju?? o bardziej cywilizowanych okolicach. Ka??da firma potrzebuje swojej w??asnej sieci, dostosowanej do jej potrzeb. Twoja nie jest wyj??tkiem. Teraz masz szans?? nauczy?? si?? samodzielnie budowa?? wyspecjalizowane sieci komputerowe i zarz??dza?? nimi tak, jak uznasz za stosowne. Z t?? ksi????k?? poznasz wszystkie niezb??dne elementy sieci i zorientujesz si??, jak najsensowniej ich u??ywa??. A potem, je??li b??dziesz chcia??, b??dziesz m??g?? przyst??pi?? do egzaminu CCNA i zosta?? profesjonalnym ???paj??kiem???!\r\n\r\nMateria?? zawarty w ksi????ce Adama J??zefioka jest u??o??ony w taki spos??b, by krok po kroku wprowadzi?? Ci?? w ??wiat sieci komputerowych. Znajdziesz tu informacje o modelach sieci, konfiguracji podstawowych urz??dze?? Cisco i programach niezb??dnych do pos??ugiwania si?? sieciami. Odkryjesz, czym r????ni?? si?? od siebie poszczeg??lne typy sieci i technologie przesy??ania danych, zrozumiesz zasady dzia??ania routingu statycznego i dynamicznego, nauczysz si?? obs??ugiwa?? protoko??y sieciowe. A potem wykorzystasz te wiadomo??ci w serii praktycznych ??wicze?? ??? i b??dziesz gotowy sprosta?? wyzwaniom ka??dej sieci!\r\nModele sieci, Ethernet, program Wireshark i emulator GNS3\r\nWprowadzenie do systemu operacyjnego IOS i konfiguracja urz??dze?? Cisco\r\nAdresacja IPv4 oraz IPv6\r\nPrze????czniki sieciowe oraz sieci VLAN\r\nProtok???? STP i jego nast??pcy\r\nWprowadzenie do router??w Cisco\r\nRouting pomi??dzy sieciami VLAN, statyczny i dynamiczny\r\nListy ACL, Network Address Translation (NAT) oraz DHCP\r\nRedundancja w sieci i wykorzystanie nadmiarowo??ci\r\nTechnologie sieci WAN oraz sieci VPN\r\nS??ownik poj???? z wyja??nieniamiPoznaj sie?? i j?? sple??!\r\n\r\nCo siedzi w sieci, czyli wst??p do sieci komputerowych\r\nJak sterowa?? ruchem bit??w, czyli routery, prze????czniki i technologie sieciowe\r\nZ czym to si?? je, czyli ??wiczenia praktyczne z budowania i obs??ugi sieci\r\nSieci komputerowe dawno ju?? oplot??y ca??y ??wiat. Nawet w cieniu peruwia??skiej d??ungli mo??na znale???? kafejk?? internetow??, nie m??wi??c ju?? o bardziej cywilizowanych okolicach. Ka??da firma potrzebuje swojej w??asnej sieci, dostosowanej do jej potrzeb. Twoja nie jest wyj??tkiem. Teraz masz szans?? nauczy?? si?? samodzielnie budowa?? wyspecjalizowane sieci komputerowe i zarz??dza?? nimi tak, jak uznasz za stosowne. Z t?? ksi????k?? poznasz wszystkie niezb??dne elementy sieci i zorientujesz si??, jak najsensowniej ich u??ywa??. A potem, je??li b??dziesz chcia??, b??dziesz m??g?? przyst??pi?? do egzaminu CCNA i zosta?? profesjonalnym ???paj??kiem???!\r\n\r\nMateria?? zawarty w ksi????ce Adama J??zefioka jest u??o??ony w taki spos??b, by krok po kroku wprowadzi?? Ci?? w ??wiat sieci komputerowych. Znajdziesz tu informacje o modelach sieci, konfiguracji podstawowych urz??dze?? Cisco i programach niezb??dnych do pos??ugiwania si?? sieciami. Odkryjesz, czym r????ni?? si?? od siebie poszczeg??lne typy sieci i technologie przesy??ania danych, zrozumiesz zasady dzia??ania routingu statycznego i dynamicznego, nauczysz si?? obs??ugiwa?? protoko??y sieciowe. A potem wykorzystasz te wiadomo??ci w serii praktycznych ??wicze?? ??? i b??dziesz gotowy sprosta?? wyzwaniom ka??dej sieci!\r\nModele sieci, Ethernet, program Wireshark i emulator GNS3\r\nWprowadzenie do systemu operacyjnego IOS i konfiguracja urz??dze?? Cisco\r\nAdresacja IPv4 oraz IPv6\r\nPrze????czniki sieciowe oraz sieci VLAN\r\nProtok???? STP i jego nast??pcy\r\nWprowadzenie do router??w Cisco\r\nRouting pomi??dzy sieciami VLAN, statyczny i dynamiczny\r\nListy ACL, Network Address Translation (NAT) oraz DHCP\r\nRedundancja w sieci i wykorzystanie nadmiarowo??ci\r\nTechnologie sieci WAN oraz sieci VPN\r\nS??ownik poj???? z wyja??nieniami', '5147888ccna200.jpg', '2017-10-22 18:16:00'),
(5621124534543, 'Adobe Photoshop CS6. Kreatywne efekty w fotografii ??lubnej', 'Franciszek Go????biowski', 'PSS', 771, 'twarda', 17, 65, 'Fotografia ??lubna to temat rzeka. Utrwalenie tego szczeg??lnego momentu w ??yciu m??odych i ich rodzin niesie ze sob?? szczeg??lny rodzaj odpowiedzialno??ci. W ko??cu dokumentacja fotograficzna ??lubu i wesela zostanie z nimi na zawsze, stanowi??c dow??d i pami??tk?? tych szcz????liwych chwil! Dlatego te?? wa??ne jest, by fotograf przyst??pi?? do realizacji swojego zadania odpowiednio przygotowany.\r\nW dzisiejszym, cyfrowym ??wiecie dobry aparat i sprawne oko nie wystarcz??. Co zrobi?? ze zdj??ciami, kt??re s?? niemal doskona??e, ale zar??wno Ty sam, jak i klienci czujecie, ??e brak im tego czego??? Tego, co mo??na udoskonali??, korzystaj??c z narz??dzi dost??pnych w Adobe Photoshop ??? najpopularniejszym na ??wiecie programie do obr??bki grafiki rastrowej. \r\nCzego wi??cej trzeba w nowoczesnym ??wiecie medi??w? Kursu video, kt??ry pozwoli bez problemu i w przyjemny spos??b rozpocz???? prac?? z programem w jego najnowszej wersji CS6!\r\nCo Ci?? czeka podczas naszego profesjonalnego szkolenia?\r\n\r\nNauczysz si?? poprawnie pracowa?? z warstwami, grupami oraz maskami.\r\nDowiesz si??, jak obs??ugiwa?? filtry, oraz poznasz poprawn?? kolejno???? nak??adania ich na poszczeg??lne warstwy.\r\nPoznasz przydatne skr??ty u??atwiaj??ce prac??.\r\n??atwo opanujesz zagadnienia techniczne i nabierzesz poprawnego podej??cia do obr??bki zdj????.\r\nOdkryjesz kilka naprawd?? pomocnych trik??w wykorzystywanych przez profesjonalnych fotograf??w w ich codziennej pracy.', '9418823PScs6.jpg', '2017-10-22 18:09:00');

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
(17, 10, 'Edycja zdj????'),
(18, 12, 'Podstawy obs??ugi'),
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
(4, 'Odbi??r osobisty', 0);

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
-- Indeksy dla zrzut??w tabel
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
-- Ograniczenia dla zrzut??w tabel
--

--
-- Ograniczenia dla tabeli `dklienta`
--
ALTER TABLE `dklienta`
  ADD CONSTRAINT `dklienta_ibfk_1` FOREIGN KEY (`f_user`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
