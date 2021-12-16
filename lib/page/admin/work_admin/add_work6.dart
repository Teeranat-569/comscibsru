import 'package:comsci/page/admin/work_admin/add_work7.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

class AddWork6 extends StatefulWidget {
  dynamic position,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,more4,
      amount,
      salary,
      pathPIC,
      dateStop,fast,
      more3;
      bool
      bonus,
      social,
      health,
      timecost,
      hospital,
      covid,
      people
      ;
  AddWork6(
      {Key? key,
      this.mission,
      this.position,
      this.aboutCompany,
      this.companyName,
      this.worktype,
      this.age,
      this.exp,
      this.gender,
      this.more3,this.fast,
      required this.bonus,
      required this.covid,
      required this.health,
      required this.hospital,
      required this.people,
      required this.social,
      this.more4,
      this.amount,
      this.dateStop,
      required this.timecost,
      this.salary,
      this.pathPIC})
      : super(key: key);

  @override
  _AddWork6State createState() => _AddWork6State();
}

class _AddWork6State extends State<AddWork6> {
  dynamic name, phone, email, address, province, area;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  var textEditController3 = TextEditingController();
  var textEditController4 = TextEditingController();
  var textEditController5 = TextEditingController();
  var textEditController6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('ประกาศรับสมัครงานด้านไอที')),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'ข้อมูลติดต่อกลับ',
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                nameform(),
                phoneform(),
                emailform(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
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
                const SizedBox(
                  width: 15,
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'อำเภอ/เขต',
                      style: const TextStyle(fontSize: 15),
                    ),
                    provinceform(),
                    const Text(
                      'จังหวัด',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    areaform(),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  buttonNext(),
                  const SizedBox(
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

  Widget areaform() {
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            onChanged: (value) => area = value.trim(),
            controller: textEditController6,
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
          print('  amount: ${widget.amount}');
          print(' dateStop: ${widget.dateStop},');
          print('  area: ${area}');
          print('province:${province},');
          print(' name: ${name},');
          print('  phone:${phone},');
          print('  email:${email}');
          print('path:${widget.pathPIC},');
          route(AddWork7(
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
            amount: widget.amount,
            dateStop: widget.dateStop,
            address: address,
            area: area,
            email: email,
            name: name,
            phone: phone,
            province: province,
            salary: widget.salary,
            pathPIC: widget.pathPIC,
            fast:widget.fast
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
