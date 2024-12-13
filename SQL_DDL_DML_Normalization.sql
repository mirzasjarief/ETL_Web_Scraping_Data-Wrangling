-- This query is used to create a new database
CREATE DATABASE produk_ponsel;

-- This query is used to create a table (Main Table)
CREATE TABLE Table_Utama ( -- Query to create the table name
	Id SERIAL PRIMARY KEY, -- Query to create an auto-increment column, or create an ID column containing numeric data that automatically increments according to the number of rows
   	Nama_Produk TEXT, -- Filling the Nama_Produk column with data type TEXT (since it contains string data)
    Harga INTEGER, -- Filling the Harga column with data type INTEGER (since it contains numeric/INT data)
    Total_Terjual INTEGER, -- Filling the Total_Terjual column with data type INTEGER (since it contains numeric/INT data)
    Rating FLOAT, -- Filling the Rating column with data type FLOAT (since it contains decimal data)
    Nama_Toko TEXT, -- Filling the Nama_Toko column with data type TEXT (since it contains string data)
    Kota_Toko TEXT -- Filling the Kota_Toko column with data type TEXT (since it contains string data)
);

-- This query is used to copy data into Table_Utama from a DataFrame in CSV format (coda_P0M1_Mirza_Sjarief.csv)
COPY Table_Utama (Nama_Produk, Harga, Total_Terjual, Rating, Nama_Toko,  Kota_Toko)
FROM '/Users/mac/Documents/Hacktiv8/tmp/coda_P0M1_Mirza_Sjarief.csv' DELIMITER ',' CSV HEADER;

-- The following query displays all data from the columns and rows of Table_Utama
SELECT *
FROM Table_Utama;

-- This query is used to create a table (Product Table)
CREATE TABLE Table_Produk( -- Query to create the table name
	Id INTEGER PRIMARY KEY, -- Query to create an auto-increment column, or create an ID column containing numeric data that automatically increments according to the number of rows
   	Nama_Produk TEXT,  -- Filling the Nama_Produk column with data type TEXT (since it contains string data)
    Harga INTEGER,  -- Filling the Harga column with data type INTEGER (since it contains numeric/INT data)
	Total_Terjual INTEGER, -- Filling the Total_Terjual column with data type INTEGER (since it contains numeric/INT data)
    Rating FLOAT, -- Filling the Rating column with data type FLOAT (since it contains decimal data)
	Toko_id INTEGER REFERENCES Table_Toko(id), -- Query to make the ID in Table_Toko a FOREIGN KEY
	Kota_id INTEGER REFERENCES Table_Kota(id)  -- Query to make the ID in Table_Kota a FOREIGN KEY
);

-- This query is used to insert data into Table_Produk
INSERT INTO Table_Produk (Id, Nama_Produk, Harga, Total_Terjual, Rating, Toko_id, Kota_id) -- Inserting data into Table_Produk
	SELECT u.id, u.Nama_Produk, u.Harga, u.Total_terjual, u.Rating, t.id, k.id -- Filling the columns in Table_Produk
	FROM Table_Utama as u -- From Table_Utama
	JOIN Table_Toko as t ON t.nama_toko = u.nama_toko -- Function to join the nama_toko column in Table_Toko with the column in Table_Utama
	JOIN Table_Kota as k ON k.nama_kota = u.kota_toko; -- Function to join the nama_kota column in Table_Kota with the column in Table_Utama

-- The following query displays all data from the columns and rows of Table_Produk
SELECT *
FROM Table_Produk;

-- This query is used to create a table (Store Table)
CREATE TABLE Table_Toko ( -- Create a table named Table_Toko
    id SERIAL PRIMARY KEY, -- Query to create an auto-increment column, or create an ID column containing numeric data that automatically increments according to the number of rows
    Nama_Toko TEXT -- Filling the Nama_Toko column with data type TEXT (since it contains string data)
);

-- This query is used to insert data into Table_Toko
INSERT INTO Table_Toko (Nama_Toko) -- Insert data into the Table_Toko column (Nama_Toko)
	SELECT DISTINCT (Nama_Toko) -- Fill the nama_toko column using the DISTINCT command to sort unique data
	FROM Table_Utama; -- Taken from Table_Utama

-- The following query displays all data from the columns and rows of Table_Toko
SELECT *
FROM Table_Toko;

-- This query is used to create a table (City Table)
CREATE TABLE Table_Kota( -- Create a table named Table_Kota
	Id SERIAL PRIMARY KEY, -- Query to create an auto-increment column, or create an ID column containing numeric data that automatically increments according to the number of rows
    Nama_Kota TEXT -- Filling the Nama_Kota column with data type TEXT (since it contains string data)
);

-- This query is used to insert data into Table_Kota
INSERT INTO Table_Kota (Nama_Kota) -- Insert data into the Table_Kota column (Nama_Kota)
	SELECT DISTINCT (Kota_Toko) -- Fill the Kota_Toko column using the DISTINCT command to sort unique data
	FROM Table_Utama; -- Taken from Table_Utama

-- The following query displays all data from the columns and rows of Table_Kota
SELECT *
FROM Table_Kota;