// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:placeta/Screens/Sharewithfriends.dart';
import 'package:placeta/Screens/company.dart';
import 'package:placeta/Screens/home_page.dart';
import 'package:placeta/Screens/interviewtips.dart';
import 'package:placeta/Screens/jobs.dart';
import 'package:placeta/Screens/profile_edit.dart';
import 'package:placeta/Screens/savedjobs.dart';
import 'package:placeta/Screens/training.dart';
import 'package:placeta/auth/login_page.dart';
import 'package:placeta/Screens/setting.dart';
import 'package:placeta/auth/loginwithphone.dart';
import 'package:placeta/auth/sign_up.dart';
import 'package:placeta/Screens/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placeta/Screens/themes.dart';
import 'package:placeta/auth/verifycode.dart';
import 'package:placeta/utils/routes.dart';
import 'package:placeta/Screens/profile.dart';
import 'package:placeta/Screens/resume_builder.dart';
import 'package:placeta/Screens/contact.dart';
import 'package:placeta/Screens/open.dart';
import 'package:placeta/Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Placeta());
}

class Placeta extends StatelessWidget {
  const Placeta({super.key});

  @override
  Widget build(BuildContext context) {
    var verificationId;
    return MaterialApp(
      // home: const LoginPage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      // initialRoute: "/LoginPage()",
      routes: {
        "/": (context) => SplashPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const MyLogin(),
        MyRoutes.signupRoute: (context) => const Register(),
        MyRoutes.contact: (context) => const ContactScreen(),
        MyRoutes.setting: (context) => SettingsPage(),
        MyRoutes.interviewtips: (context) => InterviewPage(),
        MyRoutes.profile: (context) => ProfilePage(),
        MyRoutes.company: (context) => CompanyPage(),
        MyRoutes.jobs: (context) => JobsPage(),
        MyRoutes.resume: (context) => ResumePage(),
        MyRoutes.splash: (context) => SplashPage(),
        MyRoutes.loginwithphone: (context) => LoginWithPhoneNumber(),
        MyRoutes.verifycode: (context) => VerifyCodeScreen(
              verificationId: verificationId,
            ),
        MyRoutes.profiledit: (context) => ProfileEditPage(),
        MyRoutes.sharewithfriends: (context) => ShareWithFriends(),
        MyRoutes.training: (context) => TrainingPage(),
        MyRoutes.savedjobs: (context) => SavedJobs(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
