import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../web.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.purple,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'ระบบสารสนเทศ',
            style: TextStyle(color: Colors.purple),
          ),
          backgroundColor: Colors.purple[50]),
      backgroundColor: Colors.purple[50],
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 5,
                      crossAxisCount: 3,
                      primary: false,
                      children: <Widget>[
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 16,
                          onPressed: () {
                            // website('');
                            // route(
                            //     WebViewExample(url: ));
                            _launchURL('http://mis.bsru.ac.th/');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/web11.png',
                                height: 50,
                              ),
                              const Text(
                                'ระบบ MIS',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 16,
                          onPressed: () {
                            _launchURL(
                                'http://erp.bsru.ac.th/ERPWEB/Main/Home.aspx');
                            // website(
                            //     '');
                            // route(WebViewExample(
                            //     url:
                            //         ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/diagram.png',
                                height: 50,
                              ),
                              const Text('ระบบแสดงข้อมูล',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text('บุคลากร',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 16,
                          onPressed: () {
                            _launchURL('http://plag.grad.chula.ac.th/');
                            // website('');
                            // route(WebViewExample(
                            //     url: ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/search.png',
                                height: 50,
                              ),
                              const Text(
                                'ระบบอักขราวิสุทธิ์',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 16,
                          onPressed: () {
                            _launchURL('http://brms.bsru.ac.th/bsru_research/');
                            // website('');
                            // route(WebViewExample(
                            //     url: ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/seo.png',
                                height: 50,
                              ),
                              const Text('ระบบสืบค้น',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text('งานวิจัย BRMS',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 16,
                          onPressed: () {
                            _launchURL(
                                'http://www2.bsru.ac.th/bansomdej-radio/');
                            // website(
                            //     '');
                            // route(WebViewExample(
                            //     url:
                            //         'http://www2.bsru.ac.th/bansomdej-radio/'));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/radio-antenna.png',
                                height: 50,
                              ),
                              const Text('Bansomdej',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text('Radio',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 16,
                          onPressed: () {
                            // website('');
                            // route(WebViewExample(
                            //     url: 'http://www2.bsru.ac.th/tellme/'));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'images/bad-review.png',
                                height: 50,
                              ),
                              const Text('ระบบร้องเรียน/',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const Text('ร้องทุกข์',
                                  style: TextStyle(
                                    fontSize: 12.0,
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

// ignore: prefer_void_to_null

