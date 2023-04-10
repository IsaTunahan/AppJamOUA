import 'package:flutter/material.dart';

class funTab extends StatelessWidget {
  List<String> imagePathList = [
    'lib/images/1.jpeg',
    'lib/images/2.jpeg',
    'lib/images/3.jpeg',
    'lib/images/4.jpeg',
    'lib/images/5.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ListView.builder(
        itemCount: imagePathList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            imagePathList[index],
            fit: BoxFit.cover,
            height: 200,
            width: 200,
          );
        },
      )),
    );
  }
}
