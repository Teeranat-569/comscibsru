
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DelEduTech extends StatefulWidget {
  const DelEduTech({Key? key}) : super(key: key);

  @override
  _DelEduTechState createState() => _DelEduTechState();
}

class _DelEduTechState extends State<DelEduTech> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('eduTech').snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('eduTech');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('ลบแหล่งความรู้'),
          ),
          body: Container(
            color: Colors.purple[50],
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                data["docid"] = document.id;
                // ignore: avoid_print
                print('4444444444444444444444444 ${data["docid"]}');
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.shade200,
                    ),
                    width: MediaQuery.of(context).size.width,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                        onPressed: () {
                        },
                        padding: const EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  data['nameTitle'],
                                  style: const TextStyle(fontSize: 14),
                                  maxLines: 3,
                                ),
                              ),
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  myAlert(data['docid']);
                                  // ignore: avoid_print
                                  print('----------------------------------' +
                                      data['docid']);
                                  // ignore: avoid_print
                                  print(
                                      '----------------------------nnnnn------' +
                                          data['nameManual']);
                                },
                                child: const Center(
                                    child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Future<void> deleteData(String docid) {
    return users.doc(docid).delete().then((value) {
      // ignore: avoid_print
      print("User Deleted");
       Fluttertoast.showToast(
        msg: "ลบแหล่งความรู้สำเร็จ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.purple[100],
        textColor: Colors.black,
      );
    // ignore: invalid_return_type_for_catch_error, avoid_print
    }).catchError((error) => print("Failed to delete user: $error"));
  }

  void myAlert(String docid) {
    showDialog(
        context: context,
        builder: (BuildContext constext) {
          return AlertDialog(
            title: const Text('คุณแน่ใจใช่ไหม?'),
            content: const Text('คุณต้องการที่จะลบรายการนี้?'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: const Text('ยกเลิก', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: const Text('ใช่', style: TextStyle(color: Colors.green)),
                onPressed: () {
                  deleteData(docid).then((value) {Navigator.of(context).pop();} );
                },
              ),
            ],
          );
        });
  }
}
