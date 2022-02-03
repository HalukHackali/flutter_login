import 'package:flutter/material.dart';
import 'package:flutter_login/model/kiap.dart';
import 'package:flutter_login/veri_tabani/yerel_veri_tabani.dart';

class KitaplarSayfasi extends StatelessWidget {
   KitaplarSayfasi({Key? key}) : super(key: key);

  final YerelVeriTabani _yerelVeriTabani = YerelVeriTabani();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kitaplar Sayfası"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _kitapEkle(context);
        },
      ),
    );
  }

  // KİTAP EKLE
  void _kitapEkle(BuildContext context) async{
    String kitapAdi = await _pencereAc(context, "Kitap Adı Giriniz") ?? " ";
    if(kitapAdi.isNotEmpty){
      Kitap yeniKitap = Kitap(kitapAdi, DateTime.now());
      int kitapIdsi = await _yerelVeriTabani.createKitap(yeniKitap);
      debugPrint("Kitap Idsi: " + kitapIdsi.toString());
    }
  }

  // PENCERE AÇ
  Future<String?> _pencereAc(BuildContext context, String baslik) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String sonuc = "";
        return AlertDialog(
          title: Text(baslik),
          content: TextField(
            keyboardType: TextInputType.text,
            onChanged: (String inputText) {
              sonuc = inputText;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("İptal"),
              onPressed: () {
                Navigator.pop(context, "");
              },
            ),
            TextButton(
              child: const Text(
                "Onayla",
              ),
              onPressed: () {
                Navigator.pop(context, sonuc.trim());
              },
            ),
          ],
        );
      },
    );
  }
}
