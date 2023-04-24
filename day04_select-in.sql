
/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/

/*-------------------------------------------------------------------------
Q1:Personel tablosundan Id'si 10001, 10005 ya da 10008 olan 
personel isimlerini listeleyin
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE id IN(10001,10005,10008);

/*-------------------------------------------------------------------------
Q2: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE maas IN(7000,12000);


/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/

/*-------------------------------------------------------------------------
Q3: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim LIKE 'a%';

/*-------------------------------------------------------------------------
Q4: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim LIKE '%ayse%';

/*-------------------------------------------------------------------------
Q5: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim LIKE '%n';

/*-------------------------------------------------------------------------
Q6: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim LIKE '_e%';

/*-------------------------------------------------------------------------
Q7: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim LIKE '_e%' AND isim LIKE '%y%';

/*-------------------------------------------------------------------------
Q8: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim NOT LIKE '%a%';

/*-------------------------------------------------------------------------
Q9: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim,maas
FROM personel
WHERE maas LIKE '_____';

/*-------------------------------------------------------------------------
Q10: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT isim
FROM personel
WHERE isim LIKE 'a_____a%';


/*==================================SELECT-REGEXP_LIKE==================================
 Daha karmasik pattern ile sorgulama islemi icin REGEXP_LIKE kullanilabilir.
  -- 'c' => case-sensitive demektir
  -- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.
  
-----Syntax-----
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]','c'[])
%
=========================================================================================*/


CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES 
    (1001, 'hot', 3),
    (1002, 'hat', 3),
    (1003, 'hit', 3),
    (1004, 'hbt', 3),
    (1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
    (1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);
    
    
SELECT * FROM kelimeler;

-- NOT: VEYA islemi icin | karakteri kullanilir.

-- Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e 
-- dikkat ederek listele

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime, 'ot|at' , 'c');

-- Q2 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e 
-- dikkat etmeksizin listele

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime, 'ot|at' , 'i');

-- ************************ Kelimeler Tablosundan *******************************

/*-------------------------------------------------------------------------
Q1: 3 harfli kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime LIKE '___';


/*-------------------------------------------------------------------------
Q2: En az 3 harfli kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime LIKE '___%';


/*-------------------------------------------------------------------------
Q3: H ile baslayip t ile biten kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime LIKE 'h%t';


/*-------------------------------------------------------------------------
Q4: H ile baslayip t ile biten kelimeleri case sensitive listeleyin
---------------------------------------------------------------------------*/



/*-------------------------------------------------------------------------
Q5: H ile baslayip t ile biten 3 harfli kelimeleri case insensitive listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime LIKE 'h_t';


/*-------------------------------------------------------------------------
Q6: 3 ya da daha az karakterli kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE kelime NOT LIKE '___%';


/*-------------------------------------------------------------------------
Q7: id'si 8 rakamini iceren kelimeleri listeleyin
---------------------------------------------------------------------------*/

SELECT kelime
FROM kelimeler
WHERE id LIKE '%8%';













