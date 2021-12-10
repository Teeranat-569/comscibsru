import 'package:comsci/page/admin/work_admin/add_work2.dart';
import 'package:flutter/material.dart';

class AddWork extends StatefulWidget {
  const AddWork({Key? key}) : super(key: key);

  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  dynamic companyName, aboutCompany;
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
                  height: 10,
                ),
                Text(
                  'รูปภาพบริษัท',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                //showImage
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_upload,
                      size: 40,
                    )),
                SizedBox(
                  height: 15,
                ),
                // Text(
                //   'ชื่อบริษัท',
                //   style: TextStyle(fontSize: 15),
                // ),
                companyNameform(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'เกี่ยวกับบริษัท',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                companyAboutform(),
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

  //  Widget showImage2() {
  //   return Container(
  //       decoration: BoxDecoration(
  //           color: Colors.grey[200],
  //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //       width: 355.0,
  //       height: 300.0,
  //       child: _image == null
  //           ? Center(child: Text('ไม่ได้อัปโหลดรูปภาพ'))
  //           : ClipRect(
  //               child: InteractiveViewer(
  //                   maxScale: 20, child: Image.file(_image))));
  // }
  Widget companyNameform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          onChanged: (value) => companyName = value.trim(),
          controller: textEditController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            labelText: 'ระบุชื่อบริษัท',
            labelStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget companyAboutform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          maxLines: 10,
          textDirection: TextDirection.ltr,
          onChanged: (value) => aboutCompany = value.trim(),
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
          route(AddWork2());
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
