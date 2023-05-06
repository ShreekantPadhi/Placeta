import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  @override
  TrainingPageState createState() => TrainingPageState();
}

class TrainingPageState extends State<TrainingPage> {
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
            title: Text(
              'Training',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView(
            children: [
              topicCard('Web Development', [
                {
                  'question': 'What is HTML?',
                  'answer':
                      'HTML stands for Hypertext Markup Language and is used to create web pages.'
                },
                {
                  'question': 'What is CSS?',
                  'answer':
                      'CSS stands for Cascading Style Sheets and is used to style HTML elements.'
                },
                {
                  'question': 'What is JavaScript?',
                  'answer':
                      'JavaScript is a programming language used to create interactive web pages.'
                },
                {
                  'question': 'What is a responsive design?',
                  'answer':
                      'A responsive design is a design that adjusts to different screen sizes and devices.'
                },
                {
                  'question': 'What is a CMS?',
                  'answer':
                      'A CMS stands for Content Management System and is used to manage the content of a website.'
                },
                {
                  'question': 'What is a framework?',
                  'answer':
                      'A framework is a pre-built structure that can be used to build web applications.'
                },
                {
                  'question': 'What is a server?',
                  'answer':
                      'A server is a computer or program that provides data or services to other computers or programs over a network.'
                },
                {
                  'question': 'What is an API?',
                  'answer':
                      'An API stands for Application Programming Interface and is used to connect different software systems.'
                },
                {
                  'question': 'What is a database?',
                  'answer':
                      'A database is a collection of data that is organized in a way that allows for easy access, retrieval, and modification.'
                },
                {
                  'question': 'What is a domain name?',
                  'answer':
                      'A domain name is the address of a website on the internet.'
                }
              ]),
              topicCard('Mobile App Development', [
                {
                  'question': 'What is a native app?',
                  'answer':
                      'A native app is an app that is developed specifically for a particular platform, such as iOS or Android.'
                },
                {
                  'question': 'What is a hybrid app?',
                  'answer':
                      'A hybrid app is an app that is developed using web technologies and then wrapped in a native app shell.'
                },
                {
                  'question': 'What is a mobile web app?',
                  'answer':
                      'A mobile web app is an app that is accessed through a web browser on a mobile device.'
                },
                {
                  'question': 'What is a cross-platform app?',
                  'answer':
                      'A cross-platform app is an app that can be developed once and then run on multiple platforms, such as iOS and Android.'
                },
                {
                  'question': 'What is an SDK?',
                  'answer':
                      'An SDK stands for Software Development Kit and is a set of tools and resources used to develop software applications.'
                },
                {
                  'question': 'What is a UI framework?',
                  'answer':
                      'A UI framework is a pre-built set of user interface components that can be used to build an app.'
                },
                {
                  'question': 'What is a backend?',
                  'answer':
                      'A backend is the server-side of an app that handles tasks such as data storage and processing.'
                },
                {
                  'question': 'What is a REST API?',
                  'answer':
                      'A REST API stands for Representational State Transfer Application Programming Interface and is used to connect different software systems.'
                },
                {
                  'question': 'What is a push notification?',
                  'answer':
                      'A push notification is a message that is sent to a user’s device even when the app is not currently open.'
                },
                {
                  'question': 'What is mobile analytics?',
                  'answer':
                      'Mobile analytics is the practice of collecting and analyzing data from mobile apps to understand user behavior and improve the app.'
                }
              ]),
              topicCard('Data Science', [
                {
                  'question': 'What is data science?',
                  'answer':
                      'Data science is the practice of using data to gain insights and knowledge.'
                },
                {
                  'question': 'What is machine learning?',
                  'answer':
                      'Machine learning is a type of artificial intelligence that allows computers to learn from data without being explicitly programmed.'
                },
                {
                  'question': 'What is deep learning?',
                  'answer':
                      'Deep learning is a type of machine learning that uses neural networks with many layers to analyze and learn from data.'
                },
                {
                  'question': 'What is data mining?',
                  'answer':
                      'Data mining is the process of discovering patterns in large datasets.'
                },
                {
                  'question': 'What is predictive modeling?',
                  'answer':
                      'Predictive modeling is the practice of using data and statistical algorithms to make predictions about future events or behaviors.'
                },
                {
                  'question': 'What is data visualization?',
                  'answer':
                      'Data visualization is the practice of representing data in a visual or graphical format.'
                },
                {
                  'question': 'What is big data?',
                  'answer':
                      'Big data is a term used to describe extremely large datasets that cannot be analyzed using traditional data analysis techniques.'
                },
                {
                  'question': 'What is data preprocessing?',
                  'answer':
                      'Data preprocessing is the process of cleaning and transforming raw data to prepare it for analysis.'
                },
                {
                  'question': 'What is a decision tree?',
                  'answer':
                      'A decision tree is a type of machine learning algorithm that uses a tree-like structure to model decisions and their possible consequences.'
                },
                {
                  'question': 'What is natural language processing?',
                  'answer':
                      'Natural language processing is the practice of using computers to analyze and understand human language.'
                }
              ]),
              topicCard('Cloud Computing', [
                {
                  'question': 'What is cloud computing?',
                  'answer':
                      'Cloud computing is the practice of using remote servers on the internet to store, manage, and process data.'
                },
                {
                  'question': 'What is a cloud service provider?',
                  'answer':
                      'A cloud service provider is a company that offers cloud computing services, such as Amazon Web Services or Microsoft Azure.'
                },
                {
                  'question': 'What is a virtual machine?',
                  'answer':
                      'A virtual machine is a software program that emulates a computer system, allowing multiple virtual machines to run on a single physical machine.'
                },
                {
                  'question': 'What is serverless computing?',
                  'answer':
                      'Serverless computing is a cloud computing model where the cloud provider manages the infrastructure and automatically allocates resources based on demand.'
                },
                {
                  'question': 'What is a container?',
                  'answer':
                      'A container is a lightweight virtualization technology that allows multiple isolated applications to run on a single host system.'
                },
                {
                  'question': 'What is a microservice?',
                  'answer':
                      'A microservice is a small, independent component of an application that can be developed and deployed separately.'
                },
                {
                  'question': 'What is load balancing?',
                  'answer':
                      'Load balancing is the practice of distributing incoming network traffic across multiple servers to improve performance and reliability.'
                },
                {
                  'question': 'What is auto-scaling?',
                  'answer':
                      'Auto-scaling is a feature of cloud computing where the cloud provider automatically adjusts the amount of computing resources allocated to an application based on demand.'
                },
                {
                  'question': 'What is a CDN?',
                  'answer':
                      'A CDN stands for Content Delivery Network and is a network of servers that cache and deliver content to users from the server closest to them.'
                },
                {
                  'question': 'What is cloud security?',
                  'answer':
                      'Cloud security refers to the measures taken to protect data and infrastructure in a cloud computing environment.'
                }
              ]),
              topicCard('Cybersecurity', [
                {
                  'question': 'What is cybersecurity?',
                  'answer':
                      'Cybersecurity is the practice of protecting computer systems, networks, and data from theft, damage, or unauthorized access.'
                },
                {
                  'question': 'What is a firewall?',
                  'answer':
                      'A firewall is a network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules.'
                },
                {
                  'question': 'What is encryption?',
                  'answer':
                      'Encryption is the process of converting data into a code to prevent unauthorized access.'
                },
                {
                  'question': 'What is a VPN?',
                  'answer':
                      'A VPN, or Virtual Private Network, is a secure network connection that allows users to access the internet or a private network remotely.'
                },
                {
                  'question': 'What is a malware?',
                  'answer':
                      'Malware is a type of software designed to harm computer systems, steal data, or disrupt normal computer operations.'
                },
                {
                  'question': 'What is phishing?',
                  'answer':
                      'Phishing is a type of cyber attack where attackers impersonate a trusted entity to obtain sensitive information such as passwords or credit card numbers.'
                },
                {
                  'question': 'What is a DDoS attack?',
                  'answer':
                      'A DDoS, or Distributed Denial of Service, attack is a type of cyber attack where multiple systems flood a targeted system with traffic to overload and shut it down.'
                },
                {
                  'question': 'What is two-factor authentication?',
                  'answer':
                      'Two-factor authentication is a security process that requires users to provide two forms of identification, typically a password and a code sent to their phone or email.'
                },
                {
                  'question': 'What is a vulnerability assessment?',
                  'answer':
                      'A vulnerability assessment is the process of identifying weaknesses or vulnerabilities in a computer system or network.'
                },
                {
                  'question': 'What is a penetration testing?',
                  'answer':
                      'Penetration testing is the process of simulating an attack on a computer system or network to identify vulnerabilities and assess security measures.'
                }
              ]),
              topicCard('Digital Marketing', [
                {
                  'question': 'What is digital marketing?',
                  'answer':
                      'Digital marketing is the practice of promoting products or services using digital channels, such as search engines, social media, email, and websites.'
                },
                {
                  'question': 'What is SEO?',
                  'answer':
                      'SEO, or Search Engine Optimization, is the practice of optimizing websites or content to rank higher in search engine results pages.'
                },
                {
                  'question': 'What is PPC?',
                  'answer':
                      'PPC, or Pay-Per-Click, is an advertising model where advertisers pay each time a user clicks on one of their ads.'
                },
                {
                  'question': 'What is social media marketing?',
                  'answer':
                      'Social media marketing is the practice of using social media platforms to promote products or services.'
                },
                {
                  'question': 'What is email marketing?',
                  'answer':
                      'Email marketing is the practice of sending promotional messages to a group of people via email.'
                },
                {
                  'question': 'What is content marketing?',
                  'answer':
                      'Content marketing is the practice of creating and sharing valuable content to attract and retain a clearly defined audience.'
                },
                {
                  'question': 'What is influencer marketing?',
                  'answer':
                      'Influencer marketing is the practice of partnering with individuals who have a large following on social media to promote products or services.'
                },
                {
                  'question': 'What is affiliate marketing?',
                  'answer':
                      'Affiliate marketing is the practice of earning a commission by promoting other peoples or companys products.'
                },
                {
                  'question': 'What is conversion rate optimization?',
                  'answer':
                      'Conversionrate optimization is the process of improving the percentage of website visitors who take a desired action, such as making a purchase or filling out a form.'
                },
                {
                  'question': 'What is customer segmentation?',
                  'answer':
                      'Customer segmentation is the process of dividing customers into groups based on shared characteristics or behaviors to better tailor marketing efforts.'
                }
              ]),
            ],
          ),
        ));
  }

  Widget topicCard(String topic, List<Map<String, String>> questions) {
    return Container(
      decoration: const BoxDecoration(
          //color: Color(Colors.lightBlue),
          // image: DecorationImage(
          //   image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
          ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                topic,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                    questions[index]['question']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        questions[index]['answer']!,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
