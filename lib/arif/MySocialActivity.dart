import 'package:flutter/material.dart';

class my_socialact extends StatelessWidget {
  late String Buttoname ='' ;
  my_socialact({super.key , required this.Buttoname});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Text(
            Buttoname ,
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
