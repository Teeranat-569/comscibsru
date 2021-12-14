import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgencyPage extends StatefulWidget {
  const AgencyPage({Key? key}) : super(key: key);

  @override
  _AgencyPageState createState() => _AgencyPageState();
}

class _AgencyPageState extends State<AgencyPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "ติดต่อหน่วยงาน",
          // style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 40,
        elevation: 0.00,
        // automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
                child: ListTile(
                  title: Column(
                    children: [
                      ft1(),
                      ft2(),
                      ft3(),
                      ft4(),
                      ft5(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container ft1() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: const Text(
          "กองคลัง",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/finance.jpg'),
          ),
          ListTile(
            title: address('6'),
          ),
          ListTile(
            title: website('http://financebsru.bsru.ac.th/'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/financebsru',
                'กองคลัง \nมหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา'),
          ),
          ListTile(
            title: phone('02-473-7000', 'ต่อ 1200 – 1202'),
          )
        ],
      ),
    );
  }

  Container ft2() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: const Text(
          "สำนักส่งเสริมวิชาการและงานทะเบียน",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/web.png'),
          ),
          ListTile(
            title: address('5'),
          ),
          ListTile(
            title: website('http://aar.bsru.ac.th/'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/AarBsru',
                'สำนักส่งเสริมวิชาการและงานทะเบียน \nมรภ.บ้านสมเด็จเจ้าพระยา'),
          ),
          ListTile(
            title: phone('02-473-7000',
                'ต่อ 1710 กลุ่มงานบริหารงานทั่วไป (งานธุรการ)\n1711 หัวหน้าสำนักงานและรองผู้อำนวยการสำนัก\n1713 ผู้อำนวยการสำนัก\n1714 กลุ่มงานบริหารงานทั่วไป\n1715 กลุ่มงานบริหารงานทั่วไป\n1717 กลุ่มงานไอที\n1718 กลุ่มงานทะเบียนเรียนและประมวลผลการศึกษา\n1719 กลุ่มงานทะเบียนประวัติและออกเอกสารทางการศึกษา\n1716 / 1998 ศูนย์รับนิสิตสายตรง'),
          )
        ],
      ),
    );
  }

  Container ft3() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: const Text(
          "สำนักกิจการนักศึกษา",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/stu.png'),
          ),
          ListTile(
            title: address('7'),
          ),
          ListTile(
            title: website(
                'https://dsad.bsru.ac.th/newdsad/\ndsad.bsru.ac.th.html'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/dsad.bsru/',
                'สำนักกิจการนักศึกษา\nมหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา'),
          ),
          ListTile(
            title: phone('02-473-7000', 'ต่อ 1300 , 1301'),
          )
        ],
      ),
    );
  }

  Container ft4() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: const Text(
          "สำนักคอมพิวเตอร์",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/CC.png'),
          ),
          ListTile(
            title: address('10'),
          ),
          ListTile(
            title: website('http://cc.bsru.ac.th/'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/ccbsru/',
                'สำนักคอมพิวเตอร์\nมรภ.บ้านสมเด็จเจ้าพระยา'),
          ),
          ListTile(
            title: phone('02-473-7000', 'ต่อ 1722, 1723'),
          )
        ],
      ),
    );
  }

  Container ft5() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        // backgroundColor: Colors.yellow[50],
        title: const Text(
          "สำนักวิเทศสัมพันธ์และเครือข่ายอาเซียน",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Image.asset('images/crop.jpg'),
          ),
          ListTile(
            title: address('11'),
          ),
          ListTile(
            title: website('http://iaan.bsru.ac.th/'),
          ),
          ListTile(
            title: facebook('https://www.facebook.com/INTER.BSRU',
                'International Affairs and ASEAN \nNetwork Bansomdejchaopraya \nRajabhat Univers'),
          ),
          ListTile(
            title: phone('02-473-7000', 'ต่อ 1740'),
          )
        ],
      ),
    );
  }

  Widget website(String url) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      //

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.public,
            size: 30,
          ),

          // Text('เว็บไซต์'),
          TextButton(
              onPressed: () async {
                // const url = 'http://aar.bsru.ac.th/';
                // if (await canLaunch(url)) {
                //   await launch(url);
                // } else {
                //   throw 'Couid not launch $url';
                // }
                _launchURL(url);
              },
              child: Text(
                url,
                style: TextStyle(color: Colors.orange[700]),
              ))
        ],
      ),
    );
  }

  Widget facebook(String url, String nameFace) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.facebook,
            size: 30,
          ),
          TextButton(
              onPressed: () async {
                // const url = 'https://www.facebook.com/AarBsru/';
                // if (await canLaunch(url)) {
                //   await launch(url);
                // } else {
                //   throw 'Couid not launch $url';
                // }
                _launchURL(url);
              },
              child:
                  Text(nameFace, style: TextStyle(color: Colors.orange[700])))
        ],
      ),
    );
  }

  Widget address(String numBuilding) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      //

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.place,
            size: 30,
          ),

          Text('อาคาร' + '' + numBuilding),
          // TextButton(
          //     onPressed: () async {
          //       // const url = 'http://aar.bsru.ac.th/';
          //       if (await canLaunch(url)) {
          //         await launch(url);
          //       } else {
          //         throw 'Couid not launch $url';
          //       }
          //     },
          //     child: Text(
          //       url,
          //       style: TextStyle(color: Colors.orange[700]),
          //     ))
        ],
      ),
    );
  }

  Widget phone(dynamic numPhone, String numTor) {
    return Container(
        // margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        //
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.smartphone,
              size: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      numPhone,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.local_phone,
                          color: Colors.green,
                        ),
                        onPressed: () async {
                          // const url = 'tel:+6624737000';
                          // if (await canLaunch(url)) {
                          //   await launch(url);
                          // } else {
                          //   throw 'Couid not launch $url';
                          // }
                          _makePhoneCall(numPhone);
                        })
                  ],
                ),
                Text(
                  numTor,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
