CREATE DATABASE QuanLyDuocPham;
go

USE QuanLyDuocPham;
go

CREATE TABLE KhachHang (
    MaKH NCHAR(10) PRIMARY KEY,
    TenKH NVARCHAR(30) NOT NULL,
    DiaChi NVARCHAR(50),
    SDT VARCHAR(15)
);
go

CREATE TABLE NhanVien (
  MaNV NCHAR(10) PRIMARY KEY,
  TenNV NVARCHAR(30),
  DiaChi NVARCHAR(50),
  SDT varchar(15),
  ChucVu NVARCHAR(30)
);
go

CREATE TABLE DanhMucHang (
    MaDMH NCHAR(10) PRIMARY KEY,
    TenDMH VARCHAR(50) NOT NULL
);
go

CREATE TABLE MatHang (
    MaMH NCHAR(10) PRIMARY KEY,
    TenMH VARCHAR(30),
    DonViTinh VARCHAR(10),
    DonGia MONEY,
    SoLuongTon INT,
    MaDMH NCHAR(10),
    FOREIGN KEY (MaDMH) REFERENCES DanhMucHang(MaDMH)
);
go

CREATE TABLE KeToan (
  MaGG NCHAR(10) PRIMARY KEY,
  MaNV NCHAR(10),
  MaKH NCHAR(10),
   MaMH NCHAR(10),
  NgayGG DATE,
  Tongtien MONEY,
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
  FOREIGN KEY (MaMH) REFERENCES MatHang(MaMH)
);
go

INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT)
VALUES ('KH1', N'Nguyễn Văn A', N'123 Nguyễn Trãi, Quận 5, TP.HCM', '0123456789'),
('KH2', N'Trần Thi B', N'456 Lê Lợi, Quận 1, TP.HCM', '0987654321'),
('KH3', N'Phạm Văn C', N'789 Trần Hưng Đạo, Quận 5, TP.HCM', '0112233440'),
('KH4', N'Lê Thị D', N'567 Phan Văn Trị, Gò Vấp, TP.HCM', '0543219876'),
('KH5', N'Vũ Văn E', N'321 Tôn Thất Thuyết, Quận 4, TP.HCM', '0246813579');
go

INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, ChucVu)
VALUES ('NV1', N'Trần Văn X', N'12 Tô Ký, Quận 12, TP.HCM', '0111111111', N'Quản lý'),
('NV2', N'Nguyễn Thị Y', N'34 Nguyễn Chí Thanh, Quận 10, TP.HCM', '0222222222', N'Nhân viên'),
('NV3', N'Lê Văn Z', N'56 Lê Văn Sỹ, Quận Tân Bình, TP.HCM', '0333333333', N'Nhân viên'),
('NV4', N'Phạm Thị K',N'123 Ngô Gia Tự, Quận 10, TP.HCM', '0444444444', N'Kế Toán'),
('NV5', N'Võ Thị L', N'567 Phạm Văn Đồng, Gò Vấp, TP.HCM', '0555555555', N'Nhân viên');
go

INSERT INTO DanhMucHang (MaDMH, TenDMH)
VALUES ('1', N'Thuốc đau đầu'),
('2', N'Thuốc ho'),
('3', N'Thuốc hạ sốt'),
('4', N'Thuốc kháng sinh'),
('5', N'Thuốc tiêu hóa');
go

INSERT INTO MatHang (MaMH, TenMH, DonViTinh, DonGia, SoLuongTon, MaDMH)
VALUES ('MH1', 'Panadol', N'Viên', 20000, 1000, '1'),
('MH2', 'Siropex', N'Chai', 30000, 500, '2'),
('MH3', 'Ibuprofen',N'Viên', 25000, 800, '3'),
('MH4', 'Amoxicillin', N'Viên', 50000, 200, '4'),
('MH5', 'Imodium', N'Viên', 35000, 600, '5');
go

INSERT INTO KeToan (MaGG, MaNV, MaKH, MaMH, NgayGG, Tongtien)
VALUES ('GG1', 'NV1', 'KH1', 'MH1', '2023-04-01', 75000),
('GG2', 'NV2', 'KH2', 'MH2', '2023-04-02', 160000),
('GG3', 'NV3', 'KH3', 'MH3', '2023-04-03', 70000),
('GG4', 'NV4', 'KH4', 'MH4', '2023-04-04', 60000),
('GG5', 'NV5', 'KH5', 'MH5', '2023-04-04', 48000);
go