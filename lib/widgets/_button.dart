import 'package:flutter/material.dart';

import '../colors.dart';

class GirisButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const GirisButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
    //  Row(
    //   children: [
    //     Expanded(
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 25),
    //         child: GestureDetector(
    //           onTap: onTap,
    //           child: ElevatedButton(
    //             onPressed: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => HomePage()),
    //               );
    //             },
    //             style: ElevatedButton.styleFrom(
    //                 backgroundColor: AppColors.red,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(15))),
    //             child: const Padding(
    //               padding: EdgeInsets.symmetric(vertical: 10),
    //               child: Text(
    //                 'Giriş Yap',
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 30,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
