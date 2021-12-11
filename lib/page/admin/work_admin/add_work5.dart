import 'package:comsci/page/admin/work_admin/add_work6.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

class AddWork5 extends StatefulWidget {
  const AddWork5({Key? key}) : super(key: key);

  @override
  _AddWork5State createState() => _AddWork5State();
}

class _AddWork5State extends State<AddWork5> {
  dynamic _chosenValue, amount, mission, dateTimestop, dateThai;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'จำนวนที่รับ',
                      style: TextStyle(fontSize: 15),
                    ),
                    amountform(),
                    Text(
                      'คน',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'เวลาการปิดรับสมัคร',
                  style: TextStyle(fontSize: 22),
                ),
                dateStopform(),
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

  Widget dropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'เพศ : ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>['ชาย', 'หญิง']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'Mitr'),
                  ),
                );
              }).toList(),
              hint: const Center(
                child: Text(
                  "เลือกเพศ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mitr'),
                ),
              ),
              onChanged: (dynamic value) {
                setState(() {
                  _chosenValue = value;
                  print(_chosenValue);
                  print('66666666666' + value);
                });
              },
            ),
          ),
        ),
      ],
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
              // labelText: 'ตำแหน่งงาน',
              // labelStyle: const TextStyle(
              //   fontSize: 16.0,
              //   fontWeight: FontWeight.bold,
              // ),
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
          route(AddWork6());
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
