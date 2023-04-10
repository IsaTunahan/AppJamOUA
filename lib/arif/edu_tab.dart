

import 'package:app_jam_oua/arif/edu_tytle.dart';
import 'package:flutter/material.dart';

class eduTab extends StatelessWidget {

 List edugation = [//[eğitimin adı , eğitimin yüzde resmi]
   [ "Flutter Hazırlık" , "lib/images/57.jpeg" ],
   [ "Flutter ile Uygulama Geliştirme Eğitimleri" , "lib/images/53.jpeg" ],
   [ "Flutter ile Örnek Uygulama Geliştirme" , "lib/images/52.jpeg" ],
   [ "Girişimcilik Eğitimleri" , "lib/images/54.jpeg" ],
   [ "Hukuk Eğitimleri" , "lib/images/56.jpeg" ],
   [ "Finans Eğitimleri" , "lib/images/57.jpeg" ],
   [ "insan Kaynakları Eğitimleri" , "lib/images/58.jpeg" ],
   [ "Yazılımcılar İçin İngilizce Eğitimleri" , "lib/images/58.jpeg" ],
 ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: edugation.length,
        itemBuilder: (BuildContext context, int index) {
          return EduTittle(
            education_name :edugation[index][0],
            education_percent :edugation[index][1],

          );
          },
      ),
    );
  }
}
