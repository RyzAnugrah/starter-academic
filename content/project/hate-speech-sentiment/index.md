---
draft: false
url_pdf: ""
summary: Hatespeech Sentiment Analysis On Twitter With Naïve Bayes Classifier Method And Support Vector Machine
url_video: ""
date: 2021-01-15T11:12:56.367Z
external_link: ""
url_slides: ""
title: Hate Speech Sentiment Analysis
tags:
  - Other
image:
  caption: Image by LIONEL BONAVENTURE via Getty Images
  focal_point: Smart
url_code: ""
---
### Latar Belakang

Banyak gerakan gerakan yang dilakukan dalam media sosial khususnya Twitter yang semuanya sukses mampu mempengaruhi pengguna nya. Ada gerakan yang bertujuan baik ada juga gerakan dengan tujuan jahat yaitu menebar kebencian kepada orang lain. Biasanya gerakan di Twitter itu dilakukan dengan menggunakan tagar (#), Gerakan terbaru ada tagar Hatespeech (#HateSpeech), dilihat dari namanya sudah jelas yaitu ucapan kebencian (Ghulam Asrofi Buntoro, 2016).

Proses klasifikasi pada penelitian ini menggunakan metode klasifikasi Naïve Bayes Classifier dan Support Vector Machine (SVM) dengan preprocessing data. Data yang digunakan adalah tweet dalam bahasa Indonesia dengan tagar HateSpeech (#HateSpeech).

### Metode Penelitian

#### 1. Mengumpulkan data tweet

Data tweet diambil dari media sosial Twitter ( https://hatespeechdata.com ). Datasetnya berupa data dua kolom: label - tweet, terdiri dari 488 tweet dalam bahasa Indonesia. Labelnya adalah Non_HS atau HS. Non_HS untuk tweet "non-hate-speech" dan HS untuk tweet "hate-speech". Data diambil secara acak baik dari user biasa ataupun media online di Twitter.

#### 2. Mengubah data tweet ke dalam format ARFF

Data tweet yang dikumpulkan yang berbentuk teks, kemudian dijadikan file ARFF. Untuk membuat file ARFF dengan cara manual.

{{< figure src="assets/1.jpg" title="File Format .ARFF" >}}

#### 3. Preprocessing Data

1. Cleansing
   
   Yaitu proses menghapus simbol-simbol yang kurang penting dalam data tweet yang bisa mengganggu proses klasifikasi nantinya.
   {{< figure src="assets/2.jpg" title="Cleansing" >}}

2. Tokenisasi
   
   Penelitian ini menggunakan  metode tokenisasi n-gram dengan nilai n minimum = 1 dan n maksimum = 3. Proses tokenisasi menggunakan menu yang ada dalam WEKA.
   {{< figure src="assets/3.jpg" title="Tokenisasi" >}}

3. Filtering
   
   Filtering dilakukan untuk menghapus kata-kata yang kurang penting atau kurang berpengaruh terhadap proses klasifikasi nantinya. Proses ini dilakukan dengan menggunakan stopword list. Stopword list yang digunakan dalam penelitian ini adalah stopword list Bahasa Indonesia yang berasal dari library nltk.

4. Data tweet diubah ke dalam bentuk vektor
   
   Data tweet kemudian diubah ke dalam bentuk vektor. Dengan cara memilih StringToWordVector pada tool WEKA.
   {{< figure src="assets/4.jpg" title="Konfigurasi StringToWordVector" >}}

5. Penentuan Class Attribute
   
   Data Twitter yang sudah dilakukan Preprocessing kemudian akan ditentukan class attribute, class attribute yang dimunculkan dalam penelitian ini ada 2, diantaranya HateSpeech, dan Non Hatespeech.

6. Pemberian Bobot
   
   Memberikan bobot pada tiap-tiap kata (term). Pembobotan dilakukan untuk mendapatkan nilai dari kata yang berhasil diekstrak. Metode yang digunakan untuk pemberian bobot dalam penelitian ini adalah TF-IDF (Term Frequency – Inverse Document Frequency).

7. Klasifikasi
   
   Metode klasifikasi yang digunakan dalam penelitian ini adalah Naïve Bayes Classifier (NBC) dan Support Vector Machine (SVM).

8. Evaluasi Hasil
   
   Melakukan evaluasi performa Akurasi, Presisi dan Recall dari eksperimen yang telah dilakukan. Evaluasi dilakukan dengan menggunakan Confusion Matrix yaitu true positive rate (TP rate), true negative rate (TN rate), false positive rate (FP rate) dan false negative rate (FN rate) sebagai indikator. TP rate adalah persentase dari kelas positif yang berhasil diklasifikasi sebagai kelas positif, sedangkan TN rate adalah persentase dari kelas negatif yang berhasil diklasifikasi sebagai kelas negatif. FP rate adalah kelas negatif yang diklasifikasi sebagai kelas positif. FN rate adalah kelas positif yang diklasifikasi sebagai kelas negatif (Kohavi, 1998).
   {{< figure src="assets/5.jpg" title="Confusion Matrix" >}}

#### Uji Coba dan Pembahasan

Dataset yang digunakan sebanyak 488 Tweet, data dibagi secara seimbang (balanced) setiap kelasnya, karena dengan data yang tidak seimbang (imbalanced), klasifikasi yang dibangun memiliki kecenderungan untuk mengabaikan minority class. Data dibagi menjadi Non HateSpeech 244 Tweet dan HateSpeech 244 Tweet. Pemberian label dilakukan secara manual.

Pada penelitian ini metode yang digunakan untuk melakukan klasifikasi data adalah Naïve Bayes Classifier (NBC) dan Support Vector Machine (SVM) dengan menggunakan perangkat lunak WEKA versi 3.8.4 untuk melakukan klasifikasi. WEKA menggunakan tipe dokumen Attribute-Relation File Format (ARFF) sebagai masukan untuk melakukan klasifikasi data.

Sebagai perbandingan, penelitian dilakukan dengan menggunakan WEKA (tanpa stopword), WEKA (dengan stopword), dan menggunakan Python.

#### Perbandingan Hasil Klasifikasi

{{< figure src="assets/6.jpg" title="Tabel Perbandingan Hasil Klasifikasi" >}}

Dari penelitian yang telah dilakukan, didapatkan hasil sebagai berikut.
- Hasil akurasi tertinggi didapatkan saat menggunakan metode klasifikasi Naïve Bayes Classifier (NBC) dengan WEKA tanpa stopword list Bahasa Indonesia, didapat akurasi sebesar 82,1%.

- Hasil akurasi terendah didapatkan saat menggunakan metode klasifikasi Naïve Bayes Classifier (NBC) dengan Python, didapat akurasi sebesar 76%.

- Tabel menunjukkan bahwa penggunaan stopword list Bahasa Indonesia tidak mampu meningkatkan akurasi, bahkan sebaliknya yang terjadi, saat menggunakan stopword list Bahasa Indonesia akurasi menjadi turun.

- Dari hasil klasifikasi ini juga dapat dilihat bahwa penggunaan WEKA lebih baik daripada Python.

- Dalam penelitian ini dapat diketahui bahwa metode klasifikasi Naïve Bayes Classifier (NBC) lebih tinggi akurasinya untuk klasifikasi sentiment tweet HateSpeech Bahasa Indonesia dengan rata-rata akurasi sebesar 79,8%.

#### Kesimpulan

Dari penelitian yang telah dilakukan, maka dapat ditarik kesimpulan bahwa Analisis sentimen tweet Bahasa Indonesia dengan tagar Hatespeech dapat membantu menentukan sentimen pada twit opini Bahasa Indonesia yang ada di Twitter. Setelah dilakukan analisis sentimen terlihat banyak tweet opini yang sebenarnya tidak masuk kategori Hatespeech tapi diberi tagar Hatespeech. Nilai akurasi tertinggi didapat dengan metode klasifikasi Naïve Bayes Classifier (NBC) dengan WEKA tanpa stopword list Bahasa Indonesia, didapat akurasi 82,1%, TP Rate 80,8%, FP Rate 16,4%, precision 83,1%, dan recall 80,8%. Dalam penelitian ini juga dapat diketahui metode klasifikasi Naïve Bayes Classifier (NBC) lebih tinggi akurasinya dibandingkan metode klasifikasi Support Vector Machine (SVM).

> Daftar Pustaka
> 
> Buntoro, G. A. (2016). Analisis Sentimen Hatespeech pada Twitter dengan Metode Naive Bayes Classifier dan Support Vector Machine. Jurnal Dinamika Informatika, 5(2).

[Click for more.](https://github.com/RyzAnugrah/hate-speech-sentiment)
