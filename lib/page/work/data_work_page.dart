import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataWork extends StatefulWidget {
  dynamic docid;
  DataWork({Key? key, this.docid}) : super(key: key);

  @override
  _DataWorkState createState() => _DataWorkState();
}

class _DataWorkState extends State<DataWork> {
  dynamic position,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,
      more3,
      bonus,
      social,
      health,
      timecost,
      hospital,
      covid,
      people,
      more4,
      amount,
      dateStop,
      name,
      phone,
      email,
      address,
      province,
      salary,
      pathPIC,
      status,
      more7,
      area;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('work')
        .doc(widget.docid)
        .get()
        .then((value) {
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ประกาศรับสมัครงาน'),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey.shade200,
                  ),
                  width: MediaQuery.of(context).size.width,
                  // ignore: deprecated_member_use
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(
                          //   Icons.tab,
                          //   color: Colors.blue[200],
                          // ),
                          Container(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 50,
                                  // child: ClipOval(
                                  //   child: Image.network(
                                  //     pathPIC,
                                  //     height: 100,
                                  //     width: 100,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                ),
                                // Text(
                                //   companyName,
                                //   // maxLines: 3,
                                //   // overflow: TextOverflow.ellipsis,
                                //   style: const TextStyle(fontSize: 14),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (status == 'open')
                                  Container(
                                    // color: Colors.green,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.green,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'เปิดรับสมัคร',
                                        // maxLines: 2,
                                        // overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                // Text(
                                //   position,
                                //   style: const TextStyle(
                                //       fontSize: 18, color: Colors.purple),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(),
              RaisedButton(
                onPressed: () {
                  print('******************************* ${widget.docid}');
                  get();
                  print(' aboutCompany: ${aboutCompany}');
                  print('  amount: ${amount}');
                  print('  area: ${area}');
                  print('companyName:${companyName},');
                  print('mission: ${mission}');
                  print('  picCompany: $pathPIC');
                  print('province:${province},');
                  print('salary: ${salary},');
                  print(' status: open,');
                  print(' workPosition: ${position},');
                  print('workType: ${worktype},');
                  print(' name: ${name},');
                  print('  phone:${phone},');
                  print('  email:${email}');
                  print(' address: ${address},');
                  print(' gender:${gender},');
                  print(' dateStop: ${dateStop},');
                  print(' more3 : ${more3},');
                  print(' more4: ${more4},');
                  print('  more7 : ${more7}');
                  print('age: ${age},');
                  print('exp: ${exp},');
                  print('bonus: ${bonus},');
                  print(' social: ${social},');
                  print(' health:${health},');
                  print('  timeCost:${timecost},');
                  print(' hospital: ${hospital},');
                  print('covid: ${covid},');
                  print('people: ${people},');
                  print('path:${pathPIC},');
                },
              ),
              Text('$name'),
            ],
          ),
        ),
      ),
    );
  }

  //   StreamBuilder(
  //         stream: FirebaseFirestore.instance
  //             .collection('YOUR COLLECTION NAME')
  //             .doc(id) //ID OF DOCUMENT
  //             .snapshots(),
  //       builder: (context, snapshot) {
  //       if (!snapshot.hasData) {
  //         return new CircularProgressIndicator();
  //       }
  //       var document = snapshot.data;
  //       return new Text('${document}');
  //    }
  // );

  Future<void> get() async {
    FirebaseFirestore.instance
        .collection('work')
        .doc(widget.docid)
        .get()
        .then((value) {
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['workPosition']}');
      print('+++++++++++++++++++++++++++++++++++${value['aboutCompany']}');
      print('+++++++++++++++++++++++++++++++++++${value['amount']}');
      print('+++++++++++++++++++++++++++++++++++${value['area']}');
      print('+++++++++++++++++++++++++++++++++++${value['companyName']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['covid']}');
      print('+++++++++++++++++++++++++++++++++++${value['people']}');
      print('+++++++++++++++++++++++++++++++++++${value['more7']}');

      setState(() {
        name = value['name'];
        position = value['workPosition'];
        aboutCompany = value['aboutCompany'];
        amount = value['amount'];
        area = value['area'];
        companyName = value['companyName'];
        mission = value['mission'];
        pathPIC = value['picCompany'];
        province = value['province'];
        salary = value['salary'];
        status = value['status'];
        worktype = value['workType'];
        phone = value['phone'];
        email = value['email'];
        address = value['address'];
        gender = value['gender'];
        dateStop = value['datrStop'];
        more3 = value['more3'];
        more4 = value['more4'];
        bonus = value['bonus'];
        health = value['health'];
        hospital = value['hospital'];
        social = value['social'];
        timecost = value['timeCost'];
        covid = value['covid'];
        people = value['people'];
        more7 = value['more7'];
      });
    });

//     => then(function(document) {
//
// }
//     );
  }
}
