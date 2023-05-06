import 'package:flutter/material.dart';
import 'package:placeta/firebase%20services/splash_services.dart';
import 'package:placeta/utils/routes.dart';
import 'dart:async';

import 'package:placeta/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  SplashScreenPage createState() => SplashScreenPage();
}

class SplashScreenPage extends State<SplashPage> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    Utils.init();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, MyRoutes.loginRoute);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 188, 169, 1),
      body: Center(
        child: Image.asset(
          "assets/images/placeta-logo.png",
          width: 400,
          height: 500,
        ),
      ),
    );
  }
}
