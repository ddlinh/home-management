USE QuanLyNha
GO

ALTER TABLE ChiTiet_XemNha
  ADD MaNV int;

INSERT INTO ChiTiet_XemNha(Ma_KH, Ma_Nha,Ngay, MaNV) VALUES (3, 5, '06-08-2021', 4)