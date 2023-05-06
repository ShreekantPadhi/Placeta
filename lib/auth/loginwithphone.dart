import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:placeta/auth/verifycode.dart';
//import 'package:placeta/utils/routes.dart';
import 'package:placeta/widgets/round_button.dart';
import 'package:placeta/utils/utils.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final phoneNumberController = TextEditingController();
  bool loading = false;

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(),
              Container(
                padding: const EdgeInsets.all(60),
                child: const Text(
                  'Login \n     With \n          Phone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                  ),
                ),
              ),
              SingleChildScrollView(
                  child: Container(
                      child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 250, horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phoneNumberController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Phone",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Phone Number";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 50,
                      ),
                      RoundButton(
                          title: "Login",
                          loading: loading,
                          onTap: () {
                            setState(() {
                              loading = true;
                            });

                            auth.verifyPhoneNumber(
                                phoneNumber: phoneNumberController.text,
                                verificationCompleted: (_) {
                                  setState(() {
                                    loading = false;
                                  });
                                },
                                verificationFailed: (e) {
                                  Utils().toastMessage(e.toString());
                                },
                                codeSent: (String verificationId, int? token) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VerifyCodeScreen(
                                            verificationId: verificationId),
                                      ));
                                  setState(() {
                                    loading = false;
                                  });
                                },
                                codeAutoRetrievalTimeout: (e) {
                                  Utils().toastMessage(e.toString());
                                  setState(() {
                                    loading = false;
                                  });
                                });
                          })
                    ]),
              )))
            ])));
  }
}
