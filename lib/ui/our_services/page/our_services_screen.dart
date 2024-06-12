import 'package:flutter/material.dart';

class OurServicesScreen extends StatefulWidget {
  const OurServicesScreen({super.key});

  @override
  State<OurServicesScreen> createState() => _OurServicesScreenState();
}

class _OurServicesScreenState extends State<OurServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f3ff),
      appBar: AppBar(title: Text("Our Services"), centerTitle: true),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Private bus rentals',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/bus-rides.jpg'),fit: BoxFit.fill)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(textAlign: TextAlign.center,
                      'As My Trip Egypt is the leader of transportation services in Egypt, our customer can book a private car with driver at any time to do your trip all over Egypt.'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Group Bookings',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/group-buses.jpg'),fit: BoxFit.fill)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(textAlign: TextAlign.center,
                      'My Trip Egypt provides group booking for 10 persons in economical prices.'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Shipment',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/coach-bus.jpg'),fit: BoxFit.fill)),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(textAlign: TextAlign.center,
                      'My Trip enables its customer to transfer any documents and small object to our different destination all over Egypt.'),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
