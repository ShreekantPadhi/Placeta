import 'package:flutter/material.dart';
import 'package:placeta/utils/routes.dart';
import 'dart:async';

class OpenPage extends StatefulWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  PlacementOpenPage createState() => PlacementOpenPage();
}

class PlacementOpenPage extends State<OpenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
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
