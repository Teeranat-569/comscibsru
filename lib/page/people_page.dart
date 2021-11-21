import 'package:flutter/material.dart';

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
                      childAspectRatio: 16 / 9,
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
                              const Text(
                                '',
                                style: TextStyle(),
                              ),
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
                              const Text(
                                '',
                              ),
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
                              const Text(
                                '',
                                style: TextStyle(),
                              ),
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
                              const Text(
                                '',
                                style: TextStyle(),
                              ),
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
                              const Text(
                                '',
                              ),
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
                              const Text(
                                '',
                              ),
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
                              const Text(
                                '',
                                style: TextStyle(),
                              ),
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
                              const Text(
                                '',
                              ),
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
}
