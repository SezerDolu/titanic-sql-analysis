/*
Proje: Titanic Survival Analysis

Aşama: 05 — Yolcu Sınıfı ve Cinsiyete Göre Hayatta Kalma Analizi

Amaç:
Yolcu sınıflarına göre hayatta kalma oranlarını karşılaştırmak
ve her sınıfta kadın ve erkek yolcuların hayatta kalma
oranlarının nasıl değiştiğini incelemek.

Tablo: public.titanic_train

Değişkenler:
- pclass: 1 = Birinci sınıf, 2 = İkinci sınıf, 3 = Üçüncü sınıf
- sex: female = Kadın, male = Erkek
- survived: 0 = Hayatta kalamadı, 1 = Hayatta kaldı
*/


/*
1. Yolcu sınıflarına göre hayatta kalma oranları nasıldır?
*/

SELECT
pclass AS yolcu_sinifi,
COUNT(*) AS yolcu_sayisi,
SUM(survived) AS hayatta_kalan,
COUNT(*) - SUM(survived) AS hayatta_kalmayan,
ROUND(SUM(survived) * 100 / COUNT(*) :: NUMERIC, 1) AS hayatta_kalma_orani
FROM public.titanic_train
GROUP BY pclass
ORDER BY pclass;


/*
2. Her yolcu sınıfında kadın ve erkeklerin
   hayatta kalma oranları nasıldır?
*/

SELECT
pclass AS yolcu_sinifi,
sex AS cinsiyet,
COUNT(*) AS yolcu_sayisi,
SUM(survived) AS hayatta_kalan,
COUNT(*) - SUM(survived) AS hayatta_kalmayan,
ROUND(100.0 * SUM(survived) / COUNT(*) :: NUMERIC, 2) AS hayatta_kalma_orani
FROM public.titanic_train
GROUP BY pclass, sex
ORDER BY pclass, sex;


/*

ORANLARIN ANLAMI:

- İlk sorgudaki oran, ilgili sınıftaki yolcuların
  yüzde kaçının hayatta kaldığını gösterir.
- İkinci sorgudaki oran, ilgili sınıf ve cinsiyet grubundaki
  yolcuların yüzde kaçının hayatta kaldığını gösterir.
- Örneğin birinci sınıf kadınların oranı hesaplanırken
  paydada yalnızca birinci sınıf kadın yolcular bulunur.

BULGULAR İÇİN CEVAPLANACAK SORULAR:

1. En fazla yolcu hangi sınıftadır?
2. Hayatta kalma oranı en yüksek ve en düşük sınıf hangisidir?
3. Her üç sınıfta da kadınların hayatta kalma oranı
   erkeklerden yüksek midir?
4. Kadınlar kendi aralarında karşılaştırıldığında
   sınıflara göre nasıl bir fark görülmektedir?
5. Erkekler kendi aralarında karşılaştırıldığında
   sınıflara göre nasıl bir fark görülmektedir?
*/

/*
BULGULAR:

1. Yolcu sınıflarına göre dağılım ve hayatta kalma:

- Birinci sınıfta 216 yolcu bulunmaktadır. Bu yolcuların 136'sı hayatta kalmış, hayatta kalma oranı %62,96 olmuştur.

- İkinci sınıfta 184 yolcu bulunmaktadır. Bu yolcuların 87'si hayatta kalmış, hayatta kalma oranı %47,28 olmuştur.

- Üçüncü sınıfta 491 yolcu bulunmaktadır. Bu yolcuların 119'u hayatta kalmış, hayatta kalma oranı %24,24 olmuştur.

- En fazla yolcu üçüncü sınıftadır. Buna rağmen hayatta kalan yolcu sayısı birinci sınıfta daha yüksektir.

- Birinci sınıfın hayatta kalma oranı, üçüncü sınıftan 38,72 yüzde puan daha yüksektir.

2. Yolcu sınıfı ve cinsiyete göre hayatta kalma:

- Birinci sınıftaki 94 kadın yolcunun 91'i hayatta kalmıştır. Hayatta kalma oranı %96,81'dir.
  Aynı sınıftaki 122 erkek yolcunun 45'i hayatta kalmıştır. Hayatta kalma oranı %36,89'dur.

- İkinci sınıftaki 76 kadın yolcunun 70'i hayatta kalmıştır. Hayatta kalma oranı %92,11'dir.
  Aynı sınıftaki 108 erkek yolcunun 17'si hayatta kalmıştır. Hayatta kalma oranı %15,74'tür.

- Üçüncü sınıftaki 144 kadın yolcunun 72'si hayatta kalmıştır. Hayatta kalma oranı %50,00'dir.
  Aynı sınıftaki 347 erkek yolcunun 47'si hayatta kalmıştır. Hayatta kalma oranı %13,54'tür.
  
- Her üç sınıfta da kadınların hayatta kalma oranı erkeklerden daha yüksektir.

- İncelenen altı grup içinde en yüksek hayatta kalma oranı birinci sınıf kadınlarda (%96,81), en düşükoran ise üçüncü sınıf erkeklerde (%13,54)
görülmüştür.

ANALİTİK DEĞERLENDİRME:

- Hem kadınlarda hem de erkeklerde hayatta kalma oranı birinci sınıftan üçüncü sınıfa doğru azalmaktadır.

- Kadınların birinci ve ikinci sınıftaki hayatta kalma oranları %90'ın üzerindeyken üçüncü sınıfta %50'dir.
  Bu durum, kadın yolcuların sonuçlarının da sınıflar arasında belirgin biçimde farklılaştığını göstermektedir.

- Üçüncü sınıf kadınların hayatta kalma oranı (%50,00), birinci sınıf erkeklerin oranından (%36,89) yüksektir.
  Dolayısıyla hayatta kalma durumunu yalnızca yolcu sınıfıyla açıklamak yeterli değildir.

- 03 aşamasında görülen kadın ve erkekler arasındaki fark, yolcular sınıflarına ayrıldığında da devam etmektedir.

- Bulgular, yolcu sınıfı ve cinsiyetin hayatta kalma durumuyla ilişkili olduğunu göstermektedir.
  Ancak bu karşılaştırmalar neden-sonuç ilişkisi kanıtlamaz.
  Yaş gibi diğer değişkenlerin etkisi burada ayrıştırılmamıştır.
*/

/*
PROJENİN GENEL SONUCU:

- Titanic eğitim veri setindeki 891 yolcu PostgreSQL kullanılarak incelenmiştir. Veri kalite kontrollerininardından genel dağılımlar, cinsiyet,
yaş grupları ve yolcu sınıfı analiz edilmiştir.

- Toplam 342 yolcu hayatta kalmış, 549 yolcu hayatını kaybetmiştir. Genel hayatta kalma oranı %38,38'dir.

- Kadınların hayatta kalma oranı %74,20, erkeklerin ise %18,89'dur. Kadınların daha yüksek hayatta kalma oranına sahip olması üç yolcu sınıfında
da görülmüştür.

- Birinci sınıfta hayatta kalma oranı %62,96, ikinci sınıfta %47,28, üçüncü sınıfta %24,24'tür.
  Hem kadınlarda hem de erkeklerde birinci sınıftan üçüncü sınıfa doğru hayatta kalma oranı azalmıştır.

- Yaşı bilinen gruplar arasında en yüksek hayatta kalma oranı 6 yaşından küçük yolcularda (%70,45), en düşük oran ise 60 yaş ve üzerindeki
yolcularda (%26,92) görülmüştür.

- Hayatta kalma oranı yaş arttıkça düzenli biçimde azalmamıştır. 35–60 yaş aralığındaki yolcuların oranı, 18–35 yaş aralığındaki yolculardan daha 
yüksektir.

- Cinsiyet ve yolcu sınıfının birlikte incelenmesi, genel oranların arkasındaki grup farklılıklarını ortaya koymuştur. Bulgular, hayatta kalma
durumunu tek bir değişkenle açıklamanın yetersiz kalabileceğini göstermektedir.

PROJENİN SINIRLILIKLARI:

- Sonuçlar yalnızca analiz edilen 891 yolcuya aittir.
  Titanic'teki tüm yolcuları ve mürettebatı kapsamaz.

- 177 yolcunun yaş bilgisi eksiktir. Bu yolcular "Yaş bilinmiyor" grubunda tutulmuş, eksik yaşlara tahmini değer atanmamıştır. Bu yaklaşım
kayıtları korur; eksik veriden kaynaklanabilecek yanlılığı ortadan kaldırmaz.

- Yaş grupları bu proje için belirlenmiştir. Farklı yaş sınırları kullanılması, grup sayılarını ve hayatta kalma oranlarını değiştirebilir.

- Gruplardaki yolcu sayıları farklıdır. Özellikle 26 yolcudan oluşan 60 yaş ve üzeri grubun oranıyorumlanırken küçük grup büyüklüğü dikkate
alınmalıdır.

- Yaş, cinsiyet ve yolcu sınıfı aynı anda incelenerek birbirinden bağımsız etkileri ölçülmemiştir.

- Analiz betimleyicidir. Gözlenen farklılıklar tek başına neden-sonuç ilişkisi veya istatistiksel anlamlılık kanıtı değildir.
*/


