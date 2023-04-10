import 'package:flutter/material.dart';

import '../colors.dart';

class Kvkk extends StatefulWidget {
  Kvkk({super.key});
  @override
  State<Kvkk> createState() => _KvkkState();
}

class _KvkkState extends State<Kvkk> {
  bool? _kvkkAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(height: 20,
        child: Row(
          children: [
            Checkbox(
              value: _kvkkAccepted,
              activeColor: AppColors.blue,
              onChanged: (newbool) {
                setState(
                  () {
                    _kvkkAccepted = newbool;
                  },
                );
              },
            ),
            const Text(
              'KVKK izinlerini okudum ve kabul ediyorum.',
              style:
                  TextStyle(color: AppColors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
