import 'package:comsci/page/admin/work_admin/add_work6.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

class AddWork5 extends StatefulWidget {
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
      salary,
      more4;
  AddWork5(
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
      this.salary,
      this.timecost})
      : super(key: key);

  @override
  _AddWork5State createState() => _AddWork5State();
}

class _AddWork5State extends State<AddWork5> {
  dynamic _chosenValue, amount, mission, dateTimestop, dateThai;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();

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
          print(' aboutCompany: ${widget.aboutCompany}');
          print(' workPosition: ${widget.position},');
          print('mission: ${widget.mission}');
          print('companyName:${widget.companyName},');
          print('workType: ${widget.worktype},');
          print('age: ${widget.age},');
          print('exp: ${widget.exp},');
          print(' gender:${widget.gender},');
          print(' more3 : ${widget.more3},');
          print('bonus: ${widget.bonus},');
          print(' social: ${widget.social},');
          print(' health:${widget.health},');
          print('  timeCost:${widget.timecost},');
          print(' hospital: ${widget.hospital},');
          print('covid: ${widget.covid},');
          print('people: ${widget.people},');
          print(' more4 : ${widget.more4},');
          print('salary: ${widget.salary},');
          print('  amount: ${amount.toString()}');
          print(' dateStop: ${dateThai},');
          route(AddWork6(
            aboutCompany: widget.aboutCompany,
            age: widget.age,
            bonus: widget.bonus,
            companyName: widget.companyName,
            covid: widget.covid,
            exp: widget.exp,
            gender: widget.gender,
            health: widget.health,
            hospital: widget.hospital,
            mission: widget.mission,
            more3: widget.more3,
            people: widget.people,
            position: widget.position,
            social: widget.social,
            worktype: widget.worktype,
            more4: widget.more4,
            timecost: widget.timecost,
            amount: amount.toString(),
            dateStop: dateThai,
            salary: widget.salary,
          ));
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
