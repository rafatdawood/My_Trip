import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OurBussesScreen extends StatefulWidget {
  const OurBussesScreen({super.key});

  @override
  State<OurBussesScreen> createState() => _OurBussesScreenState();
}

class _OurBussesScreenState extends State<OurBussesScreen> {
  Map<String, dynamic> bussesMap = {
    'data': [
      {
        'type': 'First prime',
        'icons': [
          {
            'icon': FontAwesomeIcons.toilet,
            'title': 'WC',
          },
          {
            'icon': FontAwesomeIcons.mugHot,
            'title': 'Coffee',
          },
          {
            'icon': FontAwesomeIcons.tv,
            'title': 'Individual in seat screen',
          },
          {
            'icon': FontAwesomeIcons.usb,
            'title': 'USB charging portal',
          },
          {
            'icon': FontAwesomeIcons.binoculars,
            'title': 'GPS tracking system',
          },
          {
            'icon': FontAwesomeIcons.wifi,
            'title': 'WIFI',
          },
          {
            'icon': Icons.ac_unit,
            'title': 'AC',
          },
          {
            'icon': Icons.icecream_outlined,
            'title': 'Refrigerator',
          },
          {
            'icon': Icons.bus_alert_sharp,
            'title': 'Spacious cabin',
          },
          {
            'icon': Icons.family_restroom_outlined,
            'title': 'Host/Hostess',
          },
          {
            'icon': Icons.door_back_door_outlined,
            'title': 'Extra driver room',
          },
          {
            'icon': Icons.airline_seat_recline_extra_sharp,
            'title': 'Luxurious and more spacious seats',
          },
          {
            'icon': Icons.format_textdirection_l_to_r,
            'title': 'Direct trips',
          },
          {
            'icon': Icons.lunch_dining_outlined,
            'title': 'Snacks and drinks',
          },
        ]
      },
      {
        'type': 'Business prime',
        'icons': [
          {
            'icon': FontAwesomeIcons.toilet,
            'title': 'WC',
          },
          {
            'icon': FontAwesomeIcons.mugHot,
            'title': 'Coffee',
          },
          {
            'icon': FontAwesomeIcons.tv,
            'title': 'Individual in seat screen',
          },
          {
            'icon': FontAwesomeIcons.usb,
            'title': 'USB charging portal',
          },
          {
            'icon': FontAwesomeIcons.binoculars,
            'title': 'GPS tracking system',
          },
          {
            'icon': FontAwesomeIcons.wifi,
            'title': 'WIFI',
          },
          {
            'icon': Icons.ac_unit,
            'title': 'AC',
          },
          {
            'icon': Icons.icecream_outlined,
            'title': 'Refrigerator',
          },
          {
            'icon': Icons.bus_alert_sharp,
            'title': 'Spacious cabin',
          },
          {
            'icon': Icons.family_restroom_outlined,
            'title': 'Host/Hostess',
          },
          {
            'icon': Icons.door_back_door_outlined,
            'title': 'Extra driver room',
          },
          {
            'icon': Icons.airline_seat_recline_extra_sharp,
            'title': 'Luxurious and more spacious seats',
          },
          {
            'icon': Icons.format_textdirection_l_to_r,
            'title': 'Direct trips',
          },
          {
            'icon': Icons.lunch_dining_outlined,
            'title': 'Snacks and drinks',
          },
        ]
      },
      {
        'type': 'First class',
        'icons': [
          {
            'icon': FontAwesomeIcons.toilet,
            'title': 'WC',
          },
          {
            'icon': FontAwesomeIcons.tv,
            'title': 'Individual in seat screen',
          },
          {
            'icon': FontAwesomeIcons.usb,
            'title': 'USB charging portal',
          },
          {
            'icon': FontAwesomeIcons.binoculars,
            'title': 'GPS tracking system',
          },
          {
            'icon': FontAwesomeIcons.wifi,
            'title': 'WIFI',
          },
          {
            'icon': Icons.ac_unit,
            'title': 'AC',
          },
          {
            'icon': Icons.door_back_door_outlined,
            'title': 'Extra driver room',
          },
          {
            'icon': Icons.format_textdirection_l_to_r,
            'title': 'Direct trips',
          },
          {
            'icon': Icons.lunch_dining_outlined,
            'title': 'Snacks and drinks',
          },
        ]
      },
      {
        'type': 'Business class',
        'icons': [
          {
            'icon': FontAwesomeIcons.toilet,
            'title': 'WC',
          },
          {
            'icon': FontAwesomeIcons.tv,
            'title': 'Individual in seat screen',
          },
          {
            'icon': FontAwesomeIcons.usb,
            'title': 'USB charging portal',
          },
          {
            'icon': FontAwesomeIcons.binoculars,
            'title': 'GPS tracking system',
          },
          {
            'icon': FontAwesomeIcons.wifi,
            'title': 'WIFI',
          },
          {
            'icon': Icons.ac_unit,
            'title': 'AC',
          },
          {
            'icon': Icons.format_textdirection_l_to_r,
            'title': 'Direct trips',
          },
          {
            'icon': Icons.lunch_dining_outlined,
            'title': 'Snacks and drinks',
          },
        ]
      },
      {
        'type': 'Comfort class',
        'icons': [
          {
            'icon': FontAwesomeIcons.toilet,
            'title': 'Wc',
          },
          {
            'icon': FontAwesomeIcons.tv,
            'title': 'Individual in seat screen',
          },
          {
            'icon': FontAwesomeIcons.binoculars,
            'title': 'GPS tracking system',
          },
          {
            'icon': FontAwesomeIcons.wifi,
            'title': 'WIFI',
          },
          {
            'icon': Icons.ac_unit,
            'title': 'AC',
          },
        ]
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Our Busses'),
          centerTitle: true,
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            isScrollable: true,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('First prime'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Business prime'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('First class'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Business class'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Comfort class'),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          firstPrimePage(0),
          businessPrimePage(1),
          firstClassPage(2),
          businessClassPage(3),
          comfortClassPage(4)
        ]),
      ),
    );
  }

  Widget firstPrimePage(int num) {
    return ListView(
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bussesMap['data'][num]['icons'].length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      child: FaIcon(
                        bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          decoration: BoxDecoration(color: Colors.black,),
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(height: 50,),
      ],
    )
    ;
  }

  Widget businessPrimePage(int num) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bussesMap['data'][num]['icons'].length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      child: FaIcon(
                        bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget firstClassPage(int num) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: bussesMap['data'][num]['icons'].length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      child: FaIcon(
                        bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          decoration: BoxDecoration(color: Colors.black,),
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(height: 50,),
      ],
    );
  }

  Widget businessClassPage(int num) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bussesMap['data'][num]['icons'].length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      child: FaIcon(
                        bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          decoration: BoxDecoration(color: Colors.black,),
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(height: 50,),
      ],
    )
    ;
  }

  Widget comfortClassPage(int num) {
    return ListView(
      children: [
        GridView.builder(
          itemCount: bussesMap['data'][num]['icons'].length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              width: 50,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      child: FaIcon(
                        bussesMap['data'][num]['icons'][index]['icon'],
                        color: Colors.blue[900],
                      )),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            bussesMap['data'][num]['icons'][index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ))),
                ],
              ),
            );
          },
        ),AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          decoration: BoxDecoration(color: Colors.black,),
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(height: 50,),
      ],
    )
    ;
  }
}
