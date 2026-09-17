# Titanic Veri Analizi — SQL

Bu projede Titanic yolcularının hayatta kalma durumunu SQL kullanarak inceledim. Cinsiyet, yaş ve yolcu sınıfına göre hayatta kalma oranlarının nasıl değiştiğini anlamaya çalıştım.

Çalışmayı PostgreSQL ve DBeaver kullanarak hazırladım.
Sorguların altına bulgularımı ve yorumlarımı ekledim.

## Veri Seti

Kaggle'daki Titanic veri setinin 891 yolcu içeren 'train.csv' dosyasını kullandım.

Veri kaynağı:
https://www.kaggle.com/competitions/titanic/data

## Projede Neler Yaptım?

1. Yolcu sayısını, tekrar eden kimlikleri ve eksik verileri kontrol ettim.
2. Yaş, bilet ücreti ve genel hayatta kalma durumunu inceledim.
3. Kadın ve erkek yolcuların hayatta kalma oranlarını karşılaştırdım.
4. Yolcuları yaş gruplarına ayırarak sonuçlara baktım.
5. Yolcu sınıfı ve cinsiyeti birlikte değerlendirip bulgularımı özetledim.

## Dosyalar

- '01_data_quality.sql': Veri kalite kontrolleri
- '02_exploratory_analysis.sql': Verinin genel özellikleri
- '03_survival_analysis.sql': Cinsiyete göre hayatta kalma analizi
- '04_age_analysis.sql': Yaş gruplarına göre hayatta kalma analizi
- '05_class_gender_analysis.sql': Yolcu sınıfı ve cinsiyet karşılaştırması

## Dikkatimi Çeken Sonuçlar

- 891 yolcunun 342'si hayatta kalmış. Genel hayatta kalma oranı %38,38.
- Kadınların hayatta kalma oranı %74,20, erkeklerin ise %18,89.
- Birinci sınıfta hayatta kalma oranı %62,96 iken üçüncü sınıfta bu oran %24,24.
- Her üç sınıfta da kadınların hayatta kalma oranı erkeklerden yüksek.
- Yaşı bilinen gruplarda en yüksek oran 6 yaşından küçüklerde, en düşük oran ise 60 yaş ve üzerindeki yolcularda görülüyor.

Benim için dikkat çekici karşılaştırmalardan biri, üçüncü sınıftaki kadınların hayatta kalma oranının birinci sınıftaki erkeklerdenyüksek olmasıydı. Bu yüzden sonuçları yalnızca yolcu sınıfınabakarak yorumlamanın yeterli olmadığını gördüm.

## Eksik Verileri Nasıl Ele Aldım?

177 yolcunun yaş bilgisi eksikti. Bu alanları tahmini yaşlarla
doldurmadım; yaş analizinde "Yaş bilinmiyor" adıyla ayrı bir
grupta gösterdim.

Yaş gruplarını 0-6, 6–17, 18–34, 35–59 ve 60 yaş ve üzeri olarak belirledim. Ondalıklı yaşlar da bu sınırlaragöre gruplandırıldı; örneğin 17,5 yaş, 6–18 aralığına dahildir.

# Sorguları Çalıştırmak İçin

1. Kaggle'dan 'train.csv' dosyasını indirin.
2. Veriyi PostgreSQL'e 'public.titanic_train' tablosu olarak aktarın.
3. Sütun adlarını küçük harfle kullanın. 'survived' sütunu tamsayı, 'age' ve 'fare' sütunları ondalıklı sayıları destekleyen türde olmalı.
4. Boş yaş alanlarını NULL olarak aktarın.
5. SQL dosyalarını 01'den 05'e kadar sırayla çalıştırın.
6. WITH ile başlayan sorguları devamındaki SELECT ile birlikte çalıştırın.

# Bu Çalışmada Öğrendiklerim

COUNT, SUM, AVG, GROUP BY, CASE WHEN ve WITH gibi SQL yapılarını bir veri seti üzerinde uyguladım. Medyan hesaplama
ve pencere fonksiyonlarıyla da çalıştım.

Sadece sorgu sonucunu bulmanın değil, sonucu doğru yorumlamanın da dosyanın içine sık sık yorum satırları ilave ederek önemli olduğunu gördüm. Örneğin bir grupta hayatta kalan kişi sayısının fazla olması, hayatta kalma oranının da en yüksek olduğu anlamına gelmiyor.

# Kısa Bir Not

Yaptığım araştırma neticesinde gemi mürettebatıyla birlikte 2224 kişi olduğu bilinmektedir. Bu sonuçlar yalnızca veri setindeki yolcular için geçerlidir.
Eksik yaş bilgileri ve gruplardaki yolcu sayılarının farklı olması yorumları etkileyebilir. Bulduğum ilişkiler tek başına neden-sonuç ilişkisi göstermiyor.
