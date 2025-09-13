-- ===========================================================
-- Hotel Information System
-- Author: Aqbil Gradiansyah
-- File: insert_data.sql
-- Description: Inserts sample data into the core tables
--              for testing and demonstration purposes.
-- Tables Covered:
-- 1. tb_pelanggan          - Customer master data
-- 2. tb_kamar              - Hotel room inventory
-- 3. tb_transaksi          - Booking transactions
-- 4. tb_detail_transaksi   - Detailed booking items
-- ===========================================================


-- ===========================================================
-- 1. Insert Customer Data (tb_pelanggan)
-- Each customer has a unique ID and contact information.
-- Format for id_pelanggan: PG-YYYY-NNN
-- ===========================================================
INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telp) VALUES
('PG-2502-001', 'Joko Prasetyo', 'Jl. Merdeka No.10, Jakarta', '081234567890');

INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telp) VALUES
('PG-2502-002', 'Rina Amelia Putri', 'Jl. Sudirman No.25, Bandung', '085798765432');

INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telp) VALUES
('PG-2502-003', 'Budi Santoso', 'Jl. Diponegoro No.18, Surabaya', '082145678901');

INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telp) VALUES
('PG-2502-004', 'Siti Aisyah Zahra', 'Jl. Kartini No.7, Yogyakarta', '081323456789');

INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, alamat, no_telp) VALUES
('PG-2502-005', 'Andi Wirawan', 'Jl. Gajah Mada No.30, Medan', '087865432109');

-- ===========================================================
-- 2. Insert Hotel Room Data (tb_kamar)
-- This table defines available rooms, types, and prices per night.
-- Room types can be expanded as needed.
-- ===========================================================
INSERT INTO tb_kamar (no_kamar, tipe_kamar, harga) VALUES (1, 'Deluxe', 250000);
INSERT INTO tb_kamar (no_kamar, tipe_kamar, harga) VALUES (2, 'Executive', 300000);
INSERT INTO tb_kamar (no_kamar, tipe_kamar, harga) VALUES (3, 'Family', 350000);
INSERT INTO tb_kamar (no_kamar, tipe_kamar, harga) VALUES (4, 'Special', 400000);

-- ===========================================================
-- 3. Insert Booking Transactions (tb_transaksi)
-- Represents a booking made by a customer.
-- no_transaksi format: RSV-[RoomTypeCode]-[Date]-[Sequence]
-- ===========================================================
INSERT INTO tb_transaksi (no_transaksi, total_harga, id_pelanggan) VALUES
('RSV-D04-2502-001', 250000, 'PG-2502-001');

INSERT INTO tb_transaksi (no_transaksi, total_harga, id_pelanggan) VALUES
('RSV-E03-2502-002', 300000, 'PG-2502-002');

INSERT INTO tb_transaksi (no_transaksi, total_harga, id_pelanggan) VALUES
('RSV-F02-2502-003', 350000, 'PG-2502-003');

INSERT INTO tb_transaksi (no_transaksi, total_harga, id_pelanggan) VALUES
('RSV-S01-2502-004', 400000, 'PG-2502-004');

INSERT INTO tb_transaksi (no_transaksi, total_harga, id_pelanggan) VALUES
('RSV-D04-2502-005', 500000, 'PG-2502-005');

-- ===========================================================
-- 4. Insert Detailed Booking Data (tb_detail_transaksi)
-- Records each individual room booked within a transaction.
-- Allows tracking of multiple rooms or extra services per booking.
-- ===========================================================
INSERT INTO tb_detail_transaksi 
(no_detail, item, detail_item, harga, tgl_checkin, tgl_checkout, no_transaksi, no_kamar)
VALUES 
('DTL-RSV-2502-001', 'Deluxe', 1, 250000, 
TO_DATE('15/02/2025', 'DD/MM/YYYY'), TO_DATE('16/02/2025', 'DD/MM/YYYY'),
'RSV-D04-2502-001', 1);

INSERT INTO tb_detail_transaksi 
(no_detail, item, detail_item, harga, tgl_checkin, tgl_checkout, no_transaksi, no_kamar)
VALUES 
('DTL-RSV-2502-002', 'Executive', 1, 300000, 
TO_DATE('15/02/2025', 'DD/MM/YYYY'), TO_DATE('17/02/2025', 'DD/MM/YYYY'),
'RSV-E03-2502-002', 2);

INSERT INTO tb_detail_transaksi 
(no_detail, item, detail_item, harga, tgl_checkin, tgl_checkout, no_transaksi, no_kamar)
VALUES 
('DTL-RSV-2502-003', 'Family', 1, 350000, 
TO_DATE('16/02/2025', 'DD/MM/YYYY'), TO_DATE('18/02/2025', 'DD/MM/YYYY'),
'RSV-F02-2502-003', 3);

INSERT INTO tb_detail_transaksi 
(no_detail, item, detail_item, harga, tgl_checkin, tgl_checkout, no_transaksi, no_kamar)
VALUES 
('DTL-RSV-2502-004', 'Special', 1, 400000, 
TO_DATE('16/02/2025', 'DD/MM/YYYY'), TO_DATE('17/02/2025', 'DD/MM/YYYY'),
'RSV-S01-2502-004', 4);

INSERT INTO tb_detail_transaksi 
(no_detail, item, detail_item, harga, tgl_checkin, tgl_checkout, no_transaksi, no_kamar)
VALUES 
('DTL-RSV-2502-005', 'Deluxe', 2, 500000, 
TO_DATE('15/02/2025', 'DD/MM/YYYY'), TO_DATE('17/02/2025', 'DD/MM/YYYY'),
'RSV-D04-2502-005', 1);
