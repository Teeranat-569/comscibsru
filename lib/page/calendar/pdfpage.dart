import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage1 extends StatefulWidget {
  const PdfPage1({Key? key}) : super(key: key);

  @override
  _PdfPage1State createState() => _PdfPage1State();
}

class _PdfPage1State extends State<PdfPage1> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('edu').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return     Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Loading"),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('ปฏิทินวิชาการ'),
            backgroundColor: Colors.pink[900],
          ),
          body: Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SfPdfViewer.network(
                      data['link1'],
                      scrollDirection: PdfScrollDirection.horizontal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
