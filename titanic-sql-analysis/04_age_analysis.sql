/*
Proje: Titanic Survival Analysis

Aşama: 04 — Yaş Gruplarına Göre Hayatta Kalma Analizi

Amaç:
Yolcuları yaş gruplarına ayırarak her grubun yolcu
sayısını ve hayatta kalma oranını karşılaştırmak.

Yaş grupları:
- bebek: 0 <= yaş < 6
- çocuk: 6 <= yaş < 18
- genç: 18 <= yaş < 35
- orta_yasli: 35 <= yaş < 60
- yasli: 60 yaş ve üzeri
- Yaş bilinmiyor: Yaş bilgisi NULL olan yolcular

Not:
Grup adları ve yaş sınırları bu analiz için belirlenmiştir.
Örneğin 6 yaşındaki yolcu çocuk, 18 yaşındaki yolcu genç grubuna girer. Yaşı eksik olan yolculara tahmini değer atanmamış, bu yolcular ayrı grupta
tutulmuştur.
*/

WITH yas_gruplari AS (
SELECT survived,
CASE
	WHEN age IS NULL THEN 'Yaş bilinmiyor'
    WHEN age < 6 THEN 'bebek'
    WHEN age < 18 THEN 'çocuk'
    WHEN age < 35 THEN 'genç'
    WHEN age < 60 THEN 'orta_yasli'
    ELSE 'yasli'
END AS yas_grubu
FROM public.titanic_train
)
SELECT yas_grubu,
COUNT(*) AS yolcu_sayisi,
SUM(survived) AS hayatta_kalan,
COUNT(*) - SUM(survived) AS hayatta_kalmayan,
ROUND(100.0 * SUM(survived) / COUNT(*), 2) AS hayatta_kalma_orani
FROM yas_gruplari
GROUP BY yas_grubu
ORDER BY
CASE yas_grubu
WHEN 'bebek' THEN 1
WHEN 'çocuk' THEN 2
    WHEN 'genç' THEN 3
    WHEN 'orta_yasli' THEN 4
    WHEN 'yasli' THEN 5
    WHEN 'Yaş bilinmiyor' THEN 6
END;


/*
BULGULAR:

- Bebek grubundaki 44 yolcunun 31'i hayatta kalmıştır. Hayatta kalma oranı %70,45'tir.

- Çocuk grubundaki 69 yolcunun 30'u hayatta kalmıştır. Hayatta kalma oranı %43,48'dir.

- Genç grubundaki 366 yolcunun 135'i hayatta kalmıştır. Hayatta kalma oranı %36,89'dur.

- Orta yaşlı grubundaki 209 yolcunun 87'si hayatta kalmıştır. Hayatta kalma oranı %41,63'tür.

- Yaşlı grubundaki 26 yolcunun 7'si hayatta kalmıştır. Hayatta kalma oranı %26,92'dir.

- Yaşı bilinmeyen 177 yolcunun 52'si hayatta kalmıştır. Hayatta kalma oranı %29,38'dir.

ANALİTİK DEĞERLENDİRME:

- Yaşı bilinen gruplar arasında en yüksek hayatta kalma oranı 6 yaşından küçük yolcularda (%70,45), en düşük oran ise 60 yaş ve üzerindeki
yolcularda (%26,92) görülmüştür.

- Hayatta kalma oranı yaş arttıkça düzenli biçimde azalmamaktadır. Orta yaşlı grubunun oranı (%41,63),genç grubunun oranından (%36,89) yüksektir.

- Genç grubu en fazla yolcuyu ve en fazla hayatta kalanı içermektedir. Ancak en yüksek hayatta kalmaoranına sahip değildir. Hayatta kalan kişi
sayısı ile hayatta kalma oranı farklı göstergelerdir.

- Yaşlı grubu yalnızca 26 yolcudan oluşmaktadır.Bu grubun oranı yorumlanırken yolcu sayısının diğer yaş gruplarından az olduğu dikkate alınmalıdır.

- Yaşı bilinmeyen yolcular toplamın yaklaşık %19,87'sini oluşturmaktadır. Bu yolcuların ayrı gösterilmesi tüm kayıtların analizde kalmasını
sağlamıştır; ancak eksik yaş bilgisinden kaynaklanabilecek yanlılığı ortadan kaldırmaz.

- Cinsiyet ve yolcu sınıfı dağılımları yaş grupları arasında farklı olabilir. Bu nedenle oranlar arasındaki farklar yalnızca yaş ile açıklanamaz.
Sonuçlar tek başına neden-sonuç ilişkisi kanıtlamaz.

- Sonraki aşamada yolcu sınıfı ve cinsiyet birlikte incelenerek hayatta kalma oranları karşılaştırılacaktır.
*/






