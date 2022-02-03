# DATEBASE TABLE KISALTMALARININ ANLAMLARI

- NN(Not Null): Alan null olamaz. Ör. ID - İsim - Ad vs 
- PK(Primary Key): Birincil(asıl) alan. Satırları birbirinden ayıran asıl değer. Ör. ID
- AI(Auto Increment): Otomatik artsın. Ör. ID değeri otomatik artsın.
- U(Uniqe): Benzersiz olsun. Ör. ID - İsim benzersiz olsun.

ÖRNEK DB TABLOSU

----
````
CREATE TABLE "kitaplar" (
    "id"    INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    "isim"  TEXT NOT NULL,
    "yazar" TEXT,
    "sayfaSayisi"   INTEGER,
    "ilkBasimYili"  INTEGER
);
````
---- YADA ----
````
CREATE TABLE "kitaplar" (
    "id"    INTEGER NOT NULL UNIQUE,
    "isim"  TEXT NOT NULL,
    "yazar" TEXT,
    "sayfaSayisi"   INTEGER,
    "ilkBasimYili"  INTEGER,
    PRIMARY KEY("id" AUTOINCREMENT)
);
````
-----

# SINGLETON

**Singleton yazılım tasarım deseni,** bir sınıftan sadece tek bir nesne oluşturmamızı sağlar. 
Normal sınıflarla arasındaki fark, normal sınıflardan her bir nesne üretidiğinde her nesne farklıdır, 
bellekte de farklı konumlara işaret eder. Ancak sınıf **Singleton** yaparsak durum farklı olacaktır.
Bu durumda ilk nesneden sonra ikinci nesne oluşturulurken var olan nesne ikinci nesneye atanır.
Kısaca birinci ve ikinci nesneler aynı olur. Bellekte de aynı konuma işaret ederler. Nesnenin sınıfı
Singleton ise bu sınıfın constructor'u kaç kez çağırılırsa çağırılırsın sadece ilk seferinde bir 
nesne oluşturulacaktır ve her yerde oluşturulan bu tek nesne kullanılacaktır.

ÖR:

````
class YerelVeriTabani {
    YerelVeriTabani._privateConstructor();
    
    static final YerelVeriTabani _nesne = YerelVeriTabani._privateConstructor();
    
    factory YerelVeriTabani() {
        return _nesne;
    }
}
````
**NOT:** Factory constructor nesne oluşturmaz, başka bir constructr tarafından oluşturulan nesneyi 
düzenleyip döndürmemizi sağlar.

