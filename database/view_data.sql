-- ===========================================================
-- Hotel Information System
-- Author: Aqbil Gradiansyah
-- File: create_view.sql
-- Description: Creates a view to combine transactions, customers, 
--              and room details into one summarized table for reporting.
-- ===========================================================

-- ===========================================================
-- View Name: view_total_transaksi
-- Purpose:
-- 1. Simplifies reporting by joining multiple tables into a single view
-- 2. Shows booking details such as:
--    - Transaction ID
--    - Customer name
--    - Room type
--    - Number of rooms booked
--    - Price per room
--    - Total price for that booking
-- ===========================================================

CREATE OR REPLACE VIEW view_total_transaksi AS
SELECT
    t.no_transaksi,                  -- Unique booking transaction ID
    p.nama_pelanggan,                -- Name of the customer
    d.item,                           -- Room type or service booked
    d.detail_item,                     -- Number of rooms or services booked
    k.harga AS harga_per_malam,        -- Price per night or per unit
    (d.detail_item * k.harga) AS total_harga -- Total calculated price
FROM tb_transaksi t
JOIN tb_detail_transaksi d ON t.no_transaksi = d.no_transaksi   -- Link transaction with details
JOIN tb_kamar k ON d.no_kamar = k.no_kamar                      -- Link room details
JOIN tb_pelanggan p ON t.id_pelanggan = p.id_pelanggan;         -- Link customer details

-- ===========================================================
-- Usage:
-- SELECT * FROM view_total_transaksi;
--
-- This will return a flat table showing:
-- no_transaksi | nama_pelanggan | item | detail_item | harga_per_malam | total_harga
-- ===========================================================
