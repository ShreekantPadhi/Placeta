import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Job {
  String company;
  String title;
  String location;
  String description;
  int ctc;
  bool saved;

  Job(this.company, this.title, this.location, this.description, this.ctc,
      this.saved);
}

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  JobsStateScreen createState() => JobsStateScreen();
}

class JobsStateScreen extends State<JobsPage> {
  List<Job> jobs = [];

  //DatabaseReference databaseReference =
  // ignore: deprecated_member_use
  //FirebaseDatabase.instance.reference().child("jobs");

  @override
  void initState() {
    super.initState();
    // databaseReference.once().then((DataSnapshot snapshot) {
    //   Map<dynamic, dynamic> values = snapshot.value;
    //   values.forEach((key, value) {
    //     setState(() {
    //       jobs.add(Job(value['company'], value['title'], value['location'],
    //           value['description'], value['ctc'], false));
  }

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
              "Find Job",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Job Title',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      items: <String>[
                        'Software Engineer',
                        'Frontend Developer',
                        'Backend Developer',
                        'Mobile Developer'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Job Location',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      items: <String>[
                        'San Francisco',
                        'New York',
                        'Los Angeles',
                        'Chicago'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(jobs[index].title),
                        subtitle: Text(jobs[index].company),
                        trailing: IconButton(
                          icon: Icon(
                            jobs[index].saved
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: () {
                            setState(() {
                              jobs[index].saved = !jobs[index].saved;
                            });
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobDetailsPage(
                                company: jobs[index].company,
                                title: jobs[index].title,
                                location: jobs[index].location,
                                description: jobs[index].description,
                                ctc: jobs[index].ctc,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class JobDetailsPage extends StatelessWidget {
  final String company;

  final String title;
  final String location;
  final String description;
  final int ctc;

  JobDetailsPage(
      {required this.company,
      required this.title,
      required this.location,
      required this.description,
      required this.ctc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              company,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Location: $location',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'CTC: $ctc',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}
