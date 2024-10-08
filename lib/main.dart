import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'resume_pdf.dart'; // Import the resume generator

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume PDF Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Use a modern font
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Future<pw.Document> _loadResume() async {
    return await generateResume(); // Generate the resume
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mohit Resume',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () async {
                  final pdfDoc = await _loadResume();
                  await Printing.layoutPdf(
                    onLayout: (PdfPageFormat format) async => pdfDoc.save(),
                  );
                },
                icon: Icon(Icons.picture_as_pdf),
                label: Text(
                  'View Resume',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Background color
                  onPrimary: Colors.blueAccent, // Text & icon color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 8, // Add shadow for better visual depth
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
