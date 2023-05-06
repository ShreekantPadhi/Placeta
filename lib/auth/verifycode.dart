import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:placeta/utils/routes.dart';
import 'package:placeta/utils/utils.dart';

import '../widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;
  const VerifyCodeScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => VerifyCodeScreenState();
}

class VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final verificationCodeController = TextEditingController();
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
              padding: const EdgeInsets.all(80),
              child: const Text(
                'Verify Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                ),
              ),
            ),
            SingleChildScrollView(
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 250, horizontal: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: verificationCodeController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "6 digit code",
                                      prefixIcon: Icon(Icons.numbers),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter 6-digit Verification";
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: 50,
                              ),
                              RoundButton(
                                  title: "Verify",
                                  loading: loading,
                                  onTap: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    final credential =
                                        PhoneAuthProvider.credential(
                                            verificationId:
                                                widget.verificationId,
                                            smsCode: verificationCodeController
                                                .text
                                                .toString());
                                    try {
                                      await auth
                                          .signInWithCredential(credential);
                                      Navigator.pushNamed(
                                          context, MyRoutes.homeRoute);
                                    } catch (e) {
                                      setState(() {
                                        loading = false;
                                      });
                                      Utils().toastMessage(e.toString());
                                    }
                                  })
                            ]))))
          ]),
        ));
  }
}
