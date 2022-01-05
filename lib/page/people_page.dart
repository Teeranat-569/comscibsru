import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.purple,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          toolbarHeight: 40,
          elevation: 0.0,
          title: const Text(
            'คณาจารย์ประจำหลักสูตร',
            style: TextStyle(color: Colors.purple),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[50]),
      backgroundColor: Colors.purple[50],
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 1,
                      childAspectRatio: 16 / 12,
                      primary: false,
                      children: <Widget>[
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-tar.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'อ.บุญญาพร บุญชัย',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text('ประธานสาขาวิชา วิทยาการคอมพิวเตอร์'),
                              phone('0858246954', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-piyanan.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'ดร.ปิยะนันต์ อิสสระวิทย์',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone('0850612416', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-oa.png',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'ผศ.ดร.อมลณัฐ โชติกิจนุสรณ์',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone('0819208747', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-pui.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'ผศ.ดร.เกษม ตริตระการ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone('0819077231', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/A2-1.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'ดร.คณกร สว่างเจริญ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone('0865911992', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-aum.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'ผศ.ดร.ประไพ ศรีดามา',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone2('', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-am.png',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'ผศ.ดร.นิศากร เถาสมบัติ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone('0879016033', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-nate.png',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'อ.เนตรนภา แซ่ตั้ง',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone('0852428661', '')
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 60,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-dear.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'อ.ธีรพัฒน์ จันษร',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              phone('0822842973', '')
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phone(dynamic numPhone, String numTor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text(
              'ติดต่อ',
              // style: TextStyle(
              //   color: Colors.white,
              // ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.green,
              ),
              child: IconButton(
                  icon: const Icon(
                    Icons.local_phone,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () async {
                    _makePhoneCall(numPhone);
                  }),
            )
          ],
        ),
        // Text(
        //   numTor,
        //   style: const TextStyle(fontSize: 11),
        // ),
      ],
    );
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

  Widget phone2(dynamic numPhone, String numTor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text(
              'ติดต่อ',
              // style: TextStyle(
              //   color: Colors.white,
              // ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.green,
              ),
              child: IconButton(
                  icon: const Icon(
                    Icons.local_phone,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () async {
                    _makePhoneCall(numPhone);
                  }),
            )
          ],
        ),
        // Text(
        //   numTor,
        //   style: const TextStyle(fontSize: 11),
        // ),
      ],
    );
  }
}
