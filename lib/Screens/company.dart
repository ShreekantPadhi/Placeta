import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  CompanyStateScreen createState() => CompanyStateScreen();
}

class CompanyStateScreen extends State<CompanyPage> {
  final firestore = FirebaseFirestore.instance.collection('users').snapshots();

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
              "Companies Hiring",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('company')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return const Text("Some Error Occured");
                      }
                      final jobs = snapshot.data?.docs ?? [];
                      return Column(
                        children: [
                          const Text(
                            'We are hiring!',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'We are a fast-growing tech company specializing in placement and training for Flutter developers. We are looking for talented and passionate individuals to join our team and help us build the best app in the market!',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          const SizedBox(height: 32.0),
                          const Text(
                            'Open Positions',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          if (jobs.isEmpty)
                            Text('No Jobs Avilable')
                          else
                            ...jobs.map(
                              (e) {
                                final data = e.data() as Map;
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(data['Name'].toString()),
                                      subtitle:
                                          Text(data['Description'].toString()),
                                      trailing: ElevatedButton(
                                        onPressed: () {
                                          showSnackBar(context);
                                        },
                                        child: Text('Apply'),
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                );
                              },
                            ),
                          const SizedBox(height: 32.0),
                          const Text(
                            'Why work with us?',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'At our company, we value creativity, collaboration, and continuous learning. We offer competitive salaries, flexible work arrangements, and opportunities for career growth and development. Join us and be part of a dynamic and supportive team!',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Applied successfully. Soon, You will get a call'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
