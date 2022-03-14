import 'package:flutter/material.dart';
import 'package:suhu/widgets/KonversiSuhu.dart';
import 'package:suhu/widgets/PerhitunganTerakhir.dart';
import 'package:suhu/widgets/RiwayatPerhitungan.dart';
import 'package:suhu/widgets/TargetPerhitungan.dart';
import 'package:suhu/widgets/inputSuhu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDrowpdown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void onDropdownChanged(Object? value) {
    return setState(() {
           selectedDrowpdown = value.toString();
              });
  }

  void Konversi(Object? value) {
    return setState(() {
      hasilPerhitungan = konversiSuhu() as double;
    });
  }
   void konversiSuhu() {
    return setState(() {
                      if(etInput.text.isNotEmpty){
                      switch (selectedDrowpdown) {
                        case  "Kelvin":
                          hasilPerhitungan = int.parse(etInput.text) + 273.15;
                          break;
                        case "Reamur":
                          hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
                          break;
                        case  "Fahrenheit":
                          hasilPerhitungan =(int.parse(etInput.text) * 9 / 5) + 32;
                          break;  
                      }
                      listHasil.add("Konversi dari " +
                      etInput.text +
                       " celcius ke " +
                      selectedDrowpdown +
                      " Dengan Hasil : " +
                      hasilPerhitungan.toString());
                      }
                    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            inputSuhu(etInput: etInput),
            const SizedBox(height: 8),
            TargetPerhitungan(selectedDrowpdown: selectedDrowpdown,
             listSatuanSuhu: listSatuanSuhu, onDropdownChanged: onDropdownChanged,
             Konversi: Konversi,
             ),
              const SizedBox(height: 10),
              const Text("Hasil",
              style: TextStyle(fontSize: 18),
              ),
              PerhitunganTerakhir(
                hasilPerhitungan: hasilPerhitungan),
              const SizedBox(
                height: 10),
              KonversiSuhu(
                onPressed: konversiSuhu,
              ),
              SizedBox(
                height: 10),
              Text(
                "Riwayat Konversi", 
              style: TextStyle(
                fontSize: 20),
              ),
              RiwayatPerhitungan(listHasil: listHasil)
          ],
      ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}








