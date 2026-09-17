/*
Proje: Titanic Survival Analysis
Aşama: Hayatta Kalma Analizi

Amaç:
Yolcuların genel hayatta kalma durumunu ve cinsiyete göre hayatta kalma oranlarını incelemek.
*/

/*
1. Veri setinde kadın - erkek dağılımı nasıl? Bu yolcuların toplam içerisindeki oranları
*/

SELECT 
sex,
COUNT(*) AS yolcu_sayisi,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS toplam_icindeki_orani
FROM public.titanic_train
GROUP BY sex
ORDER BY yolcu_sayisi DESC;

/*
Kadın ve erkek yolcuların hayatta kalma oranları
*/

SELECT 
sex,
COUNT(*) AS yolcu_sayisi,
SUM(survived) AS hayatta_kalan,
COUNT(*) - SUM(survived) AS hayatta_kalmayan,
ROUND(100.0 * SUM(survived) / COUNT(*), 2) AS hayatta_kalma_orani
FROM public.titanic_train
GROUP BY sex
ORDER BY hayatta_kalma_orani DESC;

/*
Yolcuların genel hayatta kalma dağılımı nasıl
*/

SELECT 
survived,
COUNT(*) AS yolcu_sayisi,
ROUND(count(*) * 100.0 / SUM(count(*)) OVER (), 2) AS hayatta_kalma_orani
FROM public.titanic_train
GROUP BY survived
ORDER BY survived;


/*
BULGULAR: 

Yolcu dağılımı:

- Veri setinde 577 erkek ve 314 kadın yolcu bulunmaktadır.Erkek yolcular toplam yolcuların %64,76'sını oluşturmaktadır.
- Kadın yolcular toplam yolcuların %35,24'ünü oluşturmaktadır.
- Veri setindeki erkek yolcu sayısı kadın yolcu sayısından belirgin biçimde daha yüksektir.

Genel hayatta kalma durumu:

- Toplam 891 yolcunun 342'si hayatta kalmış, 549'u hayatta kalamamıştır.
- Yolcuların genel hayatta kalma oranı %38,38'dir.
- Hayatta kalamayan yolcuların oranı %61,62'dir.
- Veri setindeki yolcuların çoğunluğu hayatta kalamamıştır.

Cinsiyete göre hayatta kalma durumu:

- 314 kadın yolcunun 233'ü hayatta kalmıştır.
- Kadın yolcuların hayatta kalma oranı %74,20'dir.
- 577 erkek yolcunun 109'u hayatta kalmıştır.
- Erkek yolcuların hayatta kalma oranı %18,89'dur.
- Kadınların hayatta kalma oranı erkeklerden 55,31 yüzde puan daha yüksektir.
- Kadın yolcuların hayatta kalma oranı erkeklerin yaklaşık 3,9 katıdır.
- Sonuçlar, cinsiyet ile hayatta kalma durumu arasında güçlü bir ilişki
  bulunduğunu göstermektedir.

Analitik değerlendirme:

- Yolcuların çoğunluğu erkek olmasına rağmen hayatta kalanların önemli bir bölümünü kadınlar oluşturmaktadır.
- Cinsiyete göre görülen fark oldukça büyüktür; ancak bu sonuç tek başına nedensellik göstermez.
- Yolcu sınıfı, yaş ve kabin konumu gibi diğer değişkenler de hayatta kalma durumuyla ilişkili olabilir.
- Bu nedenle sonraki aşamada cinsiyet ve yolcu sınıfı birlikte incelenmelidir.
*/