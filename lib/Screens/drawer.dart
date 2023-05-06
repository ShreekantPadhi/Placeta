import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placeta/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:placeta/utils/utils.dart';

//import 'package:share/share.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    const image1 =
        "https://tldcmarketing.blob.core.windows.net/blog/20-03-298/img/feature-01.jpgg";
    final userId = Utils.prefs.getString('id');
    final userEmail = Utils.prefs.getString('email');
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(104, 202, 240, 1),
        ),

        // color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('id', isEqualTo: userId)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return const Text("Some Error Occured");
                    }
                    //    final user = snapshot.data?.docs.first.data() as Map;
                    //final user = snapshot.data?.docs.first.data() as Map;
                    return UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(80, 85, 97, 1),
                      ),
                      margin: EdgeInsets.zero,
                      accountName: Text(
                        snapshot.data!.docs.first['Name'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      accountEmail:
                          Text(snapshot.data!.docs.first['Email'].toString()),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/002/002/403/original/man-with-beard-avatar-character-isolated-icon-free-vector.jpg"),
                      ),
                    );
                  }),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.profile);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_rounded,
                //CupertinoIcons.heart_circle,
                color: Colors.black,
              ),
              title: Text(
                "Saved Jobs",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.savedjobs);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.black,
              ),
              title: Text(
                "Share With Friends",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.sharewithfriends);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone_fill,
                color: Colors.black,
              ),
              title: Text(
                "Contact",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.contact);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrowshape_turn_up_left,
                color: Colors.black,
              ),
              title: Text(
                "LogOut",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                auth.signOut().then((value) =>
                    Navigator.pushNamed(context, MyRoutes.loginRoute).onError(
                        (error, stackTrace) =>
                            Utils().toastMessage(error.toString())));
              },
            )
          ],
        ),
      ),
    );
  }
}
