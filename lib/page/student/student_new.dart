import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../web.dart';

class Studentnew extends StatefulWidget {
  const Studentnew({Key? key}) : super(key: key);

  @override
  _StudentnewState createState() => _StudentnewState();
}

class _StudentnewState extends State<Studentnew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
          ),
          toolbarHeight: 40,
          elevation: 0.0,
          title: const Text('นักศึกษา', style: TextStyle(color: Colors.purple)),
          backgroundColor: Colors.purple[50]),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 5,
                      crossAxisCount: 1,
                      childAspectRatio: 16 / 3,
                      primary: false,
                      children: <Widget>[
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.pink[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {
                            // website('');
                            // route(WebViewExample(url: ));
                            _launchURL('http://mis.bsru.ac.th/');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/web11.png',
                                height: 60,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'ระบบ MIS',
                                style: TextStyle(
                                  // fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.yellow[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {
                            // website(
                            //     '');
                            // route(WebViewExample(
                            //     url:
                            //         ));
                            _launchURL(
                                'https://dsad.bsru.ac.th/newdsad/scholarship.html');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/scholarship.png',
                                height: 60,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'ทุนการศึกษา',
                                style: TextStyle(
                                  // fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.brown[50],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {
                            // website(
                            //     '');
                            // route(WebViewExample(
                            //     url:
                            //         ));
                            _launchURL(
                                'https://dsad.bsru.ac.th/newdsad/studentloan.html');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/briefcase.png',
                                height: 60,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text('กยศ.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {
                            // website('');
                            // route(WebViewExample(
                            //     url: ));
                            _launchURL('https://www.bsru.ac.th/rules/');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/certificate.png',
                                height: 75,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              const Text('กฎระเบียบ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('แต่งกาย',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('ผ่อนผันทหาร',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.tealAccent[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {
                            _launchURL(
                                'https://dsad.bsru.ac.th/newdsad/nurse-and-accident.html');
                            // website(
                            // '');
                            // route(WebViewExample(
                            //     url:
                            //         ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/nurse.png',
                                height: 80,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text('งานพยาบาล',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('ประกันอุบัติเหตุ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.deepOrange[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          onPressed: () {
                            _launchURL('http://aar.bsru.ac.th/gpax/');
                            // website('');
                            //  route(WebViewExample(url: ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/sofa.png',
                                height: 80,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text('ระบบคำนวณ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text('เกรดเฉลี่ย',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
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

  Future<void> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
