
import 'package:flutter/material.dart';

import 'pdfpage2edit.dart';
import 'pdfpage3edit.dart';
import 'pdfpageedit.dart';


// ignore: must_be_immutable
class CalendarAdmin extends StatefulWidget {
  String nameFormm;
  CalendarAdmin({
    Key? key,
    required this.nameFormm,
  }) : super(key: key);
  @override
  _CalendarAdminState createState() => _CalendarAdminState();
}
 _CalendarAdminState createState() => _CalendarAdminState();


class _CalendarAdminState extends State<CalendarAdmin> {
  dynamic link;

  Widget showGrid() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      childAspectRatio: 16 / 3,
      children: <Widget>[
        button1(),
        button2(),
        button3(),
      ],
    );
  }

  // ignore: deprecated_member_use
  RaisedButton

      // ignore: non_constant_identifier_names
      button1() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(const PdfPage1Edit());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: const [
              Text(
                'ปฏิทินวิชาการ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      button2() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(const PdfPage2Edit());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: const [
              Text(
                'กำหนดการลงทะเบียนเรียน ภาคปกติ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: deprecated_member_use
  RaisedButton
      // ignore: non_constant_identifier_names
      button3() {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          route(const PdfPage3Edit());
        },
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: const [
              Text(
                'กำหนดการลงทะเบียนเรียน ภาคพิเศษ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[50],
          toolbarHeight: 40,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
          ),
          title: const Text(
            'ปฏิทินวิชาการ',
            style: TextStyle(color: Colors.purple),
          )),
      body: Container(color: Colors.purple[50], child: showGrid()),
    );
  }
}
