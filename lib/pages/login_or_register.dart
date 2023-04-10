import 'package:app_jam_oua/pages/register_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void toogleScreens() {
    setState(
      () {
        showLoginPage = !showLoginPage;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(ShowRegisterPage: toogleScreens,);
      }
      else{
        return RegisterPage(
          showLoginPage: toogleScreens,
        );
      }
      
    }
  }