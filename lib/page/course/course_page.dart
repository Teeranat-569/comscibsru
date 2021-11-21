import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.purple[50],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.purple,
            ),
          ),
          title: const Text(
            'หลักสูตร',
            style: TextStyle(color: Colors.purple),
          )),
      body: Container(
        color: Colors.white,
        child: Padding(
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container ft1() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(
              Icons.bookmark,
              size: 30,
              color: Colors.yellow[600],
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "หมวดวิชาแกนวิทยาการคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        children: const <Widget>[
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tแคลคูลัสและเรขาคณิตวิเคราะห์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tคณิตศาสตร์ดิสครีต",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการคำนวณเชิงตัวเลข",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tสถิติประยุกต์สำหรับวิทยาการคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container ft2() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(
              Icons.bookmark,
              size: 30,
              color: Colors.yellow[600],
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "หมวดวิชาเฉพาะด้านบังคับ",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        children: const <Widget>[
          ExpansionTile(
              title: Text(
                "กลุ่มประเด็นด้านองค์กรและระบบสารสนเทศ",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tการวิเคราะห์และออกแบบระบบ",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tภาษาอังกฤษสำหรับวิทยาการคอมพิวเตอร์",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tภาษาอังกฤษสำหรับการประกอบอาชีพทางคอมพิวเตอร์",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ]),
          ExpansionTile(
              title: Text(
                "กลุ่มเทคโนโลยีเพื่องานประยุกต์",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tการจัดการฐานข้อมูล",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tปฏิสัมพันธ์ระหว่างมนุษย์และคอมพิวเตอร์",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tความมั่นคงปลอดภัยทางไซเบอร์",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tโครงงานคอมพิวเตอร์ 1",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tโครงงานคอมพิวเตอร์ 2",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ]),
          ExpansionTile(
              title: Text(
                "กลุ่มเทคโนโลยีและวิธีการทางซอฟแวร์",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tการเขียนโปรแกรมคอมพิวเตอร์และอัลกอริทึม",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tโครงสร้างข้อมูลและอัลกอริทึม",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tการเขียนโปรแกรมเชิงวัตถุ 1",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tวิศวกรรมซอฟต์แวร์",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tวิศวกรรมเว็บและการพัฒนาเว็บแอพพลิเคชัน",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ]),
          ExpansionTile(
              title: Text(
                "กลุ่มโครงสร้างพื้นฐานของระบบ",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tพื้นฐานวิทยาการคอมพิวเตอร์",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tระบบปฏิบัติการ",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tเครือข่ายคอมพิวเตอร์และการสื่อสารข้อมูล",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tคอมพิวเตอร์กราฟิกและการประมวลผลภาพ",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tปัญญาประดิษฐ์และระบบชาญฉลาด",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ]),
          ExpansionTile(
              title: Text(
                "กลุ่มฮาร์ดแวร์และสถาปัตยกรรมคอมพิวเตอร์",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              children: [
                ListTile(
                  title: Text(
                    "\t\t\t\t\t\t\tโครงสร้างและสถาปัตยกรรมคอมพิวเตอร์",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }

  Container ft3() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(
              Icons.bookmark,
              size: 30,
              color: Colors.yellow[600],
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "หมวดวิชาเฉพาะด้านเลือก",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        children: const <Widget>[
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการออกแบบและการบริหารเครือข่ายคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการค้นคืนสารสนเทศ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tคอมพิวเตอร์เบื้องต้นและซอฟต์แวร์สำเร็จรูป",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tวิจัยดำเนินงาน",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการพัฒนาเว็บแอพพลิเคชันขั้นสูงวิจัยดำเนินงาน",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tซอฟต์แวร์ประยุกต์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tซอฟต์แวร์สำหรับการจัดการฐานข้อมูล",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tธุรกิจดิจิทัล",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการเขียนโปรแกรมคอมพิวเตอร์ขั้นสูง",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการพัฒนาระบบสำหรับการประมวลผลแบบเคลื่อนที่",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tระบบธุรกิจอัจฉริยะ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการบริหารโครงการด้านเทคโนโลยีสารสนเทศ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการเขียนโปรแกรมเชิงวัตถุ 2",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการบริหารระบบ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tระบบสารสนเทศเพื่อการจัดการ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tสำนักงานอัตโนมัติ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tเทคโนโลยีการจัดการเว็บ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tเทคโนโลยีดิจิทัล",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการเป็นผู้ประกอบการด้านคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการประมวลผลแบบกลุ่มเมฆน",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tหัวข้อพิเศษทางวิทยาการคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tวิทยาศาสตร์ทั่วไปสำหรับวิทยาการคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container ft4() {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(
              Icons.bookmark,
              size: 30,
              color: Colors.yellow[600],
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "หมวดวิชาชีพ",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        children: const <Widget>[
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tเตรียมฝึกประสบการณ์วิชาชีพวิทยาการคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "\t\t\t\t\t\t\tการฝึกประสบการณ์วิชาชีพวิทยาการคอมพิวเตอร์",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
