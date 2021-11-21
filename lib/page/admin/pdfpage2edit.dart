// ignore_for_file: prefer_void_to_null

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'addactivity2.dart';

class PdfPage2Edit extends StatefulWidget {
  const PdfPage2Edit({Key? key}) : super(key: key);

  @override
  _PdfPage2EditState createState() => _PdfPage2EditState();
}

class _PdfPage2EditState extends State<PdfPage2Edit> {
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
           floatingActionButton: FloatingActionButton(
          onPressed: () {
            route(const Activity2());
          },
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.edit,
                size: 30.0,
              ),
              const Text(
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

   Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
