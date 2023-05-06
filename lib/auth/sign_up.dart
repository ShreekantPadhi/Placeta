import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:placeta/utils/routes.dart';
import 'package:placeta/utils/utils.dart';
import 'package:placeta/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  SignUpPage createState() => SignUpPage();
}

class SignUpPage extends State<Register> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 20),
                child: const Text(
                  'Create\nAccount',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Form(
                              key: _formKey,
                              child: Container(
                                child: Column(children: [
                                  TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: nameController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Name",
                                          prefixIcon: Icon(Icons.person),
                                          hintStyle: const TextStyle(
                                              color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Full Name";
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Email",
                                          prefixIcon: Icon(Icons.email),
                                          hintStyle: const TextStyle(
                                              color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Email";
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: "Password",
                                          prefixIcon: Icon(Icons.lock_open),
                                          hintStyle: const TextStyle(
                                              color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Password";
                                        }
                                        return null;
                                      }),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ]),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  title: "Sign up",
                                  loading: loading,
                                  onTap: () {
                                    signUp();
                                  })
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.loginRoute);
                                  },
                                  child: Text(
                                    "Log in",
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dialogebox(BuildContext context) {
    var alertDialog = AlertDialog(
      icon: const Icon(CupertinoIcons.check_mark_circled_solid),
      iconColor: Colors.black,
      title: const Text(
        "Student Registered Successfully",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.loginRoute);
          },
          style: const ButtonStyle(),
          child: const Text(
            'Login',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ],
    );

    showDialog(
        barrierColor: Colors.lightBlue,
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
        dialogebox(context);
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }
}
