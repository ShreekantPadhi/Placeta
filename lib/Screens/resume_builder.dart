import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_document/my_files/init.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:pdf/widgets.dart' as pw;

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  ResumeStateScreen createState() => ResumeStateScreen();
}

class ResumeStateScreen extends State<ResumePage> {
  final ResumePage service = ResumePage();
  int number = 0;
  //File file;
  final doc = pw.Document();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _linkedinController = TextEditingController();
  TextEditingController _educationController = TextEditingController();
  TextEditingController _projectController = TextEditingController();
  TextEditingController _internshipController = TextEditingController();
  TextEditingController _workExperienceController = TextEditingController();
  TextEditingController _hobbiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            title: const Text(
              "Build Your Resume",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Personal Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _phoneController,
                          decoration:
                              InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _linkedinController,
                          decoration: InputDecoration(labelText: 'LinkedIn'),
                          keyboardType: TextInputType.url,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Education',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _educationController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Qualifications',
                        hintText: 'Enter your qualifications here',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your qualifications';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Projects',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _projectController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Projects',
                        hintText: 'Enter your projects here',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your projects';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Internships',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _internshipController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Internships',
                        hintText: 'Enter your internships here',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your internships';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Work Experience',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _workExperienceController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Work Experience',
                        hintText: 'Enter your work experience here',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your work experience';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Hobbies',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _hobbiesController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Hobbies',
                        hintText: 'Enter your hobbies here',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        pdfservice();
                        //service.pdfservice("invoice_$number", data);
                        number++;
                      },
                      child: Text('Download as PDF'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<Uint8List?> pdfservice() async {
    if (_formKey.currentState!.validate()) {
// Create PDF
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Personal Information',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text('Name: ${_nameController.text}'),
              pw.Text('Phone Number: ${_phoneController.text}'),
              pw.Text('Email: ${_emailController.text}'),
              pw.Text('LinkedIn: ${_linkedinController.text}'),
              pw.SizedBox(height: 20),
              pw.Text(
                'Education',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(_educationController.text),
              pw.SizedBox(height: 20),
              pw.Text(
                'Projects',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(_projectController.text),
              pw.SizedBox(height: 20),
              pw.Text(
                'Internships',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(_internshipController.text),
              pw.SizedBox(height: 20),
              pw.Text(
                'Work Experience',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(_workExperienceController.text),
              pw.SizedBox(height: 20),
              pw.Text(
                'Hobbies',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(_hobbiesController.text),
            ],
          );
        }),
      );

      // return await pdf.save();
      await Permission.storage.request();
      if (await Permission.storage.isGranted) {
        // Save PDF to device
        final bytes = await pdf.save();
        final dir = '/storage/emulated/0/Download';
        final path =
            '${dir}/my_resume_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final file = File(
          path,
        );
        print(path);
        await file.writeAsBytes(bytes);
// Show snackbar with download link
        final snackBar = SnackBar(
          content: Text('Resume downloaded!'),
          action: SnackBarAction(
            label: 'Download',
            onPressed: () {
              Share.shareXFiles([XFile(path)]);
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    // void generateFile() async {
    //   doc.addPage(
    //     pw.Page(
    //         pageFormat: PdfPageFormat.a4,
    //         build: (pw.Context context) {
    //           return pw.Column(
    //             mainAxisAlignment: pw.MainAxisAlignment.center,
    //             children: [
    //               pw.Center(
    //                 child: pw.Text(
    //                   "Dummy PDF",
    //                   style: pw.TextStyle(
    //                     fontSize: 50.0,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           );
    //         }),
    //   );

    // final outPut = await getExternalStorageDirectory();

    // String pathToWrite = outPut!.path + '/example.pdf';
    // File outputFile = File(pathToWrite);
    // outputFile.writeAsBytesSync(doc.save());
  }
}
