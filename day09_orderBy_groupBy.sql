
/* ======================== IS NULL CONDITION ===========================
    Arama yapilan field'da NULL degeri almis kayitlari getirir.
======================================================================*/

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar;

-- Ismi null olan kayitlari listeleyin

SELECT *
FROM insanlar
WHERE isim IS NULL;

-- Ismi null olan kayitlari 'Isimsiz' olarak guncelleyin

UPDATE insanlar
SET isim = 'Isimsiz'
WHERE isim IS NULL;

-- Ismi null olan kaytlar silin

DELETE FROM insanlar
WHERE isim IS NULL;


/* ======================== ORDER BY ===========================
=> ORDER BY komutu belli bir field'a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir.
=> ORDER BY komutu sadece SELECT komutu ile kullanilir.
=> ORDER BY komutuna ozel olarak, siralama yapacagimiz field ismi yerine 
field sirasini da yazabiliriz.
=> Isimleri natural order'a gore siralamak icin sorgunun sonuna 
 ORDER BY (field_name) yazmak yeterlidir.
=> Isimleri ters siralama ile yazdirmak isterseniz DESC yaziyoruz.
=> Ayni degerde olan kayitlari, tablodaki kayit sirasina gore getirir.
==============================================================*/

CREATE TABLE insanciklar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);

INSERT INTO insanciklar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanciklar VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanciklar VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanciklar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanciklar VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanciklar VALUES (345678901, 'Ali','Yilmaz', 'Istanbul');

SELECT * FROM insanciklar;

-- Soru 1: Insanciklar tablosundaki datalari adres'e gore siralayin :

SELECT *
FROM insanciklar
ORDER BY adres;

SELECT *
FROM insanciklar
ORDER BY 4;

-- Soru 2: Isim' i Mine olanlari soyisim sirali olarak listeleyen Query yaziniz.

SELECT *
FROM insanciklar
WHERE isim='Mine'
ORDER BY soyisim;

-- Soru 3: Insanciklar tablosundaki soyismi BULUT olanlari isim sirali olarak listeleyin.

SELECT *
FROM insanciklar
WHERE soyisim='Bulut'
ORDER BY isim;

-- Soru 4: Insanciklar tablosundaki tum kayitlari SSN numarasina gore siralayin.

SELECT *
FROM insanciklar
ORDER BY ssn;

-- Soru 4: Insanciklar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin.

SELECT *
FROM insanciklar
ORDER BY ssn DESC;

-- Soru 6: Insanciklar tablosundaki tum kayitlari Soyisimler ters sirali, 
-- isimler Natural sirali olarak listeleyin.

SELECT *
FROM insanciklar
ORDER BY soyisim DESC,isim;

-- Soru 7: Insanciklar tablosundaki tum kayitlari adresler ters sirali,
-- isimler ters sirali olarak listeleyin.

SELECT *
FROM insanciklar
ORDER BY adres DESC,isim DESC;

-- Soru 8: Insanciklar tablosundaki tum kayitlari adresler ters sirali,
-- isimler ters sirali, soyisimler ters sirali olarak listeleyin.

SELECT *
FROM insanciklar
ORDER BY adres DESC,isim DESC,soyisim DESC;

/* ======================== ALIASES ===========================
   Aliases kodu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir.
===============================================================*/
CREATE TABLE employees
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50)
);

INSERT INTO employees VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM employees;

SELECT employee_id AS id, employee_name AS name, employee_birth_city AS city
FROM  employees;

/* ======================== GROUP BY CLAUSE ===========================
   Group By komutu sonuclari bir veya daha fazla sutuna gore
   gruplamak icin SELECT komutuyla birlikte kullanilir.
   
   GROUP BY komutu her grup basina bir satir dondurur.
   
   GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir.
======================================================================*/ 

CREATE TABLE manav (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', null, 2);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav VALUES( 'Ayse', null, 3);

SELECT * FROM manav;

-- 1) Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore siralayin. 

SELECT isim, SUM(urun_miktar) AS top_kg
FROM manav 
GROUP BY isim
ORDER BY isim;

-- 2) Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore ters siralayin. 

SELECT isim, SUM(urun_miktar) AS top_kg
FROM manav 
GROUP BY isim
ORDER BY isim DESC;

-- 3) Bunlari bir de toplam kiloya gore ters sirali yapalim

SELECT isim, SUM(urun_miktar) AS top_kg
FROM manav 
GROUP BY isim
ORDER BY top_kg DESC;

-- 4) Urun ismine gore, urunu alan toplam kisi sayisini,
-- kisi sayisina gore siralayiniz.

SELECT urun_adi, COUNT(isim) AS toplam_kisi
FROM manav 
GROUP BY urun_adi
ORDER BY toplam_kisi;

-- 5) Alinan kilo miktarina gore musteri sayisini, urun_miktar 
-- sirasina gore listeleyiniz.

SELECT urun_miktar, COUNT(isim) AS toplam_kisi
FROM manav 
GROUP BY urun_miktar
ORDER BY urun_miktar;

-- 6) Satilan meyve turune (urun_adi) gore urun alan kisi sayisini,
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.

SELECT urun_adi, COUNT(isim) AS toplam_kisi
FROM manav 
WHERE NOT urun_adi IS Null
GROUP BY urun_adi
ORDER BY urun_adi;

-- 7) Satilan meyvenin 4 harfli olmasina (urun_adi) gore urun alan kisi sayisini, 
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.

SELECT urun_adi, COUNT(isim) AS toplam_kisi
FROM manav 
WHERE urun_adi LIKE '____'
GROUP BY urun_adi
ORDER BY urun_adi;

/*======================== HAVING CLAUSE =======================
    HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan 
FILTRELEME komutudur.
    Aggregate fonksiyonlar ile ilgili bir kosul koymak 
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.    
===============================================================*/

CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO isciler VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Izmir', 3500, 'Honda');

SELECT * FROM isciler;

-- 1) Sirketlere göre işçi sayisini 1'den büyükse yazdirin

SELECT sirket, COUNT(isim)isci_sayisi
FROM isciler
GROUP BY sirket
HAVING isci_sayisi>1;

-- 2) Toplam geliri 8000 liradan fazla olan isimleri gosteren sorgu yaziniz

SELECT isim, SUM(maas)top_maas
FROM isciler
GROUP BY isim
HAVING top_maas>8000;

-- Yeni create ettigimiz bir field uzerinden filtreleme yaptigimiz icin
-- WHERE cumlecigini kullanamayiz, WHERE cumlecigi sadece tablomuzda var olan
-- field'lar icin bir filtreleme yapar.

-- 4) Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini 
-- ve MAX maasi veren sorgu yaziniz

SELECT sehir, MAX(maas)max_maas
FROM isciler
GROUP BY sehir
HAVING max_maas<5000;

-- 5) Eger bir sehirde alinan MAX maas 5000'den buyukse sehir ismini 
-- ve MAX maasi, sehir isim sirali veren sorgu yaziniz

SELECT sehir, MAX(maas)max_maas
FROM isciler
GROUP BY sehir
HAVING max_maas>5000
ORDER BY sehir;


/*============================ LIMIT ===========================
>Tablodaki verilerin belli bir kismini listelemek icin LIMIT
 komutunu kullaniriz.
>LIMIT komutundan sonra kullandigimiz sayi kadar kaydi bize getirir.
>Eger belirli bir aralikta calismak istiyorsak bu durumda 
iki sayi gireriz, ancak bu sayilardan ilki baslangic noktamizi 
ifade ederken ikincisi kac kayit getirecegimizi belirtir. Baslangic 
noktasi dahil edilmez!
===============================================================*/

-- 1) Isciler tablosundan ilk 5 kaydi getiriniz.

SELECT *
FROM isciler
LIMIT 5;

-- 2) Isim sirali tablodan ilk 3 kaydi listeleyin.

SELECT *
FROM isciler
ORDER BY isim
LIMIT 3;

-- 3) Maas sirali tablodan 4. kayittan 6. kayda kadar olan
-- kayitlarin isim ve sehir bilgilerini listeleyin.

SELECT isim,sehir
FROM isciler
ORDER BY maas
LIMIT 3,3;

-- 4) Maasi en yuksek 3 kisinin bilgilerini listeleyen sorguyu yaziniz.

SELECT *
FROM isciler
ORDER BY maas DESC
LIMIT 3;

-- 5) Maasi en dusuk 3 kisinin sadece isimlerini listeleyen sorguyu yaziniz.

SELECT isim
FROM isciler
ORDER BY maas
LIMIT 3;

-- 6) Maasi en dusuk 3 kisinin sadece isimlerini, 
-- isim sirali listeleyen sorguyu yaziniz.

SELECT isim
FROM isciler
ORDER BY maas,isim
LIMIT 3;

-- 7) Maas'i 4000'den buyuk olan 3 kisinin sehrini listeleyin.

SELECT sehir
FROM isciler
WHERE maas>4000
LIMIT 3;


-- 8) Maasi en yuksek 3. kisinin bilgilerini listeleyen sorguyu yaziniz.

SELECT *
FROM isciler
ORDER BY maas DESC
LIMIT 2,1;


