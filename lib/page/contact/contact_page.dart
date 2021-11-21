import 'package:comsci/page/admin/registeradmin.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../web.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late double lat, lng;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 40,
          backgroundColor: Colors.purple[50],
          automaticallyImplyLeading: false,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print('admin');
                      route(const Admin());
                    },
                    icon: const Icon(
                      Icons.account_box,
                      size: 30,
                      color: Colors.purple,
                    )),
              ],
            ),
          ],
          title: const Text(
            'ติดต่อ วิทย์-คอม',
            style: TextStyle(color: Colors.purple),
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            contact(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffCCFFFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200.0),
                        bottomRight: Radius.circular(200.0),
                        topLeft: Radius.circular(200.0),
                        topRight: Radius.circular(200.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print('facebook');
                              // _launchURLFace();
                              // route(WebViewExample(
                              //     url:
                              //         ));
                              _launchURL(
                                  'https://web.facebook.com/ComputerScienceBsru');
                            },
                            icon: const Icon(
                              Icons.facebook,
                              size: 40,
                              color: Colors.blue,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print('facebook');
                              // route(WebViewExample(
                              //     url:
                              //         ));
                              _launchURL(
                                  'https://web.facebook.com/ComputerScienceBsru');
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Computer Science BSRU',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Text(
                  'สาขาวิทยาการคอมพิวเตอร์',
                  style: TextStyle(color: Colors.pink[700], fontSize: 20),
                ),
                Text(
                  'อาคาร 4 ชั้น 1 ห้อง 412',
                  style: TextStyle(color: Colors.pink[700], fontSize: 20),
                ),
                const Text('คณะวิทยาศาสตร์และเทคโนโลยี'),
                const Text('มหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFFF9E3),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200.0),
                        bottomRight: Radius.circular(200.0),
                        topLeft: Radius.circular(200.0),
                        topRight: Radius.circular(200.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'เว็บไซต์สาขา :',
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
                            onPressed: () {
                              // ignore: avoid_print
                              print('facebook');
                              //  route(WebViewExample(url: ));
                              _launchURL('http://site.bsru.ac.th/comsci/');
                            },
                            child: Text(
                              'http://site.bsru.ac.th/comsci/',
                              style: TextStyle(
                                  color: Colors.blue[300], fontSize: 17),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  Widget contact() {
    return Column(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 80,
          backgroundImage: AssetImage('images/10.png'),
        )
      ],
    );
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
