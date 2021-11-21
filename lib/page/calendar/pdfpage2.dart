import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage2 extends StatefulWidget {
  const PdfPage2({Key? key}) : super(key: key);

  @override
  _PdfPage2State createState() => _PdfPage2State();
}

class _PdfPage2State extends State<PdfPage2> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('regis').snapshots();

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
            title: const Text('กำหนดการลงทะเบียนเรียน ภาคปกติ'),
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
                      data['link2'],
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
