import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xfff6a5ec),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(200.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: ClipOval(
                            child: Image.asset(
                              'images/10.png',
                              height: 220,
                              width: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'พัฒนาแอปพลิเคชันโดย',
                        style: TextStyle(fontSize: 16),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: ClipOval(
                          child: Image.asset(
                            'images/kaew.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text('นางสาวธีรนาถ สื่อเฉย'),
                      const Text('นักศึกษาสาขาวิทยาการคอมพิวเตอร์'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'อาจารย์ที่ปรึกษา',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
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
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'ผศ.ดร.นิศากร เถาสมบัติ',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
