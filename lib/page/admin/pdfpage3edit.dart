import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'addactivity3.dart';

class PdfPage3Edit extends StatefulWidget {
  const PdfPage3Edit({Key? key}) : super(key: key);

  @override
  _PdfPage3EditState createState() => _PdfPage3EditState();
}

class _PdfPage3EditState extends State<PdfPage3Edit> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('regis_sprcial').snapshots();

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
            title: const Text('กำหนดการลงทะเบียนเรียน ภาคพิเศษ'),
            backgroundColor: Colors.pink[900],
          ),
floatingActionButton: FloatingActionButton(
          onPressed: () {
            route(const Activity3());
          },
          child: Column(
            children: const [
              Icon(
                Icons.edit,
                size: 30.0,
              ),
              Text(
                'แก้ไข',
                style: TextStyle(fontFamily: 'Sarabun'),
              )
            ],
          ),
          backgroundColor: Colors.orange[900],
          tooltip: 'บันทึกกิจกรรม',
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
                      data['link3'],
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
   // ignore: prefer_void_to_null
   Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
