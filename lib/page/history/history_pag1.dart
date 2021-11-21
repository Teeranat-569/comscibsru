import 'package:flutter/material.dart';

class HistoryPag1 extends StatefulWidget {
  const HistoryPag1({Key? key}) : super(key: key);

  @override
  _HistoryPag1State createState() => _HistoryPag1State();
}

class _HistoryPag1State extends State<HistoryPag1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title: const Text(
          "ประวัติสาขาวิทยาการคอมพิวเตอร์",
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 40,
        elevation: 0.00,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'images/logo_com.jpg',
            width: 900,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          '''\t\t\t\t\t\tในปี พ.ศ. 2532 ภาควิชาคอมพิวเตอร์ คณะวิทยาศาสตร์และเทคโนโลยี วิทยาลัยครูบ้านสมเด็จเจ้าพระยาได้เปิดสอนหลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ โดยใช้หลักสูตรของวิทยาลัยครู สังกัดกรมการฝึกหัดครู กระทรวงศึกษาธิการ ''',
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '''\t\t\t\t\t\tในปี พ.ศ. 2535 วิทยาลัยครูบ้านสมเด็จเจ้าพระยาได้รับพระราชทานนามใหม่ว่า “สถาบันราชภัฏบ้านสมเด็จเจ้าพระยา” หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ จึงปรับมาใช้หลักสูตรของสถาบันราชภัฏ ต่อมาสาขาวิชาวิทยาการคอมพิวเตอร์ได้ปรับปรุงหลักสูตรของสาขาวิชาตามรอบการปรับปรุงหลักสูตรในปีการศึกษา 2551 และปีการศึกษา 2555''',
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '''\t\t\t\t\t\tปัจจุบันได้มีการปรับปรุงหลักสูตร 2565 เพื่อให้ตอบรับกับความต้องการของตลาดและผู้ใช้บัณฑิตในยุคดิจิทัล อีกทั้ง สาขาวิชาได้มีการพัฒนาและปรับปรุงหลักสูตรให้มีคุณภาพและทันต่อการเปลี่ยนแปลงของเทคโนโลยีมาอย่างต่อเนื่อง''',
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
