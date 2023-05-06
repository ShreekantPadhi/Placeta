//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InterviewPage extends StatefulWidget {
  const InterviewPage({super.key});

  @override
  InterviewStateScreen createState() => InterviewStateScreen();
}

class InterviewStateScreen extends State<InterviewPage> {
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
              "Interview Tips",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              ListTile(
                title: Text('Research the company'),
                subtitle: Text('Learn about the company and its values.'),
                leading: Icon(Icons.search),
              ),
              ListTile(
                title: Text('Prepare for common questions'),
                subtitle:
                    Text('Practice answering common interview questions.'),
                leading: Icon(Icons.question_answer),
              ),
              ListTile(
                title: Text('Dress appropriately'),
                subtitle: Text('Wear professional attire.'),
                leading: Icon(Icons.accessibility),
              ),
              ListTile(
                title: Text('Arrive on time'),
                subtitle: Text('Plan to arrive 10-15 minutes early.'),
                leading: Icon(Icons.timer),
              ),
              ListTile(
                title: Text('Follow up after the interview'),
                subtitle: Text('Send a thank-you email or note.'),
                leading: Icon(Icons.email),
              ),
            ],
          ),
        ));
  }
}
