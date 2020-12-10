SELECT * FROM product;
-- 1 - Tạo một database mới có tên LearningSql 
-- 2 - Tạo một table có tên là Product với 4 field: productID (Int), Name (Varchar), Color (varchar), Price (int)
-- 3 - Insert 10 records vào bảng Product (Khi insert dữ liệu Phải có dữ liệu Null, và Price nằm trong khoảng 3000 - 25000)
-- Tim cach insert 10 records = 1 cau lenh
-- 4 - Lấy ra tất cả những records có Price > 0 
-- 5 - Lấy ra ProductID, Name của những records có Color là Null
-- 6 - Lấy ra tất cả những records có Prices > 0 và Color không phải Null
-- 7 - Lấy ra name và price của những records có Name bắt đầu bởi chữ N và sắp xếp dữ liệu theo thứ tự abc
-- 8 - Lấy ra tất cả những records mà có price trong khoảng 5000 - 15000
-- 9 - Sử dụng hàm Max lấy ra giá cao nhất của  cột Price 
-- 10 - Sử dụng hàm Min lấy ra giá thấp nhất của cột Price 
-- 11 - Sử dụng Avg để tính trung bình giá các sản phẩm có Color là Pink và Red
-- Lay ra name cua cac product ma co color trong nhung mau sau day RED, BLUE, BROWN, ORANGE, PURPLE
SELECT Name FROM Product WHERE color IN('RED', 'BLUE', 'BROWN', 'ORANGE', 'PURPLE');
CREATE DATABASE LearningSql;
CREATE TABLE Product(productID INT, Name Varchar(255), Color Varchar(255), Price INT);
INSERT INTO Product(productID, Name, Color, Price) VALUES (1, 'A', 'GREEN', 3000);
SELECT * FROM Product WHERE Price > 0;
SELECT ProductID, `Name` FROM Product WHERE Color IS NULL;
SELECT * FROM Product WHERE Price > 0 AND Color IS NOT NULL;
SELECT Name, Price FROM Product  WHERE Name LIKE 'N%' ORDER BY Name ASC;
-- Dung LIKE instead of left : _ (single), % (multiple)
-- Elastic search
SELECT * FROM Product WHERE Price BETWEEN 5000 AND 15000;
UPDATE Product SET Price = 5000 WHERE productID = 2;


-- Use Between
SELECT MAX(Price) FROM Product;
SELECT MIN(Price) FROM Product;
SELECT AVG(Price) FROM Product WHERE COLOR = 'PINK' OR COLOR = 'RED';
-- Or
SELECT "SQL";

-- ResultSet - Tao 10 cau lenh trong 1 cau 
-- Join: INNER, LEFT, RIGHT, FULL, CROSS, SELF
-- INNER: 
SELECT * FROM Product;
ALTER TABLE Product ADD OrderID INT;
