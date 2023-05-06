import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:placeta/utils/routes.dart';

class SplashServices {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final User = auth.currentUser;

    if (User != null) {
      Timer(Duration(seconds: 2),
          () => Navigator.pushNamed(context, MyRoutes.homeRoute));
    } else {
      Timer(Duration(seconds: 2),
          () => Navigator.pushNamed(context, MyRoutes.loginRoute));
    }
  }
}
