
-- ====================== UNION ======================
/*
	Iki farkli sorgulamanin sonucunu birlestiren islemdir.
    Iki veya daha fazla Sorgu ifadesinin sonuc kumelerini 
    birlestirerek tek bir sonuc kumesi olusturur.
​
    2.sorgunun sonuna ORDER BY komutunu kullanirsaniz 
    tum tabloyu istediginiz siralamaya gore siralar.
   
    NOT: Secilen Field SAYISI ve DATA TYPE'i ayni olmalidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. 
    Benzer verileri almak icin UNION ALL kullanilir.
​
======================================================*/


CREATE TABLE isciler(
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
INSERT INTO isciler VALUES(345678902, 'Mehmet Ozturk', 'Izmir', 3500,'Honda');

select * from isciler;

-- Honda'da calisan iscileri listeleyin

SELECT isim
FROM isciler
WHERE sirket='Honda';

-- Tofas'ta calisan iscileri listeleyin

SELECT isim
FROM isciler
WHERE sirket='Tofas';

-- Honda ya da Tofas'ta calisan iscileri listeleyin

SELECT isim
FROM isciler
WHERE sirket IN ('Honda','Tofas');

-- 1) Honda ve Tofas'ta calisan benzersiz isimdeki iscileri listeleyin

SELECT isim
FROM isciler
WHERE sirket = 'Honda'

UNION 

SELECT isim
FROM isciler
WHERE sirket = 'Tofas';

-- 2) Honda, Ford ve Tofas'ta calisan benzersiz isimdeki iscileri listeleyin

SELECT isim
FROM isciler
WHERE sirket = 'Honda'
UNION 
SELECT isim
FROM isciler
WHERE sirket = 'Tofas'
UNION 
SELECT isim
FROM isciler
WHERE sirket = 'Ford';

-- 3) Honda, Ford ve Tofas'ta calisan butun iscileri listeleyin

SELECT isim
FROM isciler
WHERE sirket = 'Honda'
UNION ALL
SELECT isim
FROM isciler
WHERE sirket = 'Tofas'
UNION ALL
SELECT isim
FROM isciler
WHERE sirket = 'Ford';

-- 4) Maasi 4000'den fazla olan isci isimlerini ve 5000'den fazla
-- maas alinan sehirleri gosteren sorguyu yaziniz

SELECT isim AS isci_sehir,maas
FROM isciler
WHERE maas>4000
UNION
SELECT sehir,maas
FROM isciler
WHERE maas>5000;

-- 5) Mehmet Ozturk ismindeki iscilerin aldigi maaslari ve Istanbul'daki 
-- iscilerin maaslarini bir tabloda gosteren sorgu yaziniz

SELECT isim AS isim_sehir,maas
FROM isciler
WHERE isim = 'Mehmet Ozturk'
UNION 
SELECT sehir,maas
FROM isciler
WHERE sehir = 'Istanbul';

-- 6) 3000'den fazla maas odenen sehirleri ve 5000'den az maas alan isci
--  isimlerini bir tabloda gosteren sorguyu yaziniz

SELECT sehir AS sehir_isim, maas
FROM isciler
WHERE maas > 3000
UNION
SELECT isim,maas
FROM isciler
WHERE maas < 5000;

-- 7) 5000'den az maas alanlarin, arti Honda calisani olmayanlarin bilgilerini
-- listeleyen bir sorgu yaziniz. 

SELECT *
FROM isciler
WHERE maas < 5000
UNION
SELECT *
FROM isciler
WHERE  sirket <> 'Honda';    --  Where'den sonra (!=)   yada  NOT sirket='Honda' yazlabilir





