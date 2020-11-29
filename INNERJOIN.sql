-- SELECT * FROM learningsql.product;
 CREATE TABLE House(
 HouseID INT NOT NULL PRIMARY KEY,
 `Address` varchar(255) NULL,
 HouseName varchar (200) NULL,
 PhoneNumber varchar(20) NULL
 );
CREATE TABLE Rooms(
RoomID int NOT NULL PRIMARY KEY,
RoomNumber varchar(10),
HouseID INT, 	
RoomOwner varchar(50),
FOREIGN KEY (HouseID) REFERENCES House(HouseID)
);


SELECT * FROM House;
SELECT * FROM Rooms;
SELECT RoomNumber FROM Rooms INNER JOIN House ON House.HouseID = Rooms.HouseID
WHERE HouseName = 'A38';
-- Don't have 7,8,9 so change to 4,5,6
-- Distinct as many selections have the same houseNames
SELECT HouseName FROM Rooms 
INNER JOIN House
ON House.HouseID = Rooms.HouseID 
WHERE RoomID IN (4,5,6);
-- No Anh% so change to A%
-- > 2 table, specify where the colume comes from
SELECT Rooms.RoomNumber FROM Rooms INNER JOIN House ON House.HouseID = Rooms.HouseID
WHERE HouseName LIKE "A%";

SELECT RoomOwner FROM Rooms INNER JOIN House ON House.HouseID = Rooms.HouseID
WHERE HouseName LIKE "%OA%";

SELECT * FROM House;
SELECT * FROM Rooms;

SELECT Address FROM House INNER JOIN Rooms ON House.HouseID = Rooms.HouseID
WHERE RoomID IN (1,2,3);

SELECT PhoneNumber FROM House INNER JOIN Rooms ON House.HouseID = Rooms.HouseID
WHERE RoomID IN (4,5,6);
 
 -- A: 1 2 3 5 7
 -- B: 1 2   5   8 9 
 
 
 SELECT House.HouseID, Rooms.HouseID FROM Rooms LEFT JOIN House ON House.HouseID = Rooms.HouseID
 UNION ALL
 SELECT House.HouseID, Rooms.HouseID FROM Rooms RIGHT JOIN House ON House.HouseID = Rooms.HouseID;

 SELECT * FROM House;
 -- BTVN 2
 CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(255) NULL,
    LocationID INT NULL,
	FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Location(
	LocationID INT PRIMARY KEY NOT NULL,
    Street VARCHAR(255) NULL,
    Province VARCHAR(255) NULL
);

CREATE TABLE City(
	CityID INT PRIMARY KEY NOT NULL,
    CityName VARCHAR(255) NULL,
    CapitalName VARCHAR(255) NULL
);

ALTER TABLE Location ADD CityID INT;
ALTER TABLE Location ADD FOREIGN KEY (CityID) REFERENCES City(CityID);

INSERT INTO Departments (DepartmentID, DepartmentName, LocationID)
    VALUES
    (1, "AG-112", 3),
    (2, "AB-123", 4),
    (3, "AE-132", 1),
    (4, "GE-552", 2),
    (5, "OP-213", 4),
    (6, "HS-109", 4),
    (7, "IEAP-222", 3),
    (8, "IEQ-223", 1),
    (9, "KIE-221", 2),
    (10, "LFE-256", 3)
;
INSERT INTO Location (LocationID, Street, Province)
	VALUES
(0, "Cau Him Lam", "Bắc Kạ"), 
(1, "Ngo Quyen", "Bình Dươn"), 
(2, "Do Xuan Hop", "Đồng Thá"), 
(3, "Ly Thuong Kiet", "Bạc Liê"), 
(4, "Ly Thuong Kiet", "Điện Biê"), 
(5, "Ho Dac Di", "Bình Địn"), 
(6, "Lac Long Quan", "Đắk Lắ"), 
(7, "Mac Thien Tich", "Gia La"), 
(8, "Tinh Lo 10", "Bắc Kạ"), 
(9, "Cau Him Lam", "Bắc Nin"), 
(10, "Ngo Quyen", "Bình Thuậ"), 
(11, "Bui Vien", "Bình Phướ"), 
(12, "Ngo Quyen", "Bình Phướ"), 
(13, "Ho Dac Di", "Bình Thuậ"), 
(14, "Nguyen Van Dau", "Bạc Liê"), 
(15, "Tinh Lo 10", "Bình Địn"), 
(16, "Ly Thuong Kiet", "Cà Ma"), 
(17, "Khanh Hoi", "Hà Giang"), 
(18, "Ly Thuong Kiet", "Điện Biê"), 
(19, "Ngo Quyen", "Gia La"), 
(20, "Khanh Hoi", "Bình Phướ"), 
(21, "Ngo Quyen", "Bình Dươn"), 
(22, "Lac Long Quan", "Điện Biê"), 
(23, "Mac Thien Tich", "Bắc Kạ"), 
(24, "Nguyen Van Dau", "Bắc Kạ"), 
(25, "Mac Thien Tich", "Điện Biê"), 
(26, "Khanh Hoi", "An Gian"), 
(27, "Do Xuan Hop", "Bình Phướ"), 
(28, "Nguyen Thuong Hien", "Đắk Lắ"), 
(29, "Khanh Hoi", "Cà Ma"), 
(30, "Nguyen Thuong Hien", "Cà Ma"), 
(31, "Lac Long Quan", "Bắc Gian"), 
(32, "Do Xuan Hop", "Bình Dươn"), 
(33, "Ho Dac Di", "Bình Thuậ"), 
(34, "Ho Dac Di", "Đắk Nôn"), 
(35, "Nguyen Van Dau", "Hà Giang"), 
(36, "Cau Him Lam", "Điện Biê"), 
(37, "Lac Long Quan", "An Gian"), 
(38, "Do Xuan Hop", "Đắk Nôn"), 
(39, "Bui Vien", "Bắc Nin"), 
(40, "Khanh Hoi", "Bến Tr"), 
(41, "Bui Vien", "An Gian"), 
(42, "Bui Vien", "Bình Dươn"), 
(43, "Do Xuan Hop", "Bình Dươn"), 
(44, "Nguyen Thuong Hien", "Cao Bằn"), 
(45, "Ho Dac Di", "Cà Ma"), 
(46, "Nguyen Van Dau", "An Gian"), 
(47, "Nguyen Thuong Hien", "An Gian"), 
(48, "Nguyen Thuong Hien", "Bắc Nin"), 
(49, "Le Van Tho", "Điện Biê"), 
(50, "Ngo Quyen", "Đắk Lắ")	
;
  
INSERT INTO City (CityID, CityName, CapitalName)
	VALUES
(1, "Bonn", "India"), 
(2, "Berrechid", "Philippines"), 
(3, "Bremerhaven", "Brazil"), 
(4, "Bahir Dar", "Cuba"), 
(5, "Bucharest", "Venezuela"), 
(6, "Baoji", "United States"), 
(7, "Bayawan", "United Kingdom"), 
(8, "Bnei Brak", "Nepal"), 
(9, "Bagé", "United Kingdom"), 
(10, "Bolzano", "South Africa"), 
(11, "Bahraich", "Spain"), 
(12, "Bhopal", "South Africa"), 
(13, "Bellevue", "South Africa"), 
(14, "Burbank", "Philippines"), 
(15, "Burhanpur", "Slovakia"), 
(16, "Barueri", "Russia"), 
(17, "Birigui", "Portugal"), 
(18, "Bhiwandi", "Germany"), 
(19, "Barika", "Canada"), 
(20, "Basti", "Argentina"), 
(21, "Baghlan", "India"), 
(22, "Bacoor", "India"), 
(23, "Botshabelo", "Romania"), 
(24, "Bilbao", "Russia"), 
(25, "Bragança Paulista", "Egypt"), 
(26, "Bujumbura", "Algeria"), 
(27, "Bolton", "Belgium"), 
(28, "Bragança Paulista", "Switzerland"), 
(29, "Babol", "Algeria"), 
(30, "Bhiwandi", "India"), 
(31, "Bandar Seri Begawan", "Indonesia"), 
(32, "Bayannur", "Russia"), 
(33, "Birgunj", "United States"), 
(34, "Biysk", "India"), 
(35, "Burnaby", "Germany"), 
(36, "Bhadreswar", "Mozambique"), 
(37, "Bragança", "China"), 
(38, "Behbahan", "Romania"), 
(39, "Badlapur", "Algeria"), 
(40, "Belgrade", "Moldova"), 
(41, "Burewala", "South Korea"), 
(42, "Bern", "Israel"), 
(43, "Berrechid", "Brazil"), 
(44, "Baoshan", "India"), 
(45, "Boa Vista", "Philippines"), 
(46, "Bole", "Brazil"), 
(47, "Brest, Brittany", "Libya"), 
(48, "Barquisimeto", "Brazil"), 
(49, "Bissau", "India"), 
(50, "Butwal", "India"), 
(51, "Bansberia", "Algeria"), 
(52, "Binzhou", "India"), 
(53, "Bern", "India"), 
(54, "Benito Juárez", "Philippines"), 
(55, "Biratnagar", "Dominican Republic"), 
(56, "Bandar-e Anzali", "Hungary"), 
(57, "Baishan", "Germany"), 
(58, "Binzhou", "Romania"), 
(59, "Batala", "Democratic Republic of the Congo"), 
(60, "Bulan", "China"), 
(61, "Baishan", "United States"), 
(62, "Bally, Howrah", "Algeria"), 
(63, "Bhubaneswar", "Israel"), 
(64, "Battambang", "Germany"), 
(65, "Bahawalpur", "Iran"), 
(66, "Banjarmasin", "India"), 
(67, "Burgos", "Romania"), 
(68, "Béjaïa", "United Kingdom"), 
(69, "Bissau", "Indonesia"), 
(70, "Beihai", "Ethiopia"), 
(71, "Bangui", "United States"), 
(72, "Behbahan", "Brazil"), 
(73, "Brest, Brest", "India"), 
(74, "Banja Luka", "India"), 
(75, "Brampton", "South Africa"), 
(76, "Baliuag", "India"), 
(77, "Bosaso", "India"), 
(78, "Badajoz", "Morocco"), 
(79, "Borama", "India"), 
(80, "Bangkok", "Serbia"), 
(81, "Bally, Bally-Jagachha", "Belarus"), 
(82, "Botshabelo", "India"), 
(83, "Bandar-e Anzali", "United States"), 
(84, "Bhalswa Jahangir Pur", "Algeria"), 
(85, "Basirhat", "Israel"), 
(86, "Botshabelo", "India"), 
(87, "Baicheng", "Indonesia"), 
(88, "Bolu", "China"), 
(89, "Bacoor", "Sierra Leone"), 
(90, "Bamenda", "Poland"), 
(91, "Banda", "United Kingdom"), 
(92, "Barra Mansa", "Brazil"), 
(93, "Bhimavaram", "Colombia"), 
(94, "Baliuag", "India"), 
(95, "Bologna", "Colombia"), 
(96, "Béchar", "Germany"), 
(97, "Barreiras", "France"), 
(98, "Basel", "Mozambique"), 
(99, "Boise", "Philippines"), 
(100, "Batam", "Georgia"), 
(101, "Bolzano", "India"), 
(102, "Barnaul", "United States"), 
(103, "Bafoussam", "Oman"), 
(104, "Brazzaville", "China"), 
(105, "Bharuch", "Germany"), 
(106, "Biñan", "Iraq"), 
(107, "Bagaha", "Italy"), 
(108, "Baranagar", "Nepal"), 
(109, "Beipiao", "South Korea"), 
(110, "Bharatpur, Rajasthan", "India"), 
(111, "Boca Chica", "Argentina"), 
(112, "Belém", "Iran"), 
(113, "Balurghat", "India"), 
(114, "Bratislava", "Somalia"), 
(115, "Bayambang", "Indonesia"),(116, "Badalona", "Iran"), 
(117, "Bellevue", "India"), 
(118, "Basti", "India"), 
(119, "Bratsk", "China"), 
(120, "Birmingham, Alabama", "Switzerland"), 
(121, "Bandar Seri Begawan", "Brazil"), 
(122, "Barinas", "Algeria"), 
(123, "Bratsk", "Brazil"), 
(124, "Benxi", "Spain"), 
(125, "Burgos", "United Kingdom"), 
(126, "Bahraich", "India"), 
(127, "Baoji", "South Africa"), 
(128, "Belford Roxo", "Philippines"), 
(129, "Behbahan", "Philippines"), 
(130, "Blumenau", "Venezuela"), 
(131, "Bergamo", "United States"), 
(132, "Beed", "Russia"), 
(133, "Batman", "Italy"), 
(134, "Bruges", "China"), 
(135, "Beersheba", "Cambodia"), 
(136, "Bhagalpur", "China"), 
(137, "Binangonan", "Myanmar"), 
(138, "Bajos de Haina", "United States"), 
(139, "Borama", "Somalia"), 
(140, "Bhadreswar", "Ethiopia"), 
(141, "Blumenau", "Mozambique"), 
(142, "Budaun", "South Africa"), 
(143, "Banda Aceh", "Mozambique"), 
(144, "Bashiqa", "Iran"), 
(145, "Bojnord", "Brazil"), 
(146, "Bento Goncalves", "Argentina"), 
(147, "Beau-Bassin Rose-Hill", "Egypt"), 
(148, "Beau-Bassin Rose-Hill", "Azerbaijan"), 
(149, "Blagoveshchensk", "United States"), 
(150, "Bangalore", "Venezuela"), 
(151, "Benoni", "Germany"), 
(152, "Bamenda", "India"), 
(153, "Bern", "Iraq"), 
(154, "Blida", "India"), 
(155, "Budapest", "South Korea"), 
(156, "Bayamón", "Germany"), 
(157, "Bruges", "India"), 
(158, "Biñan", "Central African Republic"), 
(159, "Beau-Bassin Rose-Hill", "Malaysia"), 
(160, "Berbera", "Spain"), 
(161, "Belford Roxo", "Morocco"), 
(162, "Bandar Lampung", "India"), 
(163, "Bakersfield", "Romania"), 
(164, "Bhiwani", "Brazil"), 
(165, "Banja Luka", "Belarus"), 
(166, "Bochum", "India"), 
(167, "Banjul", "Germany"), 
(168, "Babol", "Indonesia"), 
(169, "Bogor", "Brazil"), 
(170, "Belém", "India"), 
(171, "Brazzaville", "Cuba"), 
(172, "Banda Aceh", "Ukraine"), 
(173, "Barshi", "India"), 
(174, "Bryansk", "Canada"), 
(175, "Barka", "Ivory Coast"), 
(176, "Baleshwar", "Algeria"), 
(177, "Berhampur", "Sierra Leone"), 
(178, "Bazhou", "Mauritius"), 
(179, "Bahraich", "Iraq"), 
(180, "Baraki", "Italy"), 
(181, "Bukhara", "Russia"), 
(182, "Bolzano", "Colombia"), 
(183, "Bandar Lampung", "Bangladesh"), 
(184, "Bouïra", "China"), 
(185, "Beira", "Romania"), 
(186, "Balıkesir", "India"), 
(187, "Bawshar", "France"), 
(188, "Beau-Bassin Rose-Hill", "Poland"), 
(189, "Baraut", "India"), 
(190, "Breda", "India"), 
(191, "Bhind", "Oman"), 
(192, "Bouaké", "India"), 
(193, "Barysaw", "Philippines"), 
(194, "Baybay", "United Kingdom"), 
(195, "Barasat", "India"), 
(196, "Batumi", "India"), 
(197, "Binjai", "Canada"), 
(198, "Brăila", "India"), 
(199, "Bataysk", "Morocco"), 
(200, "Bogra", "India"), 
(201, "Badalona", "Brazil"), 
(202, "Bizerte", "South Korea"), 
(203, "Bago", "India"), 
(204, "Bhimavaram", "Mexico"), 
(205, "Batu", "Venezuela"), 
(206, "Bordeaux", "Nepal"), 
(207, "Buraidah", "India"), 
(208, "Bharatpur, Chitwan", "Switzerland"), 
(209, "Bidhannagar", "India"), 
(210, "Baise", "Bangladesh"), 
(211, "Bagaha", "India"), 
(212, "Bellevue", "Germany"), 
(213, "Baidoa", "Guinea-Bissau"), 
(214, "Babruysk", "Poland"), 
(215, "Blackpool", "France"), 
(216, "Biysk", "Moldova"), 
(217, "Bokaro Steel City", "Italy"), 
(218, "Bakersfield", "Philippines"), 
(219, "Benghazi", "India"), 
(220, "Bremen", "India"), 
(221, "Boksburg", "Somalia"), 
(222, "Bally, Bally-Jagachha", "Italy"), 
(223, "Banda Aceh", "Brazil"), 
(224, "Bhalwal", "Nepal"), 
(225, "Bo", "India"), 
(226, "Beaumont", "Brazil"), 
(227, "Burbank", "United States"), 
(228, "Bayamo", "Canada"), 
(229, "Bahraich", "Tunisia"), 
(230, "Borama", "Brazil"), 
(231, "Benguela", "Somalia"), 
(232, "Baranagar", "Russia"), 
(233, "Bnei Brak", "United States"), 
(234, "Bintulu", "South Korea"), 
(235, "Beihai", "Philippines"), 
(236, "Barakaldo", "China"), 
(237, "Bhilwara", "Philippines"), 
(238, "Bruges", "Brazil"), 
(239, "Bhind", "United States"), 
(240, "Brazzaville", "Algeria"), 
(241, "Bobo-Dioulasso", "India"), 
(242, "Bangalore", "China"), 
(243, "Boa Vista", "Israel"), 
(244, "Budapest", "India"), 
(245, "Bansberia", "Gambia"), 
(246, "Burhanpur", "Burundi"), 
(247, "Brescia", "India"), 
(248, "Bojnord", "Egypt"), 
(249, "Baicheng", "United States"), 
(250, "Baqubah", "Iran"), 
(251, "Banjul", "Algeria"), 
(252, "Baybay", "Algeria"), 
(253, "Balashikha", "Brazil"), 
(254, "Bandar Seri Begawan", "India"), 
(255, "Belford Roxo", "Romania"), 
(256, "Béchar", "Iran"), 
(257, "Bratsk", "South Africa"), 
(258, "Batu", "India"), 
(259, "Bojnord", "Canada"), 
(260, "Benghazi", "Venezuela"), 
(261, "Bremen", "South Africa"), 
(262, "Bauru", "United Kingdom"), 
(263, "Belo Horizonte", "Malawi"), 
(264, "Batala", "Morocco"), 
(265, "Baku", "Venezuela"), 
(266, "Bekasi", "Ukraine"), 
(267, "Batman", "Spain"), 
(268, "Burhanpur", "Sierra Leone"), 
(269, "Bhadravati", "India"), 
(270, "Boise", "India"), 
(271, "Bhubaneswar", "India"), 
(272, "Barasat", "China"), 
(273, "Badalona", "Vietnam"), 
(274, "Bloemfontein", "Morocco"), 
(275, "Buenaventura", "Gambia"), 
(276, "Bhilai", "China"), 
(277, "Billings", "United States"), 
(278, "Burao", "India"), 
(279, "Beau-Bassin Rose-Hill", "Bosnia and Herzegovina"), 
(280, "Benito Juárez", "Brazil"), 
(281, "Burnaby", "Algeria"), 
(282, "Batangas City", "India"), 
(283, "Burari", "South Africa"), 
(284, "Balashikha", "India"), 
(285, "Bhusawal", "China"), 
(286, "Blagoveshchensk", "Brazil"), 
(287, "Bhadravati", "Romania"), 
(288, "Bhusawal", "India"), 
(289, "Beira", "Russia"), 
(290, "Banha", "Slovakia"), 
(291, "Berbera", "South Korea"), 
(292, "Bansberia", "Algeria"), 
(293, "Blitar", "Afghanistan"), 
(294, "Bratsk", "Iran"), 
(295, "Bhalwal", "India"), 
(296, "Bari", "Russia"), 
(297, "Buraidah", "India"), 
(298, "Bordj El Kiffan", "India"), 
(299, "Bouaké", "Russia")
;

SELECT DepartmentName, Street FROM Departments
INNER JOIN Location 
ON Departments.LocationID = Location.LocationID
WHERE Street LIKE 'Ngo Quyen';

SELECT Provice FROM Location
WHERE Street LIKE 'Ngo Quyen';


 CREATE TABLE Departments(
	DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(255) NULL,
    LocationID INT NULL,
	FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Location(
	LocationID INT PRIMARY KEY NOT NULL,
    Street VARCHAR(255) NULL,
    Province VARCHAR(255) NULL
);

CREATE TABLE City(
	CityID INT PRIMARY KEY NOT NULL,
    CityName VARCHAR(255) NULL,
    CapitalName VARCHAR(255) NULL
);

ALTER TABLE Location ADD CityID INT;
ALTER TABLE Location ADD FOREIGN KEY (CityID) REFERENCES City(CityID);

-- Cascade from parent to children
-- Can join not based on key
SELECT * FROM City 
INNER JOIN Location ON City.CityID = Location.CityID
INNER JOIN Departments ON Departments.LocationID = Location.LocationID;


SELECT * FROM Departments;

