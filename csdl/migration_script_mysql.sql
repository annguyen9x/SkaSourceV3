-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: dbo
-- Source Schemata: dbo
-- Created: Mon Feb 24 22:08:38 2020
-- Workbench Version: 8.0.19
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema dbo
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `dbo` ;
CREATE SCHEMA IF NOT EXISTS `dbo` ;

-- ----------------------------------------------------------------------------
-- Table dbo.KhachHang
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`KhachHang` (
  `MaKH` INT NOT NULL,
  `TenKH` VARCHAR(30) CHARACTER SET 'utf8mb4' NOT NULL,
  `MatKhau` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(30) NOT NULL,
  `DienThoai` VARCHAR(10) NOT NULL,
  `GioiTinh` VARCHAR(10) CHARACTER SET 'utf8mb4' NOT NULL,
  `NgaySinh` DATE NOT NULL,
  `DiaChi` VARCHAR(100) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`MaKH`),
  UNIQUE INDEX `UQ__KhachHan__1F0318762F4AE563` (`DienThoai` ASC),
  UNIQUE INDEX `UQ__KhachHan__A9D10534F73F748B` (`Email` ASC));

-- ----------------------------------------------------------------------------
-- Table dbo.NhanVien
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`NhanVien` (
  `MaNV` INT NOT NULL,
  `TenNV` VARCHAR(30) CHARACTER SET 'utf8mb4' NOT NULL,
  `ChucVu` VARCHAR(30) CHARACTER SET 'utf8mb4' NOT NULL,
  `MatKhau` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(30) NOT NULL,
  `DienThoai` VARCHAR(10) NOT NULL,
  `GioiTinh` VARCHAR(10) CHARACTER SET 'utf8mb4' NOT NULL,
  `NgaySinh` DATE NOT NULL,
  `DiaChi` VARCHAR(100) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`MaNV`),
  UNIQUE INDEX `UQ__NhanVien__1F0318769AFB27F6` (`DienThoai` ASC),
  UNIQUE INDEX `UQ__NhanVien__A9D10534A1AEC144` (`Email` ASC));

-- ----------------------------------------------------------------------------
-- Table dbo.LoaiSach
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`LoaiSach` (
  `MaLoaiSach` VARCHAR(4) NOT NULL,
  `TenLoaiSach` VARCHAR(100) CHARACTER SET 'utf8mb4' NOT NULL,
  PRIMARY KEY (`MaLoaiSach`));

-- ----------------------------------------------------------------------------
-- Table dbo.Sach
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Sach` (
  `MaSach` VARCHAR(6) NOT NULL,
  `TenSach` VARCHAR(100) CHARACTER SET 'utf8mb4' NOT NULL,
  `DonGia` DECIMAL(18,2) NULL,
  `SoLuong` INT NOT NULL,
  `UrlHinh` VARCHAR(100) NULL,
  `NoiDung` VARCHAR(4000) CHARACTER SET 'utf8mb4' NULL,
  `TacGia` VARCHAR(100) CHARACTER SET 'utf8mb4' NOT NULL,
  `NamXB` INT NOT NULL,
  `NXB` VARCHAR(100) CHARACTER SET 'utf8mb4' NOT NULL,
  `MaLoaiSach` VARCHAR(4) NULL,
  PRIMARY KEY (`MaSach`),
  INDEX `idx_sach` (`MaSach` ASC, `TenSach` ASC),
  CONSTRAINT `FK__Sach__MaLoaiSach__1BFD2C07`
    FOREIGN KEY (`MaLoaiSach`)
    REFERENCES `dbo`.`LoaiSach` (`MaLoaiSach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.NhapSach
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`NhapSach` (
  `MaNS` VARCHAR(6) NOT NULL,
  `MaNVKho` INT NULL,
  `MaSach` VARCHAR(6) NULL,
  `SoLuongNhap` INT NULL,
  `NgayNhap` DATE NULL,
  PRIMARY KEY (`MaNS`),
  CONSTRAINT `FK__NhapSach__MaNVKh__1ED998B2`
    FOREIGN KEY (`MaNVKho`)
    REFERENCES `dbo`.`NhanVien` (`MaNV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__NhapSach__MaSach__1FCDBCEB`
    FOREIGN KEY (`MaSach`)
    REFERENCES `dbo`.`Sach` (`MaSach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.HoaDon
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`HoaDon` (
  `SoHD` INT NOT NULL,
  `ThayDoiNN` VARCHAR(6) NULL,
  `TongTien` DECIMAL(18,2) NULL DEFAULT 0,
  `NgayDat` DATE NULL,
  `NgayGiao` DATE NULL,
  `TinhTrangDH` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `MaNVGiao` INT NULL,
  `MaKH` INT NULL,
  PRIMARY KEY (`SoHD`),
  CONSTRAINT `FK__HoaDon__MaNVGiao__239E4DCF`
    FOREIGN KEY (`MaNVGiao`)
    REFERENCES `dbo`.`NhanVien` (`MaNV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__HoaDon__MaKH__24927208`
    FOREIGN KEY (`MaKH`)
    REFERENCES `dbo`.`KhachHang` (`MaKH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.ChiTietHoaDon
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`ChiTietHoaDon` (
  `SoHD` INT NOT NULL,
  `MaSach` VARCHAR(6) NOT NULL,
  `SoLuong` INT NOT NULL,
  `DonGia` BIGINT NULL,
  PRIMARY KEY (`SoHD`, `MaSach`),
  CONSTRAINT `FK__ChiTietHoa__SoHD__276EDEB3`
    FOREIGN KEY (`SoHD`)
    REFERENCES `dbo`.`HoaDon` (`SoHD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__ChiTietHo__MaSac__286302EC`
    FOREIGN KEY (`MaSach`)
    REFERENCES `dbo`.`Sach` (`MaSach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.NguoiNhanHang
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`NguoiNhanHang` (
  `SoHD` INT NOT NULL,
  `TenNN` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `DienThoai` VARCHAR(10) NULL,
  `DiaChi` VARCHAR(100) CHARACTER SET 'utf8mb4' NULL,
  PRIMARY KEY (`SoHD`),
  CONSTRAINT `FK__NguoiNhanH__SoHD__2B3F6F97`
    FOREIGN KEY (`SoHD`)
    REFERENCES `dbo`.`HoaDon` (`SoHD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- View dbo.thanhTien
-- ----------------------------------------------------------------------------
-- USE `dbo`;
-- 
-- Create  OR REPLACE Function thanhTien(@soHD int, @maSach varchar(6))
-- Returns decimal(18,2)
-- As
-- 	Begin
-- 		Declare @thanhTien decimal(18,2)
-- 		Select @thanhTien = (SoLuong*DonGia) From dbo.ChiTietHoaDon Where SoHD = @soHD And MaSach = @maSach
-- 		Return @thanhTien
-- 	End
-- ;

-- ----------------------------------------------------------------------------
-- View dbo.tongTien
-- ----------------------------------------------------------------------------
-- USE `dbo`;
-- 
-- 
-- Create  OR REPLACE Trigger tongTien on ChiTietHoaDon For Insert
-- As
-- 	Begin
-- 		Declare @soHD int, @maSach varchar(6)
-- 		Select  @soHD = SoHD From inserted
-- 		Select  @maSach= MaSach From inserted
-- 		Update dbo.HoaDon Set TongTien = TongTien + dbo.thanhTien( @soHD,@maSach)
-- 		Where SoHD = @soHD
-- 	End
-- ;

-- ----------------------------------------------------------------------------
-- Routine dbo.thanhTien
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- 
-- DELIMITER $$
-- USE `dbo`$$
-- 
-- Create Function thanhTien(@soHD int, @maSach varchar(6))
-- Returns decimal(18,2)
-- As
-- 	Begin
-- 		Declare @thanhTien decimal(18,2)
-- 		Select @thanhTien = (SoLuong*DonGia) From dbo.ChiTietHoaDon Where SoHD = @soHD And MaSach = @maSach
-- 		Return @thanhTien
-- 	End
-- $$
-- 
-- DELIMITER ;
-- 
-- ----------------------------------------------------------------------------
-- Trigger dbo.tongTien
-- ----------------------------------------------------------------------------
-- DELIMITER $$
-- USE `dbo`$$
-- 
-- 
-- Create Trigger tongTien on ChiTietHoaDon For Insert
-- As
-- 	Begin
-- 		Declare @soHD int, @maSach varchar(6)
-- 		Select  @soHD = SoHD From inserted
-- 		Select  @maSach= MaSach From inserted
-- 		Update dbo.HoaDon Set TongTien = TongTien + dbo.thanhTien( @soHD,@maSach)
-- 		Where SoHD = @soHD
-- 	End
-- ;
SET FOREIGN_KEY_CHECKS = 1;
