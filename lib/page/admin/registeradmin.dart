
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'add.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final textFill = GlobalKey<FormState>();
  dynamic username, password;
  TextEditingController userCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Form(
          key: textFill,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              usernameText(),
              const SizedBox(
                height: 10.0,
              ),
              passwordText(),
              const SizedBox(
                height: 20.0,
              ),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameText() {
    return TextField(
      onChanged: (value) => username = value.trim(),
      controller: userCon,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        labelText: 'E-mail',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextField(
      onChanged: (value) => password = value.trim(),
      controller: passwordCon,
      obscureText: true,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.password),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  // ignore: prefer_void_to_null
  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) {
      // ignore: avoid_print
      print('******************************');
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      firebaseAuth
          .signInWithEmailAndPassword(email: username, password: password)
          .then((response) {
        // ignore: avoid_print
        print('Authen Success');
         Fluttertoast.showToast(
            msg: "เข้าสู่ระบบสำเร็จ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.purple[100],
            textColor: Colors.black,
          );
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => const Add());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((response) {
        String title = response.code;
        String message = response.message;
        myAlert(title, message);
      });
    });
  }

  void myAlert(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            // ignore: deprecated_member_use
            actions: <Widget>[FlatButton(onPressed: () {}, child: const Text('ok'))],
          );
        });
  }

  Widget loginButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      color: Colors.purple[900],
      child: const Text(
        'เข้าสู่ระบบ',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      onPressed: () {
        textFill.currentState!.save();
        checkAuthen();
        // ignore: avoid_print
        print('pppppppppppppppppuuuuuuuuuuuuuuuuuppppppppppppp$username');
        // ignore: avoid_print
        print('pppppppppppppppppppppppppppppp$password');
       
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ผู้ดูแลระบบ'),
        toolbarHeight: 40,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.purple[200],
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'images/admin.png',
                height: 200,
              ),
              const SizedBox(
                height: 40,
              ),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
