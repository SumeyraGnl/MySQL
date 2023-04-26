​
/*-------------------------------------------------------------------------
1) Cocuklar tablosu olusturun.
 Icinde id,isim,veli_isim ve grade field'lari olsun. 
 Id field'i Primary Key olsun.
 --------------------------------------------------------------------------*/
​
CREATE TABLE lise(
id INT,
isim VARCHAR(20),
veli_isim VARCHAR(10),
grade DOUBLE,
CONSTRAINT id_pk PRIMARY KEY (id)
);
​
/*-------------------------------------------------------------------------
 2)  Kayitlari tabloya ekleyin.
 (123, 'Ali Can', 'Hasan',75), 
 (124, 'Merve Gul', 'Ayse',85), 
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85);
 (127, 'Oguz Karaca', 'Tuncay',85);
 (128, 'Resul Can', 'Tugay',85);
 (129, 'Tugay Kala', 'Osman',45);
 --------------------------------------------------------------------------*/
 
INSERT INTO lise VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO lise VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO lise VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO lise VALUES(126, 'Rumeysa Aydin', 'Zeynep',85);
INSERT INTO lise VALUES(127, 'Oguz Karaca', 'Tuncay',85);
INSERT INTO lise VALUES(128, 'Resul Can', 'Tugay',85);
INSERT INTO lise VALUES(129, 'Tugay Kala', 'Osman',45);
​
/*-------------------------------------------------------------------------
3)deneme_puani tablosu olusturun. 
ogrenci_id, ders_adi, yazili_notu field'lari olsun, 
ogrenci_id field'i Foreign Key olsun 
--------------------------------------------------------------------------*/
​
CREATE TABLE deneme_puani(
ogrenci_id INT,
ders_adi VARCHAR(10),
yazili_notu DOUBLE,
CONSTRAINT deneme_puani_fk 
FOREIGN KEY (ogrenci_id) 
REFERENCES lise (id)
);
​
/*-------------------------------------------------------------------------
4) deneme_puani tablosuna kayitlari ekleyin
 ('123','kimya',75), 
 ('124','fizik',65),
 ('125','tarih',90),
 ('126','kimya',87),
 ('127','tarih',69),
 ('128','kimya',93),
 ('129','fizik',25)
--------------------------------------------------------------------------*/
​
INSERT INTO deneme_puani VALUES ('123','kimya',75); 
INSERT INTO deneme_puani VALUES ('124','fizik',65); 
INSERT INTO deneme_puani VALUES ('125','tarih',90); 
INSERT INTO deneme_puani VALUES ('126','kimya',87); 
INSERT INTO deneme_puani VALUES ('127','tarih',69); 
INSERT INTO deneme_puani VALUES ('128','kimya',93); 
INSERT INTO deneme_puani VALUES ('129','fizik',25);
​
/*-------------------------------------------------------------------------
1) Ismi Resul Can olan ogrencinin notunu notlar tablosundaki 
ogrenci id'si 129 olan yazili notu ile update edin. 
--------------------------------------------------------------------------*/
​
/*-------------------------------------------------------------------------
2) Ders adi fizik olan kayitlarin yazili notunu Oguz Karaca'nin grade'i
ile update edin. 
--------------------------------------------------------------------------*/
​
/*-------------------------------------------------------------------------
3) Ali Can'in grade'ini, 124 ogrenci_id'li yazili_notu ile guncelleyin.
--------------------------------------------------------------------------*/
​
/*-------------------------------------------------------------------------
4) Ders adi Kimya olan yazili notlarini Rumeysa Aydin'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
​
/*-------------------------------------------------------------------------
5) Ders adi tarih olan yazili notlarini Resul Can'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
​
/*-------------------------------------------------------------------------
6) Ders adi fizik olan yazili notlarini veli adi Tuncay olan 
grade ile guncelleyin.
--------------------------------------------------------------------------*/
​