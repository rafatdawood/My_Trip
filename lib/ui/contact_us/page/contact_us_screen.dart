import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3ff),
      appBar: AppBar(title: Text("Contact Us"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HotLine',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      InkWell(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.phone,
                              ),
                            ),
                            Text('00000'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Social',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.facebook),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.instagram),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              indent: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Send Us a Message',style: TextStyle(color: Colors.blue[900],fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10,
                  ),
                  Text('You can contact us at anytime from below'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Send Us a Message',style: TextStyle(color: Colors.blue)),
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xfff0f3ff))),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              indent: 5,
            ),
          ],
        ),
      ),
    );
  }
}
