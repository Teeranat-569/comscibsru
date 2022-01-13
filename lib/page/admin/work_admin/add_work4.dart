import 'package:flutter/material.dart';

import 'add_work5.dart';

class AddWork4 extends StatefulWidget {
  dynamic position,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,
      pathPIC,
      more3;
  AddWork4(
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
      this.pathPIC})
      : super(key: key);

  @override
  _AddWork4State createState() => _AddWork4State();
}

class _AddWork4State extends State<AddWork4> {
  dynamic salary, more4;
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
        appBar: AppBar(title: const Text('ประกาศรับสมัครงานด้านไอที')),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'เบี้ยเลี้ยง/เงินเดือน',
                  style: const TextStyle(fontSize: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    salaryform(),
                    const Text(
                      '/เดือน',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'สวัสดิการ',
                  style: const TextStyle(fontSize: 15),
                ),
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
                      Checkbox(
                        value: bonus,
                        onChanged: (value) {
                          setState(() {
                            bonus = value!;
                            print('kkkkkkkk$bonus');
                            bonus == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('เลือกสวัสดิการ โบนัส')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('ไม่เลือกสวัสดิการ โบนัส')));
                          });
                        },
                      ),
                      const Text("โบนัส"),
                      Checkbox(
                        value: social,
                        onChanged: (value) {
                          setState(() {
                            social = value!;
                            print('kkkkkkkk$social');

                            social == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('เลือกสวัสดิการ ประกันสังคม')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ประกันสังคม')));
                          });
                        },
                      ),
                      const Text("ประกันสังคม"),
                      Checkbox(
                        value: health,
                        onChanged: (value) {
                          setState(() {
                            health = value!;
                            print('kkkkkkkk$health');
                            health == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'เลือกสวัสดิการ ประกันสุขภาพ')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ประกันสุขภาพ')));
                          });
                        },
                      ),
                      const Text("ประกันสุขภาพ"),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
                      Checkbox(
                        value: people,
                        onChanged: (value) {
                          setState(() {
                            people = value!;
                            print('kkkkkkkk$people');
                            people == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('เลือกสวัสดิการ ประกันชีวิต')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ประกันชีวิต')));
                          });
                        },
                      ),
                      const Text("ประกันชีวิต"),
                      Checkbox(
                        value: timecost,
                        onChanged: (value) {
                          setState(() {
                            timecost = value!;
                            print('kkkkkkkk$timecost');
                            timecost == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('เลือกสวัสดิการ ค่าล่วงเวลา')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ค่าล่วงเวลา')));
                          });
                        },
                      ),
                      const Text("ค่าล่วงเวลา"),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
                      Checkbox(
                        value: hospital,
                        onChanged: (value) {
                          setState(() {
                            hospital = value!;
                            print('kkkkkkkk$hospital');
                            hospital == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'เลือกสวัสดิการ ค่ารักษาพยาบาล')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ค่ารักษาพยาบาล')));
                          });
                        },
                      ),
                      const Text("ค่ารักษาพยาบาล"),
                      Checkbox(
                        value: covid,
                        onChanged: (value) {
                          setState(() {
                            covid = value!;
                            print('kkkkkkkk$covid');
                            covid == true
                                ? const SnackBar(
                                    content: Text('เลือกสวัสดิการ ประกันโควิด'))
                                : const SnackBar(
                                    content:
                                        Text('ไม่เลือกสวัสดิการ ประกันโควิด'));
                          });
                        },
                      ),
                      const Text("ประกันโควิด"),
                    ]),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'สวัสดิการเพิ่มเติม',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                more4form(),
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

  Widget salaryform() {
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            onChanged: (value) => salary = value.trim(),
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

  Widget more4form() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          maxLines: 6,
          textDirection: TextDirection.ltr,
          onChanged: (value) => more4 = value.trim(),
          controller: textEditController2,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
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
          print(' workPosition: ${widget.position},');
          print('mission: ${widget.mission}');
          print('companyName:${widget.companyName},');
          print('workType: ${widget.worktype},');
          print('age: ${widget.age},');
          print('exp: ${widget.exp},');
          print(' gender:${widget.gender},');
          print(' more3 : ${widget.more3},');
          print('bonus: ${bonus},');
          print(' social: ${social},');
          print(' health:${health},');
          print('  timeCost:${timecost},');
          print(' hospital: ${hospital},');
          print('covid: ${covid},');
          print('people: ${people},');
          print(' more4 : ${more4},');
          print('salary: ${salary},');
          print('path:${widget.pathPIC},');
          if (more4 == null || more4 == '') more4 = 'ไม่มี';
          route(AddWork5(
            aboutCompany: widget.aboutCompany,
            age: widget.age,
            bonus: bonus,
            companyName: widget.companyName,
            covid: covid,
            exp: widget.exp,
            gender: widget.gender,
            health: health,
            hospital: hospital,
            mission: widget.mission,
            more3: widget.more3,
            people: people,
            position: widget.position,
            social: social,
            worktype: widget.worktype,
            more4: more4,
            timecost: timecost,
            salary: salary,
            pathPIC: widget.pathPIC,
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
