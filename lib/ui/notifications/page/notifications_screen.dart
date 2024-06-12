import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Map<String, dynamic> notificationsMap = {
    'data': [
      {
        'id': 1,
        'title': 'The beautiful Sharm El_Sheikh!',
        'content': 'Enjoy yor trip to Sharm El Sheikh in relaxation',
        'time': '20:15'
      },
      {
        'id': 2,
        'title': 'Check our destinations',
        'content':
            'Find out more about our destinations through our application!',
        'time': '04:14'
      },
      {
        'id': 3,
        'title': 'Sohag trips!',
        'content': 'Enjoy more trips to Sohag in comfort.',
        'time': '19:20'
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3ff),
      appBar: AppBar(title: Text("Notifications"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notificationsMap['data'].length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(notificationsMap['data'][index]['title'],style: TextStyle(color: Colors.blue[900],fontWeight: FontWeight.bold,fontSize: 16),),
                            SizedBox(height: 8),
                              Text(notificationsMap['data'][index]['content'],style: TextStyle(color: Colors.blue,fontSize: 14),),
                          ],),
                        ),
                        Container(width: 50,child: Text(notificationsMap['data'][index]['time'])),
                      ],
                    ),
                  ),
                  Divider(
                    indent: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
