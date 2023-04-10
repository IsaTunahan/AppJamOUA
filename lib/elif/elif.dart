import 'package:app_jam_oua/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detay extends StatefulWidget {
  const Detay({super.key});

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  //late GoogleMapController mapController;
  //final LatLng _center = const LatLng(37.7749, -122.4194);
  int kisi_sayisi = 1;
  bool isButtonClikable = true;
  bool isButtonClikable1 = false;

  void ButtonFunction() {
    setState(() {
      isButtonClikable = false;
    });
  }

  void ButtonFunction1() {
    setState(() {
      isButtonClikable1 = true;
    });
  }

  void kisi_increase() {
    setState(() {
      kisi_sayisi++;
    });
  }

  void kisi_decrease() {
    setState(() {
      kisi_sayisi--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.grey[300],
        drawer: Drawer(
          
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                SizedBox(
                    height: 100,
                    width: 100,
                    child:CircleAvatar(
                 radius: 50, // set the size of the circle avatar
                 backgroundImage: AssetImage("lib/images/isa.jpg"),
                    ),
                    ),
                    SizedBox(height: 15,),
                    Text('İsa Tunahan'),
              SizedBox(height: 550,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red),
                  onPressed: () {},
                  child: const Center(
                    child: Text(
                      "Kullanıcıyı Engelle",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
        body: ListView(
          children: [
            Center(
              
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(height: 80,width: 400, color: Colors.white,
                  child: Text(
                    "Flutter 📱🏆",
                    textScaleFactor: 4,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              
              
              //etkinlik açıklaması yazılacak
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Container(
                child: Center(
                    child: Image.asset('lib/images/detay.png'),),
                //ETKİNLİK AYRINTILARI YAZILACAK
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Container(
                child: Center(
                  child:
                      Text("$kisi_sayisi kişi katılıyor!", textScaleFactor: 2),
                ),

                //KAÇ KİŞİNİN GELECEĞİ YAZACAK
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Container(
                //DAVET EDEN KİŞİNİN PROFİLİ
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [SizedBox(width: 20,),
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: CircleAvatar(
                        radius: 25, // set the size of the circle avatar
                        backgroundImage: AssetImage(
                          "lib/images/kullanıcı.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Text('Arif Yardım',style: TextStyle(fontSize: 30),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Opacity(
                  opacity: isButtonClikable ? 1.0 : 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isButtonClikable) {
                        kisi_increase();
                        ButtonFunction();
                      }
                    },
                    // ignore: sort_child_properties_last
                    child: Text("KATIL"),
            
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 50),
                        textStyle: const TextStyle(
                            fontSize: 28, fontStyle: FontStyle.normal),
                        primary: AppColors.green,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Opacity(
                opacity: isButtonClikable ? 0.0 : 1.0,
                child: ElevatedButton(
                  onPressed: () {
                    kisi_decrease();
                    isButtonClikable = true;
                  },
                  child: Text("VAZGEÇ"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 50),
                      textStyle: const TextStyle(
                          fontSize: 28, fontStyle: FontStyle.normal),
                      primary: Colors.lightGreen,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            )
          ],
        ),
        appBar: AppBar(
          backgroundColor: AppColors.red,
          title: const Center(
              child: Text(
            "Etkinlik Detay",
            style: TextStyle(
                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 25),
          )),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Mesaj_sayfasi();
                }));
              },
              icon: Icon(Icons.message_outlined),
            ),
          ],
        ));
  }
}

class Mesaj_sayfasi extends StatefulWidget {
  const Mesaj_sayfasi({super.key});

  @override
  State<Mesaj_sayfasi> createState() => _Mesaj_sayfasiState();
}

class _Mesaj_sayfasiState extends State<Mesaj_sayfasi> {
  TextEditingController t1 = TextEditingController();
  List mesajlar = [];
  gonder() {
    setState(() {
      mesajlar.add(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: ListView.builder(
              itemCount: mesajlar.length,
              itemBuilder: (context, indexno) => Text(mesajlar[indexno]),
            )),
            TextField(
              controller: t1,
            ),
            ElevatedButton(onPressed: gonder, child: Text("gönder"))
          ],
        ),
      ),
    );
  }
}
