import 'package:app_jam_oua/elif/elif.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'bottomNavigationBar/listView_Shape.dart';

class ListViewPage extends StatelessWidget {
  //const HomePage({super.key});
  List<String> imagePathList = [
    'lib/images/1.jpeg',
    'lib/images/2.jpeg',
    'lib/images/3.jpeg',
    'lib/images/4.jpeg',
    'lib/images/5.jpeg',
  ];
  final List _etkinlik = [
    //firebase kaydedilen etkinliklerden buraya getiricez!!
    'lib/images/logo.co',
    'etkinlik 2',
    'etkinlik 3',
    'etkinlik 4',
    'etkinlik 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        title: const Text('Etkinlikler'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 668, // ????
                child: SizedBox(
                  height: 500,
                  child: Container(
                    child: ListView.builder(
                      itemCount: imagePathList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Image.asset(
                              imagePathList[index],
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context){return Detay();}));
                                    },
                                    child: Text('Detaylar'),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                          thickness: 1,
                          color: AppColors.red,
                        ),
                   
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
