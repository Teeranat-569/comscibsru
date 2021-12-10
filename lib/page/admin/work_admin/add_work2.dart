import 'package:flutter/material.dart';

import 'add_work3.dart';

class AddWork2 extends StatefulWidget {
  const AddWork2({Key? key}) : super(key: key);

  @override
  _AddWork2State createState() => _AddWork2State();
}

class _AddWork2State extends State<AddWork2> {
  dynamic _chosenValue, position, mission;
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
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                dropDown(),
                SizedBox(
                  height: 15,
                ),
                positionform(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'หน้าที่ความรับผิดชอบ',
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
          'รูปแบบงาน : ',
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
              items: <String>['พนักงานประจำ', 'นักศึกษาฝึกงาน']
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
                  "เลือกรูปแบบงาน",
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

  Widget positionform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          onChanged: (value) => position = value.trim(),
          controller: textEditController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            labelText: 'ตำแหน่งงาน',
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget missionform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          maxLines: 12,
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
          route(AddWork3());
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
