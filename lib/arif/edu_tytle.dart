import 'package:flutter/material.dart';

class EduTittle extends StatelessWidget {

  final String education_name;
  final String education_percent;

  const EduTittle({
    super.key,
    required this.education_name,
    required this.education_percent,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(5.0),
        ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              education_name,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 250,
            height: 20,
            child: Image.asset(
              education_percent,
              //fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
