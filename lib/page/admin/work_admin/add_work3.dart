import 'package:flutter/material.dart';

import 'add_work4.dart';

class AddWork3 extends StatefulWidget {
  dynamic position, mission, companyName, aboutCompany, worktype, pathPIC;
  AddWork3(
      {Key? key,
      this.mission,
      this.position,
      this.aboutCompany,
      this.companyName,
      this.worktype,
      this.pathPIC})
      : super(key: key);

  @override
  _AddWork3State createState() => _AddWork3State();
}

class _AddWork3State extends State<AddWork3> {
  dynamic _chosenValue, age, more, exp;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  var textEditController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('ประกาศรับสมัครงานด้านไอที')),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'คุณสมบัติ',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                dropDown(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'อายุ',
                      style: const TextStyle(fontSize: 15),
                    ),
                    ageform(),
                    const Text(
                      'ปี',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ประสบการณ์',
                      style: TextStyle(fontSize: 15),
                    ),
                    expform(),
                    const Text(
                      'ปี',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'คุณสมบัติเพิ่มเติม',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                moreform(),
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
        const SizedBox(),
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
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>['ชาย', 'หญิง', 'ชายและหญิง']
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
      width: 100,
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

  Widget expform() {
    return Container(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            onChanged: (value) => exp = value.trim(),
            controller: textEditController3,
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

  Widget moreform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          maxLines: 12,
          textDirection: TextDirection.ltr,
          onChanged: (value) => more = value.trim(),
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
          print('age: ${age},');
          print('exp: ${exp},');
          print(' gender:${_chosenValue},');
          print(' more3 : ${more},');
          print('path:${widget.pathPIC},');
          route(AddWork4(
            aboutCompany: widget.aboutCompany,
            age: age,
            companyName: widget.companyName,
            exp: exp,
            gender: _chosenValue,
            mission: widget.mission,
            more3: more,
            position: widget.position,
            worktype: widget.worktype,
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
