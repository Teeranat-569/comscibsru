import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_page.dart';
import 'page/calendar/manual_page2.dart';
import 'page/contact/contact_page.dart';
import 'page/course/course_page.dart';
import 'page/download/download_page.dart';
import 'page/history/history_pag1.dart';
import 'page/information_page.dart';
import 'page/manual/manual_page.dart';
import 'page/people_page.dart';
import 'page/student/student_new.dart';
import 'page/technology/tech_page.dart';
import 'page/work/work_page.dart';
import 'web.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String pic;

  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded != null || isFirstLoaded == null) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xff762A76),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text('สาขาวิทยาการคอมพิวเตอร์',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/1111.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: const Color(0xff520140),
                  // onPressed: () async {
                  //   const url =
                  //       'http://202.29.54.207/dev3/admission/index.php?fbclid=IwAR0v2FiZKU0IvXeC6aYZqnjgKpcp6OYg6ydZsDN_mq2J17lvf-5nPp4c5vs';
                  //   if (await canLaunch(url)) {
                  //     await launch(url);
                  //   } else {
                  //     throw 'Couid not launch $url';
                  //   }
                  // },
                  onPressed: () {
                    _launchURL(
                        'http://202.29.54.207/dev3/admission/index.php?fbclid=IwAR0v2FiZKU0IvXeC6aYZqnjgKpcp6OYg6ydZsDN_mq2J17lvf-5nPp4c5vs');
                    // route(WebViewExample(
                    //     url:
                    //         'http://202.29.54.207/dev3/admission/index.php?fbclid=IwAR0v2FiZKU0IvXeC6aYZqnjgKpcp6OYg6ydZsDN_mq2J17lvf-5nPp4c5vs'));
                  },
                  child: const Text(
                    'สมัครเลย!!',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: const Text(
                  "Close X",
                  style: TextStyle(color: Colors.deepPurple),
                ),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  prefs.setBool(keyIsFirstLoaded, false);
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        fontFamily: 'Spartan',
        fontWeight: FontWeight.w900,
        fontSize: 24,
        color: Colors.white);
    var textStyle2 = const TextStyle(
        fontSize: 20,
        fontFamily: 'Spartan',
        fontWeight: FontWeight.w900,
        color: Color(0xff621895));
    return Material(
      type: MaterialType.canvas,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.purple[50],
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/BGBSRU.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xfff6a5ec),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200.0),
                      bottomRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Semantics(
                              child: const Image(
                                  image: AssetImage("images/10.png"))),
                        )),
                      ),
                      Image.asset(
                        'images/2.png',
                        height: 50,
                      ),
                      // Column(mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Text(
                      //           'C',
                      //           style: textStyle,
                      //         ),
                      //         Text(
                      //           'omputer',
                      //           style: textStyle2,
                      //         ),
                      //         const SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text(
                      //           'S',
                      //           style: textStyle,
                      //         ),
                      //         Text(
                      //           'cience',
                      //           style: textStyle2,
                      //         ),
                      //         const SizedBox(
                      //           width: 10,
                      //         ),

                      //         const SizedBox(
                      //           width: 10,
                      //         ),
                      //       ],
                      //     ),
                      //     Row(mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         Text(
                      //               'BSRU',
                      //               style: textStyle,
                      //             ),
                      //       ],
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              historyButton(),
                              newsButton(),
                              courseButton(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              peopleButton(),
                              studentButton(),
                              calendarButton(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              downloadButton(),
                              informationButton(),
                              moreButton(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              techButton(),
                              contactButton(),
                              aboutButton(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              workButton(),
                              // contactButton(),
                              // aboutButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget historyButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/history-book.png'),
                  ),
                ),
              ),
              // ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const HistoryPag1()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'ประวัติสาขา',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        ))
      ],
    );
  }

  Widget informationButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                width: 60,
                height: 65,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/information.png'),
                      fit: BoxFit.cover),
                ),
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const ManualPage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'คู่มือ',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          'นักศึกษา',
          style: TextStyle(fontSize: 12),
        ))
      ],
    );
  }

  Widget peopleButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                width: 70,
                height: 75,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/person.png'),
                      fit: BoxFit.cover),
                ),
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const PeoplePage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'คณาจารย์',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          'ประจำหลักสูตร',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget courseButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/22.png'), fit: BoxFit.cover),
                ),
                width: 60,
                height: 65,
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const CoursePage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'หลักสูตร',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          'ที่เปิดสอน',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget contactButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/contact.png'),
                      fit: BoxFit.cover),
                ),
                width: 60,
                height: 65,
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const ContactPage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'ติดต่อ วิทย์ - คอม',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget newsButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                splashColor: Colors.greenAccent,
                elevation: 8.0,
                child: Container(
                  width: 60,
                  height: 65,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/news.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                onPressed: () {
                  _launchURL('http://site.bsru.ac.th/comsci/?page_id=204');
                  // route(WebViewExample(
                  //   url: 'http://site.bsru.ac.th/comsci/?page_id=204',
                  // ));
                }),
          ),
        ),
        const Center(
            child: Text(
          'ข่าวสาร',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          'กิจกรรม',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget calendarButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/schedule.png'),
                      fit: BoxFit.cover),
                ),
                width: 60,
                height: 65,
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const ManualPage2()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'ปฏิทินวิชาการ',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget moreButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/66.png'), fit: BoxFit.cover),
                ),
                width: 60,
                height: 65,
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const InformationPage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'ระบบสารสนเทศ',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget studentButton() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/employee.png'),
                      fit: BoxFit.cover),
                ),
                width: 70,
                height: 75,
              ),
              // ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const Studentnew()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'นักศึกษา',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget downloadButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/file.png'), fit: BoxFit.cover),
                ),
                width: 55,
                height: 65,
              ),
              // ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const DownloadPage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'ดาวน์โหลดเอกสาร',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget aboutButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/in.png'), fit: BoxFit.cover),
                ),
                width: 75,
                height: 65,
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const AboutPage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'เกี่ยวกับแอปฯ',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          '',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget techButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/atom.png'), fit: BoxFit.cover),
                ),
                width: 75,
                height: 65,
              ),
              // ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const TechPage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'แหล่งความรู้',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          'เทคโนโลยี',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Widget workButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/11.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              splashColor: Colors.greenAccent,
              elevation: 8.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/work.png'), fit: BoxFit.cover),
                ),
                width: 65,
                height: 55,
              ),
              // ),
              onPressed: () {
                // ignore: avoid_print
                print('Tapped');
                Navigator.of(context)
                    .push<void>(_createRoute(const WorkPage()));
              },
            ),
          ),
        ),
        const Center(
            child: Text(
          'ประกาศ',
          style: TextStyle(fontSize: 12),
        )),
        const Center(
            child: Text(
          'รับสมัครงาน',
          style: TextStyle(fontSize: 12),
        )),
      ],
    );
  }

  Route _createRoute(Widget ll) {
    return PageRouteBuilder<SlideTransition>(
      pageBuilder: (context, animation, secondaryAnimation) => (ll),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
        var curveTween = CurveTween(curve: Curves.ease);

        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: child,
        );
      },
    );
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
