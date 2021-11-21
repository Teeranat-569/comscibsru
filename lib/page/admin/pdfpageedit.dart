import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'addactivity1.dart';

class PdfPage1Edit extends StatefulWidget {
  const PdfPage1Edit({Key? key}) : super(key: key);

  @override
  _PdfPage1EditState createState() => _PdfPage1EditState();
}

class _PdfPage1EditState extends State<PdfPage1Edit> {
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              route(const Activity());
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

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
