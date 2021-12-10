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
            // labelText: 'เกี่ยวกับบริษัท',
            // labelStyle: const TextStyle(
            //   fontSize: 16.0,
            //   color: Colors.grey,
            //   fontWeight: FontWeight.bold,
            // ),
          )),
    );
  }
  Widget buttonll() {
return  RaisedButton(
              child: const Text("Upload Image2",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onPressed: () async {
                // final results = await FilePicker.platform.pickFiles(
                //     allowMultiple: false,
                //     type: FileType.custom,
                //     allowedExtensions: ['png', 'jpg', 'jpeg']);
                // if (results == null) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('ไม่ได้เลือกรูปภาพ')));
                //   // ignore: avoid_returning_null_for_void
                //   return null;
                // }

                // final path = results.files.single.path;
                // final filename = results.files.single.name;
                // uploadFile(path!, filename).then((value) {
                //   print('**************************Done');
                //   print('66666666666666666666666 $path');
                //   print('jjjjjjjjjjjjjjjjjjj $filename');
                // });
                // // ignore: avoid_print
                // print('66666666666666666666666 $path');
                // // ignore: avoid_print
                // print('jjjjjjjjjjjjjjjjjjj $filename');
                // // UploadImage(context);
                Random random = Random();
                int i = random.nextInt(100000);
                uploadFile(pathPIC, 'img$i.jpg');
              },
              // onPressed: (){

              // },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.blue)),
              elevation: 5.0,
              color: Colors.blue,
              textColor: Colors.white,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              splashColor: Colors.grey,
            ),
  }
}
