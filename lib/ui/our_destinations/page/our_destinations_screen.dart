import 'package:flutter/material.dart';

class OurDestinationsScreen extends StatefulWidget {
  const OurDestinationsScreen({super.key});

  @override
  State<OurDestinationsScreen> createState() => _OurDestinationsScreenState();
}

class _OurDestinationsScreenState extends State<OurDestinationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Our Destination")),
    );
  }
}
