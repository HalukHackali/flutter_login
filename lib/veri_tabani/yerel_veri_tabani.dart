import 'dart:async';

import 'package:flutter_login/model/kiap.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class YerelVeriTabani {
  YerelVeriTabani._privateConstructor();

  static final YerelVeriTabani _nesne = YerelVeriTabani._privateConstructor();

  factory YerelVeriTabani() {
    return _nesne;
  }
  Database? _veriTabani;

  String _kitaplarTaboAdi = "kitaplar";
  String _idKitaplar = "id";
  String _isimKitaplar = "isim";
  String _olusturulmaTarihiKitaplar = "olusturulmaTarihi";

  Future<Database?> _veriTabaniniGetir() async {
    if (_veriTabani == null) {
      String dosyaYolu = await getDatabasesPath();
      String veriTabaniYolu = join(dosyaYolu, "yazar.db");
      _veriTabani = await openDatabase(
        veriTabaniYolu,
        version: 1,
        onCreate: _tabloOlustur,
      );
    }
    return _veriTabani;
  }

  FutureOr<void> _tabloOlustur(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "$_kitaplarTaboAdi" (
    "$_idKitaplar"    INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    "$_isimKitaplar"  TEXT NOT NULL,
    "$_olusturulmaTarihiKitaplar" INTEGER);
      ''');
  }

  Future<int> createKitap(Kitap kitap) async{
    Database? db = await _veriTabaniniGetir();
    if(db != null){
      return await db.insert(_kitaplarTaboAdi, kitap.mapeDonustur());
    } else{
      return -1;
    }
  }

}
