/*
Proje: Titanic Survival Analysis
Aşama: Keşifsel Veri Analizi (EDA)

Amaç:
Titanic yolcularının genel özelliklerini incelemek;
yolcu sayısı, hayatta kalma durumu, yaş ve bilet
ücreti gibi temel göstergeleri özetlemek.
*/


SELECT COUNT(*) AS toplam,
SUM(survived ) AS hayatta_kalan,
COUNT(*) - SUM(survived ) AS hayatta_olmayan,
SUM(survived ) * 100 / COUNT(*) AS hayatta_kalma_yuzdesi,
ROUND(AVG(age) :: numeric, 1) AS ortalama_yas,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) AS medyan_yas,
ROUND(AVG(fare) :: numeric, 1) AS ucret_ortalama,
MIN(age) AS en_genc,
MAX(age) AS en_yasli
FROM public.titanic_train;


/*
Bulgular:

- Veri setinde toplam 891 yolcu bulunmaktadır.
- Yolcuların 342'si hayatta kalmış, 549'u hayatını kaybetmiştir.
- Genel hayatta kalma oranı yaklaşık %38'dir.
- Yaş bilgisi bulunan yolcuların ortalama yaşı 29,7'dir.
- Medyan yaşı değeri 28 dir.
- Ortalama bilet ücreti 32,2'dir.
- En genç yolcu yaklaşık 0.42 yaşında yani 0.42*12 = 5 aylıktır, en yaşlı yolcu 80 yaşındadır.
- Yolcuların çoğunluğu hayatta kalamamıştır.
*/












