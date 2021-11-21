import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'link_model.dart';

class FdfManual extends StatefulWidget {
  const FdfManual({Key? key}) : super(key: key);

  @override
  _FdfManualState createState() => _FdfManualState();
}

class _FdfManualState extends State<FdfManual> {
  dynamic link, nameManual;
  List<dynamic> widgets2 = [];

  @override
  initState() {
    super.initState();
    readAlldata3();
  }

  Future<void> readAlldata3() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    link = preferences.getString('link');
    nameManual = preferences.getString('nameManual');
    await Firebase.initializeApp().then((value) async {
      // ignore: avoid_print
      print('success');
      // ignore: await_only_futures
      await FirebaseFirestore.instance
          .collection('manual')
          .snapshots()
          .listen((event) {
        // ignore: avoid_print
        print('snapshot = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          // ignore: avoid_print
          print('Map == $map');
          LinkModel model2 = LinkModel.fromMap(map);
          setState(() {
            widgets2.add(model2);
            link = model2.linkManual;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$nameManual',
                style: const TextStyle(fontFamily: 'Pridi', fontSize: 17),
              ),
            ),
            if (link != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.deepOrange,
                      child: SfPdfViewer.network('$link',
                          scrollDirection: PdfScrollDirection.horizontal)),
                ),
              )
            else
              Center(
                  child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text(
                    'กำลังดาวน์โหลดเอกสาร',
                    style: TextStyle(fontFamily: 'Pridi'),
                  ),
                  Text(
                    'โปรดรอสักครู่...',
                    style: TextStyle(fontFamily: 'Pridi'),
                  ),
                ],
              )),
          ],
        ),
      ),
    );
  }
}
