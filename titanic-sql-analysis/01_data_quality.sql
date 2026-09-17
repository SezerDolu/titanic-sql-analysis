/*
Proje: Titanic Survival Analysis
Aşama: Veri Kalite Kontrolü
Veri kaynağı: Kaggle Titanic Dataset
Tablo: public.titanic_train

Amaç:
Analize başlamadan önce veri setinin boyutunu,benzersiz kayıtlarını ve eksik değerlerini kontrol etmek.
*/
/*891*/


SELECT survived, COUNT(*) AS yolcu_sayisi
FROM public.titanic_train
GROUP BY  survived
ORDER BY survived;

SELECT pclass, COUNT(*) AS yolcu_sayisi
FROM public.titanic_train
GROUP BY pclass
ORDER BY pclass;

SELECT passengerid, age, fare
FROM public.titanic_train
WHERE age < 0 OR fare <0;
/* true*/ 

SELECT sex, count(*) AS yolcu_sayisi
FROM public.titanic_train
GROUP BY sex
ORDER BY sex;


SELECT COUNT(*) AS toplam_yolcu,
COUNT(DISTINCT passengerid ) AS  benzersiz_yolcu,
COUNT(*) - COUNT(age) eksik_yas,
COUNT(*) FILTER (WHERE cabin IS NULL OR trim(cabin) = '') AS eksik_kabin,
COUNT(*) FILTER (where embarked IS NULL OR trim(embarked) = '') AS eksik_liman,
COUNT(*) - COUNT(fare) AS eksik_ucret
FROM public.titanic_train;
/* Herkes ücretini ödemiş.*/

/* PassengerId alanında eksik veya tekrarlayan kimlik bulunmamaktadır. age sütununda 177, cabin sütununda 687 ve embarked sütununda 2 eksik kayıt
bulunmaktadır. 
Metin sütunlarındaki eksik değerlerin CSV aktarımı sırasında NULL yerine boş metin olarak kaydedildiği tespit edilmiştir. fare sütununda eksik 
değer bulunmamaktadır.
*/




