import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  ContactScreenState createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
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
            title: const Text(
              "Contact Us",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.phone),
                iconColor: Colors.white,
                title: const Text('Phone'),
                textColor: Colors.white,
                subtitle: const Text('+1 (555) 123-4567'),
                onTap: () {
                  // handle phone tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                iconColor: Colors.white,
                title: const Text('Email'),
                textColor: Colors.white,
                subtitle: const Text('contact@example.com'),
                onTap: () {
                  // handle email tap
                },
              ),
              // add more contact information here
            ],
          ),
        ));
  }
}
