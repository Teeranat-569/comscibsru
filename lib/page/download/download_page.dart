import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../web.dart';
// import 'package:url_launcher/url_launcher.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.purple[50],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
          ),
          title: const Text(
            'ดาวน์โหลดเอกสาร',
            style: TextStyle(color: Colors.purple),
          )),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0), color: Colors.purple[100]),
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                  child: Text(
                'เอกสารโครงงานคอมพิวเตอร์',
                style: TextStyle(fontSize: 20),
              )),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      t1('CP-1 แบบขออนุมัติหัวข้อโครงงานคอมพิวเตอร์',
                          'https://drive.google.com/file/d/1Ajv2du_U1iqRpgmdJYc9_rLbvznjtO-Z/view?usp=sharing'),
                      t1('CP-2 แบบขอสอบโครงงานคอมพิวเตอร',
                          'https://drive.google.com/file/d/1ZII32ilPs8fq8a_VZxMZ4wCR87ibx9f1/view?usp=sharing'),
                      t1('CP-3 ผลการสอบโครงงานคอมพิวเตอร์',
                          'https://drive.google.com/file/d/1ngJqI03mMi7A75THp8f0cbligAlF1APj/view?usp=sharing'),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                  child: Text(
                'ใบคำร้องทั่วไป',
                style: TextStyle(fontSize: 20),
              )),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        t1('ทบ.1 คำร้องทั่วไป',
                            'http://aar.bsru.ac.th/images/re-form/R1.pdf'),
                        t1('ทบ.2 คำร้องขอมีบัตรประจำตัวนักศึกษา',
                            'http://aar.bsru.ac.th/images/re-form/R2.pdf'),
                        t1('ทบ.4 คำร้องขอใบรายงานผลการศึกษา',
                            'http://aar.bsru.ac.th/images/re-form/R4.pdf'),
                        t1('ทบ.5 คำร้องขอใบรับรองสถานภาพ',
                            'http://aar.bsru.ac.th/images/re-form/R5.pdf'),
                        t1('ทบ.6 คำร้องขอพักการเรียน/คืนสภาพ',
                            'http://aar.bsru.ac.th/images/re-form/R6.pdf'),
                        t1('ทบ.7 คำร้องขอลาออก/ย้ายมหาวิทยาลัย',
                            'http://aar.bsru.ac.th/images/re-form/R7.pdf'),
                        t1('ทบ.8 คำร้องขอเรียนสมทบต่างมหาวิทยาลัย',
                            'http://aar.bsru.ac.th/images/re-form/R8.pdf'),
                        t1('ทบ.9 คำร้องขอยกเว้นการเรียนรายวิชา',
                            'http://aar.bsru.ac.th/images/re-form/R9.pdf'),
                        t1('ทบ.10 คำร้องขอยกเว้นกลุ่มวิชาศึกษาทั่วไป',
                            'http://aar.bsru.ac.th/images/re-form/R10.pdf'),
                        t1('ทบ.11 คำร้องขอโอนผลการเรียน',
                            'http://aar.bsru.ac.th/images/re-form/R11.pdf'),
                        t1('ทบ.12 คำร้องขอยกเลิกรายวิชา',
                            'http://aar.bsru.ac.th/images/re-form/R12.pdf'),
                        t1('ทบ.14 คำร้องขอเปิดรายวิชาเป็นกรณีพิเศษ',
                            'http://aar.bsru.ac.th/images/re-form/R14.pdf'),
                        t1('ทบ.15 คำร้องขอเปลี่ยนสาขาวิชา',
                            'http://aar.bsru.ac.th/images/re-form/R15.pdf'),
                        t1('ทบ.17 คำร้องแจ้งขอเรียนเป็นภาคเรียนสุดท้าย',
                            'http://aar.bsru.ac.th/images/re-form/R17.pdf'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget t1(String name, String url) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 13),
          ),
          OutlinedButton(
            // onPressed: () async {
            //   if (await canLaunch(url)) {
            //     await launch(url);
            //   } else {
            //     throw 'Couid not launch $url';
            //   }
            // },
            onPressed: () {
              _launchURL(url);
              // route(WebViewExample(url: url));
            },
            child: const Icon(Icons.download_sharp),
          ),
        ],
      ),
    );
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }
}
