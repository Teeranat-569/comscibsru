import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/add_work6.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

import 'edit_data_workpage_admin.dart';

class EditDate extends StatefulWidget {
  dynamic position,
      docid,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,
      pathPIC,
      salary,
      more4,
      more3;

  EditDate({
    Key? key,
    this.docid,
    this.mission,
    this.position,
    this.aboutCompany,
    this.companyName,
    this.worktype,
    this.age,
    this.exp,
    this.gender,
    this.more3,
  }) : super(key: key);

  @override
  _EditDateState createState() => _EditDateState();
}

class _EditDateState extends State<EditDate> {
  dynamic _chosenValue, amount, mission, dateTimestop, dateThai, val;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  bool yes = false;
  bool no = false; var collection = FirebaseFirestore.instance.collection('work');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('ประกาศรับสมัครงานด้านไอที')),   floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                collection
                    .doc(widget
                        .docid) // <-- Doc ID where data should be updated.
                    .update({
                  'dateStop': dateThai,
                });
                route(EditDataWorkPage(docid: widget.docid));
                Fluttertoast.showToast(
                  msg: "แก้ไขสำเร็จ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.orange[100],
                  textColor: Colors.black,
                );
              },
              child: const Icon(
                Icons.save,
                size: 40.0,
              ),
              backgroundColor: Colors.pink,
              tooltip: 'บันทึกกิจกรรม',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'เวลาการปิดรับสมัคร',
                  style: TextStyle(fontSize: 22),
                ),
                dateStopform(),
                SizedBox(
                  height: 15,
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget amountform() {
    return Container(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            onChanged: (value) => amount = value.trim(),
            controller: textEditController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
           
            )),
      ),
    );
  }

  Widget dateStopform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: DateTimePicker(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'เลือกเวลาการปิดรับสมัคร',
          labelStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        initialValue: dateTimestop,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        // dateLabelText: 'เวลาการปิดรับสมัคร',
        onChanged: (val) {
          print('jjjjjjjjjjjjjjjjjjj' + val);
          setState(() {
            dateTimestop = val;
            DateTime tempDate = DateTime.parse(dateTimestop);
            print('gggggggggggggggggggggggggggggggggggggg $tempDate');
            // DateTime formatdaten = DateTime.parse(nn);
            var dateTimeWarning = DateFormat.yMMMMEEEEd();
            print('ttttttttttttttttttttttt' + dateTimeWarning.toString());
            dateThai = dateTimeWarning.formatInBuddhistCalendarThai(tempDate);
            print('deddddddddddddddddddddddddddddddddddd $dateThai');
          });
        },
        validator: (val) {
          print(val);
          return null;
        },
        onSaved: (val) {
          print(val);
        },
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
          print(' aboutCompany: ${widget.aboutCompany}');
          print(' workPosition: ${widget.position},');
          print('mission: ${widget.mission}');
          print('companyName:${widget.companyName},');
          print('workType: ${widget.worktype},');
          print('age: ${widget.age},');
          print('exp: ${widget.exp},');
          print(' gender:${widget.gender},');
          print(' more3 : ${widget.more3},');

          print(' more4 : ${widget.more4},');
          print('salary: ${widget.salary},');
          print('  amount: ${amount.toString()}');
          print(' dateStop: ${dateThai},');
          print('path:${widget.pathPIC},');
        
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
