import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class ExManual extends StatefulWidget {
  String nameFormm;
  ExManual({Key? key, required this.nameFormm}) : super(key: key);
  @override
  _ExManualState createState() => _ExManualState();
}

class _ExManualState extends State<ExManual> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('ตัวอย่างคู่มือ'),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.deepOrange,
              // ignore: unnecessary_string_interpolations
              child: SfPdfViewer.network('${widget.nameFormm}'))),
    );
  }
}
