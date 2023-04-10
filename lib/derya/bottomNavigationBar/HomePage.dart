import 'package:app_jam_oua/arif/profilo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../colors.dart';
import '../listView.dart';
import 'bottom_navigation_controller.dart';
import 'eventCreate/eventPage.dart';

class MyIcons extends StatelessWidget {
  MyIcons({super.key});

  BottomNavigationController bottomNavigationController =
  Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => IndexedStack(
          index: bottomNavigationController.selectedIndex.value,
          children: [
            ListViewPage(),
            EventPage(),
            MyProfilePage(), //profil sayfasi gelecek
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.blue,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              //onTabChange: (){ 'sayfadan sayfaya gitme degisikligi yapilacak yer '}
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Ana Sayfa',
                ),
                GButton(
                  icon: Icons.add_circle,
                  text: 'Etkinlik Yarat',
                ),
                GButton(
                  icon: Icons.supervised_user_circle,
                  text: 'Profil',
                ),
              ],
              
              backgroundColor: AppColors.blue,
              color: Colors.white,
              activeColor: Colors.red,
              tabBackgroundColor: Colors.white,
              haptic: true,
              gap: 10,
              onTabChange: (value) {
                bottomNavigationController.changeIndex(value);
              },
            ),
          ),
        ), //navigation bar iconlari
      ),
    );
  }
}