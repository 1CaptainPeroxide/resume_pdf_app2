import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

// Define colors for a more elegant and professional look
const PdfColor primaryColor = PdfColor.fromInt(0xff1976D2);
const PdfColor accentColor = PdfColor.fromInt(0xff64B5F6);
const PdfColor textColor = PdfColor.fromInt(0xff333333);
const PdfColor lightGrey = PdfColor.fromInt(0xffEEEEEE);

Future<pw.Document> generateResume() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Left column (1/3 width)
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  color: accentColor,
                  padding: const pw.EdgeInsets.all(20),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 120,
                        height: 120,
                        decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColors.white,
                        ),
                        child: pw.Center(
                          child: pw.Text(
                            'MK',
                            style: pw.TextStyle(
                              fontSize: 48,
                              fontWeight: pw.FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 20),
                      contactInfo('Phone', '+91-8541805152'),
                      contactInfo('Email', 'mohit21704@gmail.com'),
                      contactInfo('LinkedIn', 'linkedin.com/in/mohit2kumar'),
                      contactInfo('GitHub', 'github.com/1CaptainPeroxide'),
                      pw.SizedBox(height: 20),
                      sectionHeader('Technical Skills'),
                      skill('Languages', 'C++, Dart, SQL'),
                      skill('App Development', 'Android, Flutter'),
                      skill('Cloud/Databases', 'MySQL, Firebase, Cloud Firestore'),
                      skill('DevOps', 'Git, GitHub'),
                    ],
                  ),
                ),
              ),
              // Right column (2/3 width)
              pw.Expanded(
                flex: 2,
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(20),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Mohit Kumar',
                          style: pw.TextStyle(
                            fontSize: 28,
                            fontWeight: pw.FontWeight.bold,
                            color: primaryColor,
                          )),
                      pw.Text('Flutter Developer',
                          style: pw.TextStyle(fontSize: 18, color: textColor)),
                      pw.SizedBox(height: 20),
                      sectionHeader('Education'),
                      educationItem('Birla Institute of Technology, Mesra', '2022 - 2026', 'B.Tech in Computer Science', 'CGPA: 8.08'),
                      educationItem('Jvm Shyamali, Ranchi', '2021 - 2022', 'Class XII', 'Percentage: 93.0%'),
                      educationItem('Dav Public School, Bhawanathpur', '2019 - 2020', 'Class X', 'Percentage: 95.8%'),
                      pw.SizedBox(height: 20),
                      sectionHeader('Personal Projects'),
                      projectItem('TrexPlore | GitHub', [
                        'Designed and built a cross-platform mobile application for discovering travel spots.',
                        'Integrated Google Maps API and Places API for travel discovery.',
                        'In-app chat feature using Firestore for user communication.',
                        'Real-time user activity tracking on map.',
                        'Tech stack: Flutter, Firebase Firestore, Google Maps API.',
                      ]),
                      projectItem('CampusKart | GitHub', [
                        'Built a peer-to-peer second-hand marketplace mobile app for students.',
                        'Implemented Firebase Authentication for secure app access.',
                        'Users can upload, edit, and delete product listings.',
                        'WhatsApp redirect and call seller features for direct interaction.',
                        'Tech stack: Flutter, Firebase Firestore, GetX, WhatsApp API.',
                      ]),
                      projectItem('Network Traffic Analyzer | GitHub', [
                        'Desktop app for real-time network traffic analysis.',
                        'Used Scapy for packet capturing and PyQt5 for UI.',
                        'Real-time graphs and data visualization using Matplotlib.',
                        'Tracked TCP, UDP, ICMP packet statistics.',
                        'Tech stack: PyQt5, Scapy, Matplotlib, PyQtGraph.',
                      ]),
                      pw.SizedBox(height: 20),
                      sectionHeader('Achievements'),
                      bulletPoint('Solved 400+ coding problems on various platforms.'),
                      bulletPoint('Awarded special mention at HackABit hackathon 2023.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  return pdf;
}

pw.Widget sectionHeader(String title) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 10),
    child: pw.Text(
      title.toUpperCase(),
      style: pw.TextStyle(
        fontSize: 16,
        fontWeight: pw.FontWeight.bold,
        color: primaryColor,
      ),
    ),
  );
}

pw.Widget contactInfo(String label, String value) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 5),
    child: pw.RichText(
      text: pw.TextSpan(
        children: [
          pw.TextSpan(
            text: '$label: ',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
          pw.TextSpan(
            text: value,
            style: pw.TextStyle(
              color: PdfColors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

pw.Widget skill(String category, String skills) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 5),
    child: pw.RichText(
      text: pw.TextSpan(
        children: [
          pw.TextSpan(
            text: '$category: ',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
          pw.TextSpan(
            text: skills,
            style: pw.TextStyle(
              color: PdfColors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

pw.Widget educationItem(String institution, String year, String degree, String grade) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 10),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          institution,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: textColor),
        ),
        pw.Text(
          '$year - $degree',
          style: pw.TextStyle(fontStyle: pw.FontStyle.italic, color: textColor),
        ),
        pw.Text(
          grade,
          style: pw.TextStyle(color: textColor),
        ),
      ],
    ),
  );
}

pw.Widget projectItem(String title, List<String> details) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 15),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: textColor),
        ),
        ...details.map((detail) => bulletPoint(detail)),
      ],
    ),
  );
}

pw.Widget bulletPoint(String text) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(left: 10, top: 5),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 4,
          height: 4,
          margin: const pw.EdgeInsets.only(top: 3, right: 5),
          decoration: pw.BoxDecoration(
            color: accentColor,
            shape: pw.BoxShape.circle,
          ),
        ),
        pw.Expanded(
          child: pw.Text(text, style: pw.TextStyle(color: textColor)),
        ),
      ],
    ),
  );
}