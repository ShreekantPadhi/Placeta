// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:placeta/Screens/drawer.dart';
import 'package:placeta/utils/routes.dart';
import 'dart:async';

import 'package:placeta/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  PlacementHomePageState createState() => PlacementHomePageState();
}

class PlacementHomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text(
          'Placeta',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) =>
                    Navigator.pushNamed(context, MyRoutes.loginRoute).onError(
                        (error, stackTrace) =>
                            Utils().toastMessage(error.toString())));
              },
              icon: Icon(Icons.logout_outlined))
        ],
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(80, 85, 97, 1),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/register.png'),
                fit: BoxFit.cover)),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 1.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            _buildTile(
              context,
              'Profile',
              Icons.person,
            ),
            _buildTile(context, 'Company Hiring', Icons.work),
            _buildTile(context, 'Interview Tips', Icons.lightbulb_outline),
            _buildTile(context, 'Training', Icons.model_training),
            _buildTile(context, 'Resume Builder', Icons.file_copy),
            _buildTile(context, 'Contact Us', Icons.email),
            _buildTile(context, 'Settings', Icons.settings),
          ],
        ),
      ),
    );
  }
}

Widget _buildTile(BuildContext context, String title, IconData icon) {
  return GestureDetector(
    onTap: () {
      switch (title) {
        case 'Profile':
          Navigator.pushNamed(context, MyRoutes.profile);
          break;
        case 'Company Hiring':
          Navigator.pushNamed(context, MyRoutes.company);
          break;

        case 'Interview Tips':
          Navigator.pushNamed(context, MyRoutes.interviewtips);
          break;
        case 'Training':
          Navigator.pushNamed(context, MyRoutes.training);
          break;
        case 'Resume Builder':
          Navigator.pushNamed(context, MyRoutes.resume);
          break;
        case 'Contact Us':
          Navigator.pushNamed(context, MyRoutes.contact);
          break;
        case 'Settings':
          Navigator.pushNamed(context, MyRoutes.setting);
          break;
      }
    },
    child: Card(
      color: Colors.limeAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64.0),
          SizedBox(height: 8.0),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    ),
  );
}
