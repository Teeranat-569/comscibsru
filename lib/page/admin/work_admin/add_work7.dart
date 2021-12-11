import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

class AddWork7 extends StatefulWidget {
  dynamic position,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,
      more3,
      bonus,
      social,
      health,
      timecost,
      hospital,
      covid,
      people,
      more4,
      amount,
      dateStop,
      name,
      phone,
      email,
      address,
      province,
      salary,
      area;
  AddWork7(
      {Key? key,
      this.mission,
      this.position,
      this.aboutCompany,
      this.companyName,
      this.worktype,
      this.age,
      this.exp,
      this.gender,
      this.more3,
      this.bonus,
      this.covid,
      this.health,
      this.hospital,
      this.people,
      this.social,
      this.more4,
      this.amount,
      this.dateStop,
      this.timecost,
      this.address,
      this.area,
      this.email,
      this.name,
      this.phone,
      this.salary,
      this.province})
      : super(key: key);

  @override
  _AddWork7State createState() => _AddWork7State();
}

class _AddWork7State extends State<AddWork7> {
  dynamic more7;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  var textEditController3 = TextEditingController();
  var textEditController4 = TextEditingController();
  var textEditController5 = TextEditingController();

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
                  'รายละเอียดเพิ่มเติม',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                more7form(),
                SizedBox(
                  width: 15,
                  height: 15,
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

  Widget more7form() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
          maxLines: 10,
          onChanged: (value) => more7 = value.trim(),
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
          print(' aboutCompany: ${widget.aboutCompany}');
          print('  amount: ${widget.amount}');
          print('  area: ${widget.area}');
          print('companyName:${widget.companyName},');
          print('mission: ${widget.mission}');
          print('  picCompany: ');
          print('province:${widget.province},');
          print('salary: ${widget.salary},');
          print(' status: open,');
          print(' workPosition: ${widget.position},');
          print('workType: ${widget.worktype},');
          print(' name: ${widget.name},');
          print('  phone:${widget.phone},');
          print('  email:${widget.email}');
          print(' address: ${widget.address},');
          print(' gender:${widget.gender},');
          print(' dateStop: ${widget.dateStop},');
          print(' more3 : ${widget.more3},');
          print(' more4: ${widget.more4},');
          print('  more7 : ${more7}');
          print('age: ${widget.age},');
          print('exp: ${widget.exp},');
          print('bonus: ${widget.bonus},');
          print(' social: ${widget.social},');
          print(' health:${widget.health},');
          print('  timeCost:${widget.timecost},');
          print(' hospital: ${widget.hospital},');
          print('covid: ${widget.covid},');
          print('people: ${widget.people},');
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

  CollectionReference users = FirebaseFirestore.instance.collection('work');
  Future<void> addUser() {
    return users.add({
      'aboutCompany': widget.aboutCompany,
      'amount': widget.amount,
      'area': widget.area,
      'companyName': widget.companyName,
      'mission': widget.mission,
      'picCompany': '',
      'province': widget.province,
      'salary': widget.salary,
      'status': 'open',
      'workPosition': widget.position,
      'workType': widget.worktype,
      'name': widget.name,
      'phone': widget.phone,
      'email': widget.email,
      'address': widget.address,
      'gender': widget.gender,
      'dateStop': widget.dateStop,
      'more3': widget.more3,
      'more4': widget.more4,
      'more7': more7,
      'age': widget.age,
      'exp': widget.exp,
      'bonus': widget.bonus,
      'social': widget.social,
      'health': widget.health,
      'timeCost': widget.timecost,
      'hospital': widget.hospital,
      'covid': widget.covid,
      'people': widget.people,
    }).then((value) {
      // ignore: avoid_print
      print("User Added");
      Fluttertoast.showToast(
        msg: "เพิ่มแหล่งความรู้สำเร็จ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.purple[100],
        textColor: Colors.black,
      );
      // ignore: avoid_print, invalid_return_type_for_catch_error
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }
}
