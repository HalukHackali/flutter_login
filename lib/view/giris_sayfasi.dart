import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GirisSayfasi extends StatelessWidget {
  GirisSayfasi({Key? key}) : super(key: key);

  final TextEditingController _sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Sayfası"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hoşgeldiniz!\nBir Şifre Belirleyin",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _sifreController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Şifre giriniz",
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text("Kaydet"),
            onPressed: _sifreyiKaydet,
          )
        ],
      ),
    );
  }

  void _sifreyiKaydet() async{
    String girilenSifre = _sifreController.text;

    if(girilenSifre.isNotEmpty){
      SharedPreferences pref = await SharedPreferences.getInstance(); // SharedPreferences sınıfının varsayılan ilk nesnesini çağırdık
      await pref.setString("sifre", girilenSifre); // pref nesnesi aracılığı ile setString fonksiyonunu çağırıyoruz(ilk parametre "key" ikinci parametre "value")
    }
  }
}
