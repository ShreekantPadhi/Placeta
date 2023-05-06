import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:placeta/utils/routes.dart';
import 'package:placeta/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfileStateScreen createState() => ProfileStateScreen();
}

class ProfileStateScreen extends State<ProfilePage> {
  final firestore = FirebaseFirestore.instance.collection('users').snapshots();

  dynamic data;

  final String email = "";
  final String phone = "";
  final String course = "";
  final String imageUrl =
      "https://static.vecteezy.com/system/resources/previews/002/002/403/original/man-with-beard-avatar-character-isolated-icon-free-vector.jpg";

  @override
  Widget build(BuildContext context) {
    final userId = Utils.prefs.getString('id');
    final userEmail = Utils.prefs.getString('email');
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/register.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.profiledit);
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.lime),
                ),
              ),
            ],
            title: const Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('id', isEqualTo: userId)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return const Text("Some Error Occured");
              } else {}
              //  final user = snapshot.data?.docs.first.data() as Map;

              return Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                color: Colors.grey[300],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      snapshot.data!.docs.first['Name'].toString(),
                      //user['Name'].toString(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.data!.docs.first['Email'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.data!.docs.first['Mobile'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.data!.docs.first['Course'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Container(
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Education Qualification',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    '10th : ' +
                                        snapshot.data!.docs.first['10th'] +
                                        "%".toString(),
                                    //snapshot.data!.docs.first['10th']
                                    // .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '12th : ' +
                                        snapshot.data!.docs.first['12th'] +
                                        "%".toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Graduation : ' +
                                        snapshot.data!.docs.first['Graduation']
                                            .toString() +
                                        ' CGPA',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Skill',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    snapshot.data!.docs.first['Skiils']
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Past Internships',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    snapshot.data!.docs.first['Internship']
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Work Experience',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    snapshot.data!.docs.first['Workex']
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Any Certification Course ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    snapshot.data!.docs.first['Certification']
                                        .toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
