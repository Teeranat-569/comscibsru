
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../home.dart';
import 'addtech.dart';
import 'addmanual.dart';
import 'editCalendar.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ผู้ดูแลระบบ',
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                myAlert();
              }),
        ],
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: const EdgeInsets.all(10),
                      color: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        route(CalendarAdmin(nameFormm: '',));
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'แก้ไขปฏิทินและการลงทะเบียน',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: const EdgeInsets.all(10),
                      color: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        route(const AddManual());
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.book,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'เพิ่มคู่มือนักศึกษา',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  // ignore: deprecated_member_use
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xffC25A7C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        route(const AddTech());
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.library_books,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'เพิ่มแหล่งความรู้เทคโนโลยี',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              title: const Text(
                'ลงชื่อออก',
              ),
              content: const Text('คุณต้องการลงชื่อออกหรือไม่?'),
              actions: <Widget>[
                cancleButton(),
                okButton(),
              ]);
        });
  }

  Widget cancleButton() {
    // ignore: deprecated_member_use
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.grey[200],
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        'ยกเลิก',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget okButton() {
    // ignore: deprecated_member_use
    return FlatButton(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        signOut();
      },
      child: const Text(
        'ตกลง',
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Future<void> signOut() async {
    // ignore: avoid_print
    print('SIgnOut>>>>>>>>>>>>>>>>>>>>successssssssss');
    await FirebaseAuth.instance.signOut();
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => const Home());
    await Navigator.of(context)
        .pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);
  }
}
