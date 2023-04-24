
/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
=========================================================================================*/

/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50  AND sinav2 < 50
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.

/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/

/*-------------------------------------------------------------------------
Q7: Sinav notu 70'ten buyuk esit 80'den kucuk esit olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/

-- +++++++++++ 1.YOL +++++++++++++++

SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu>=70 AND sinav_notu<=80;

-- +++++++++++ 2.YOL +++++++++++++++

SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu
BETWEEN 70 AND 80;

/*-------------------------------------------------------------------------
Q8: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Muhammet Talha' AND 'Murat';

-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.

/*-------------------------------------------------------------------------
Q9: Ankara ile Corum arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim
FROM ogretmen_lisesi
WHERE adres
BETWEEN 'Ankara' AND 'Corum';


-- **************************************************************

CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);


INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);


SELECT * FROM personel;

/*-------------------------------------------------------------------------
Q7: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE id
BETWEEN 10005 AND 10009;

/*-------------------------------------------------------------------------
Q8: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli';

-- BETWEEN komutu ile belli bir araliktaki kayitlari listelemek istedigimizde,
-- filtrelemeyi verilen araliga gore yapar,
-- yazdirmayi da tablodaki kayit sirasina gore yapar.

/*-------------------------------------------------------------------------
Q9: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Cano';

/*-------------------------------------------------------------------------
Q13: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/

SELECT id
FROM personel
WHERE maas=7000 OR isim='Ayse';

/*-------------------------------------------------------------------------
Q14: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE id=10001 OR id=10005 OR id=10008;













