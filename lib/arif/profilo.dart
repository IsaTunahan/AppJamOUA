import 'dart:io';

import 'package:app_jam_oua/arif/edu_tab.dart';
import 'package:app_jam_oua/arif/fun_tab.dart';
import 'package:app_jam_oua/arif/fun_tytle.dart';
import 'package:app_jam_oua/arif/sign_upcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:image_picker/image_picker.dart';

class  MyProfilePage extends StatefulWidget {
   const MyProfilePage({super.key});
   // MyProfilePage({Key key}) : super(key: key);


  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}
class _MyProfilePageState extends State<MyProfilePage> {
void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

    SignUpController signUpController = Get.put(SignUpController());


  List<Widget> socialAct =[
    //Education
    //Fun
    my_socialact(Buttoname: 'Eğitim'),
    my_socialact(Buttoname: 'Etkinlik'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //appBar
        appBar: AppBar(actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],),

        body: Center(
          child: Column(
            children: [
              main_profilo(),


              //tab bar
              TabBar(tabs: socialAct),
              //tab bar view
              Expanded(
                child: TabBarView(
                  children: [
                    //edu page
                    //fun page
                    eduTab(),
                    funTab(),
                  ],
                ),
              ),


            ],
          ),
        ),

        //Buttom Navigator Bar
        //bottomNavigationBar: Container(color: const Color.fromARGB(255, 141, 139, 139), child: const MyIcons(),), //navigation bar iconlari
      ),
    );
  }
}

class main_profilo extends StatelessWidget {



  ImagePicker imagePicker =ImagePicker();

  main_profilo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          const SizedBox(
            height: 100,
            width: 100,
            child:CircleAvatar(
              radius: 50, // set the size of the circle avatar
              backgroundImage: AssetImage("lib/images/isa.jpg"),
            ),
            ),
            Positioned(
              bottom: 0,
              child: InkWell(
                child: Icon(Icons.edit),
                onTap: (){
                  print("Camera clicked");
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => bottomSheet(context),
                  );
                },
              ),
            ),
          Text('İsa Tunahan İslamoğlu'),
          Text('isatunahan18@gmail.com'),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      horizontal: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Chose profile photo",
            style : TextStyle(
              fontSize :20,
              fontWeight :FontWeight.bold
            ),
          ),
  
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                          Icons.image_outlined,
                          color: Colors.greenAccent,
                      ),
                       Text(
                        "Galery",
                        style : TextStyle(
                            fontSize :20,
                            fontWeight :FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    takePhoto(ImageSource.gallery);
                  },
                ),

                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.greenAccent,
                      ),
                       Text(
                        "Camera",
                        style : TextStyle(
                            fontSize :20,
                            fontWeight :FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    takePhoto(ImageSource.gallery);
                  },
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }
}

Future<void> takePhoto(ImageSource source) async {
  ImagePicker imagePicker =ImagePicker();
  File pickedFile;
  SignUpController signUpController = Get.find();
  final pickedImage =
  await imagePicker.pickImage(source: source, imageQuality: 100);

  pickedFile = File(pickedImage!.path);
  signUpController.setProfileImagePath(pickedFile.path);

  Get.back();

  // print(pickedFile);
}
