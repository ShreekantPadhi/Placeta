import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:placeta/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:placeta/utils/utils.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ProfileEditStateScreen createState() => ProfileEditStateScreen();
}

class ProfileEditStateScreen extends State<ProfileEditPage> {
  final idcontroller = FirebaseAuth.instance.currentUser!.uid.toString();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final courseController = TextEditingController();
  final tenthController = TextEditingController();
  final twelveController = TextEditingController();
  final graduationController = TextEditingController();
  final skillsController = TextEditingController();
  final internshipController = TextEditingController();
  final workexController = TextEditingController();
  final certificationController = TextEditingController();

  final firestore = FirebaseFirestore.instance.collection('users');
  //CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  await firestore.add({
                    'id': FirebaseAuth.instance.currentUser!.uid.toString(),
                    'Name': nameController.text,
                    'Email': emailController.text,
                    'Mobile': mobileController.text,
                    'Course': courseController.text,
                    '10th': tenthController.text,
                    '12th': twelveController.text,
                    'Graduation': graduationController.text,
                    'Skiils': skillsController.text,
                    'Internship': internshipController.text,
                    'Workex': workexController.text,
                    'Certification': certificationController.text
                  }).then((value) => print("User Profile Details Added"));

                  Utils.prefs.setString('email', emailController.text);
                  Utils.prefs.setString('name', nameController.text);
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.lime),
                ),
              ),
            ],
            title: const Text(
              "Build Your Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  // color: Colors.grey[300],

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Name";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter E-mail";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: mobileController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Mobile",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Mobile Number";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: courseController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Course ",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Course";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: tenthController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "10th Percentage",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter 10th Percentage";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: twelveController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "12th Percentage",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter 12th Percentage";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: graduationController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Graduation Average CGPA",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Average CGPA";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: skillsController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Skills",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Skills";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: internshipController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Internship",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Intership Details";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: workexController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Work Experience",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Work Experience";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: certificationController,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Certification Course",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Certification Course Deatils";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
