import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TechPage extends StatefulWidget {
  const TechPage({Key? key}) : super(key: key);

  @override
  _TechPageState createState() => _TechPageState();
}

class _TechPageState extends State<TechPage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('eduTech').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Loading"),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('แหล่งความรู้เทคโนโลยี'),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.shade200,
                    ),
                    width: MediaQuery.of(context).size.width,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                        // onPressed: () async {
                        //   String url = '${data['linkTitle']}';
                        //   // ignore: avoid_print
                        //   print('hhhhhhhhhhhhhhhhhhhhh' + url);
                        //   if (await canLaunch(url)) {
                        //     await launch(url);
                        //   } else {
                        //     throw 'Couid not launch  $url';
                        //   }
                        // },
                        onPressed: () {
                          // route(WebViewExample(url: ));
                          _launchURL(data['linkTitle']);
                        },
                        padding: const EdgeInsets.all(5),
                        // ignore: avoid_unnecessary_containers
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.tab,
                                  color: Colors.blue[200],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    data['nameTitle'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: Text(
                                    data['conclu'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.purple[100]),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  'อ่านต่อ >>>',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            )
                          ],
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

  Future<void> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).push(materialPageRoute);
  }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
