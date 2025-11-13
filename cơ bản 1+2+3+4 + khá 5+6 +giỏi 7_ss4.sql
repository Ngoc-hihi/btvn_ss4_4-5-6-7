 -- Bài 1
 create database CompanyDB;
 use CompanyDB;
 CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
-- Bài 2
ALTER TABLE Employees
ADD COLUMN HireDate DATE;
ALTER TABLE Employees
ADD COLUMN Salary INT;
-- Bài 3
INSERT INTO Employees (FirstName, LastName, HireDate, Salary)
VALUES 
('Nguyen', 'An', '2022-05-10', 15000000),
('Tran', 'Binh', '2023-03-22', 18000000),
('David Le', 'Chi', '2024-01-15', 20000000);
-- Bài 4
UPDATE Employees
SET Salary = 4800
WHERE EmployeeID = 2;
UPDATE Employees
SET HireDate = '2021-08-01'
WHERE FirstName = 'David';
-- Bài 5
DELETE FROM Employees
WHERE EmployeeID = 1;
DELETE FROM Employees
WHERE Salary < 5000;
-- Bài 6
-- 1.Hiển thị toàn bộ nhân viên
SELECT *
FROM Employees;
-- 2.Hiển thị nhân viên có lương > 5000
SELECT * 
FROM Employees
WHERE Salary > 5000;
-- 3. Hiển thị nhân viên theo ngày tuyển dụng (mới nhất trước)
SELECT * 
FROM Employees
ORDER BY HireDate DESC;
-- Bài 7
ALTER TABLE Employees
ADD COLUMN Department VARCHAR(50);
UPDATE Employees SET Department = 'Kế toán' WHERE EmployeeID = 2;
UPDATE Employees SET Department = 'Nhân sự' WHERE EmployeeID = 3;
-- Thêm vài nhân viên để thấy rõ kết quả thống kê
INSERT INTO Employees (FirstName, LastName, HireDate, Salary, Department)
VALUES 
('Pham', 'Dung', '2023-11-10', 7000, 'Kinh doanh'),
('Do', 'Hoa', '2024-02-14', 5500, 'Kế toán'),
('Vo', 'Minh', '2022-09-01', 4800, 'Nhân sự');
-- Hiển thị tên bộ phận và số lượng nhân viên trong mỗi bộ phận
SELECT Department, COUNT(*) AS SoLuongNhanVien
FROM Employees
GROUP BY Department;
-- Hiển thị tên bộ phận và lương trung bình
SELECT Department, AVG(Salary) AS LuongTrungBinh
FROM Employees
GROUP BY Department
-- Chỉ hiển thị các bộ phận có lương trung bình > 5000
SELECT Department, AVG(Salary) AS LuongTrungBinh
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 5000;
