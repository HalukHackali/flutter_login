class Kitap {
  int? id;
  String isim;
  DateTime olusturulmaTarihi;

  Kitap(this.isim, this.olusturulmaTarihi);

  Map<String, dynamic> mapeDonustur() {
    return {
      "id" : this.id,
      "isim" : this.isim,
      "olusturulmaTarihi" : this.olusturulmaTarihi.millisecondsSinceEpoch,
    };
  }

}