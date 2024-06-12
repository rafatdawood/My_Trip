import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../book_now/page/book_now_screen.dart';
import '../../more/page/more_screen.dart';
import '../../my_trips/page/my_trips_screen.dart';
import '../../our_destinations/page/our_destinations_screen.dart';
import '../../stations/page/stations_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 2;
  List pages = [
    const MyTripsScreen(),
    const StationsScreen(),
    const BookNowScreen(),
    const OurDestinationsScreen(),
    const MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue[900],
        animationDuration: const Duration(milliseconds: 300),
        items:  [
          FaIcon(
            FontAwesomeIcons.ticket,
            color: Colors.white,
            size: 26,
          ),
          FaIcon(
            FontAwesomeIcons.store,
            color: Colors.white,
            size: 26,
          ),
          Container(
            alignment: AlignmentDirectional.center,
            width: 40,
            height: 40,
            child: Text('Book',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          FaIcon(
            FontAwesomeIcons.mapLocationDot,
            color: Colors.white,
            size: 26,
          ),
          FaIcon(
            FontAwesomeIcons.ellipsis,
            color: Colors.white,
            size: 26,
          ),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        index: index,
      ),
    );
  }
}
