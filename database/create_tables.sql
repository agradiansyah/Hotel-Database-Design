-- ===========================================================
-- Hotel Information System Database Schema
-- Author: Aqbil Gradiansyah
-- Description: This script creates the core database tables 
--              for managing hotel operations including 
--              customers, rooms, bookings, and transactions.
-- ===========================================================


-- Table 1: Customers
-- Stores guest information including ID, name, address, and phone number.
Create table tb_pelanggan
(
id_pelanggan varchar2 (11) primary key,-- Unique customer ID, format: PG-XXXX-YYY
nama_pelanggan varchar2 (50) NOT NULL, -- Customer full name
alamat VARCHAR2 (100) NOT NULL, -- Address of the customer
no_telp VARCHAR2 (15) NOT NULL -- Customer's Phone Number
);

-- Table 2: Hotel Rooms
-- Tracks available rooms, their type, and price per night.
Create tabel tb_kamar
(
no_kamar INTEGER primary key, -- Unique room number
tipe_kamar VARCHAR2 (50) NOT NULL, -- Room type (e.g., Deluxe, Executive)
harga DECIMAL NOT NULL -- Price per night
);

-- Table 3: Transactions
-- Records each booking transaction linked to a customer.
create table tb_transaksi
(
no_transaksi VARCHAR2 (20) primary key, -- Unique transaction ID, format: RSV-XXXX
total_harga DECIMAL NOT NULL, -- Total price of the booking
id_pelanggan CONSTRAINT fk_pelanggan REFERENCES
tb_pelanggan(id_pelanggan)
);

-- Table 4: Transaction Details
-- Stores detailed information for each room booked in a transaction.
create table tb_detail_transaksi
(
no_detail INTEGER primary key, -- Unique detail ID
item VARCHAR2 (20) NOT NULL, -- Room type or extra service
detail_item INTEGER DEFAULT 1 NOT NULL, -- Number of units booked (default = 1)
harga DECIMAL NOT NULL, -- Price per unit
tgl_checkin DATE NOT NULL, -- Check-in date
tgl_checkout DATE NOT NULL, -- Check-out date
no_transaksi CONSTRAINT fk_transaksi REFERENCES tb_transaksi, -- Links to transaction
no_kamar CONSTRAINT fk_no_kamar REFERENCES tb_kamar  -- Links to room
);
