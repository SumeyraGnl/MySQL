
/* ====================================== UPDATE ========================================

Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.

-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;
UPDATE islemlerinin yapilabilmesi icin Ayarlar -> SQL Editor -> "Safe Updates" check box'indaki
tik isaretini kaldirip kaydetmemiz gerekiyor, sonrasinda MySQL'i kapatip tekrar acmaliyiz
========================================================================================*/


/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
---------------------------------------------------------------------------------------*/
CREATE TABLE firmalar
(
id INT,
isim VARCHAR(10),
iletisim_isim VARCHAR(15)
);
/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/
INSERT INTO firmalar VALUES 
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez');

SELECT*FROM firmalar;

-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz.


UPDATE firmalar
SET isim='KRM'
WHERE id=3;

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.

-- ****************** 1.Yöntem ************** 

UPDATE firmalar
SET id=4
WHERE iletisim_isim='Veli Gül';

UPDATE firmalar
SET isim='FDS'
WHERE iletisim_isim='Veli Gül';

-- ****************** 2.Yöntem ************** 

UPDATE firmalar
SET id=4 , isim='FDS'
WHERE iletisim_isim='Veli Gül';

-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.

UPDATE firmalar
SET iletisim_isim='Osman Can'
WHERE isim='ACB';

-- Iletisim ismi 'Osman Can' olan firmanin iletisim ismini 'Ayse Can' olarak guncelleyiniz.

UPDATE firmalar
SET iletisim_isim='Ayse Can'
WHERE iletisim_isim='Osman Can';






