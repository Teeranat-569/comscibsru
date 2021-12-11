import 'package:flutter/material.dart';

import 'add_work5.dart';

class AddWork4 extends StatefulWidget {
  const AddWork4({Key? key}) : super(key: key);

  @override
  _AddWork4State createState() => _AddWork4State();
}

class _AddWork4State extends State<AddWork4> {
  dynamic _chosenValue, age, mission;
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
                Text(
                  'เบี้ยเลี้ยง/เงินเดือน',
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ageform(),
                    Text(
                      '/เดือน',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'สวัสดิการ',
                  style: TextStyle(fontSize: 15),
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
                      Text("โบนัส"),
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
                      Text("ประกันสังคม"),
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
                      Text("ประกันสุขภาพ"),
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
                      Text("ค่ารักษาพยาบาล"),
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
                      Text("ประกันโควิด"),
                    ]),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'สวัสดิการเพิ่มเติม',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                missionform(),
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

  Widget ageform() {
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            onChanged: (value) => age = value.trim(),
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

  Widget missionform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          maxLines: 6,
          textDirection: TextDirection.ltr,
          onChanged: (value) => mission = value.trim(),
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
          route(AddWork5());
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
