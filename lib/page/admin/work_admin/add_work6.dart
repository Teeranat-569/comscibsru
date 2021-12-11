import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

class AddWork6 extends StatefulWidget {
  const AddWork6({Key? key}) : super(key: key);

  @override
  _AddWork6State createState() => _AddWork6State();
}

class _AddWork6State extends State<AddWork6> {
  dynamic amount,
      mission,
      dateTimestop,
      dateThai,
      name,
      phone,
      email,
      address,
      province;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  var textEditController3 = TextEditingController();
  var textEditController4 = TextEditingController();
  var textEditController5 = TextEditingController();
  bool bonus = false;
  bool social = false;
  bool health = false;
  bool timecost = false;
  bool hospital = false;
  bool covid = false;
  bool people = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('ประกาศรับสมัครงานด้านไอที')),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'ข้อมูลติดต่อกลับ',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                nameform(),
                phoneform(),
                emailform(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'ที่อยู่ที่สามารถติดต่อได้',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                addressform(),
                SizedBox(
                  width: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'ที่อยู่ที่สามารถติดต่อได้',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'ที่อยู่ที่สามารถติดต่อได้',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                 provinceform().
                    Text(
                      'ที่อยู่ที่สามารถติดต่อได้',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  buttonNext(),
                  SizedBox(
                    width: 15,
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nameform() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
          onChanged: (value) => name = value.trim(),
          controller: textEditController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            labelText: 'ชื่อ - นามสกุล',
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget phoneform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          onChanged: (value) => phone = value.trim(),
          controller: textEditController2,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            labelText: 'เบอร์โทร',
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget emailform() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
          onChanged: (value) => email = value.trim(),
          controller: textEditController3,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            labelText: 'E-mail',
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget addressform() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
          maxLines: 4,
          onChanged: (value) => address = value.trim(),
          controller: textEditController4,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            // labelText: 'ที่อยู่ที่สามารถติดต่อได้',
            // labelStyle: const TextStyle(
            //   fontSize: 16.0,
            //   fontWeight: FontWeight.bold,
            // ),
          )),
    );
  }

  Widget provinceform() {
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            onChanged: (value) => province = value.trim(),
            controller: textEditController5,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              // labelText: 'ตำแหน่งงาน',
              // labelStyle: const TextStyle(
              //   fontSize: 16.0,
              //   fontWeight: FontWeight.bold,
              // ),
            )),
      ),
    );
  }

  Widget buttonNext() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: const Text("ถัดไป",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () async {
          // route(AddWork2());
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: const BorderSide(color: Colors.purple)),
        color: Colors.purple,
        textColor: Colors.white,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        splashColor: Colors.grey,
      ),
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }
}
