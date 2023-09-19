# movieapp

MVVM mimarisi ve Swift programlama dili kullandım.

Network işlemleri için Alamofire kullandım.

Firebase analytics entegre ettim. Eventların konsola düştüğünü gözlemledim.

ImageView' ler için Kingfisher kullandım.

Servisten cevap beklenen süre için loading animasyonu ve ekran geçişi için animasyon ekledim.

Kullanıcı uygulamayı açtığında internet bağlantısı yoksa bir alert ile uyarı gösterdim. 

İnternet bağlantısı var ise firebase remote config özelliğini kullanarak ekrana 3 saniye kadar gözükecek texti bastırdım. 3 saniye sonunda ana sayfaya geçilmektedir.

Anasayfa açıldığında bir search alanı bulunmaktadır. Kullanıcı film aramak istediğinde girilen film ismiyle servise gidilmektedir. Servisten cevap gelene kadar sayfanın ortasında loading animasyonu gösterilir. Servisten gelen cevap filmler ekranda listelenmektedir. Eğer ki aranan kriterlere uygun film yoksa kullanıcıya "Aranan kriterlere uygun film bulunamamıştır." şeklinde uyarı gösterilmektedir.

Anasayfada listelenen bir filme tıklandığında film detay sayfası açılmaktadır. Ekran geçişinde animasyon kullanılmaktadır. Burada filmin detay bilgilerini almak için servise gidilmektedir.  Servisten cevap gelene kadar sayfanın ortasında loading animasyonu gösterilir. Servisten gelen bilgilere göre filmin resmi, ismi, imdb puanı, oyuncuları ve açıklaması gibi bilgiler ekrana basılır.



