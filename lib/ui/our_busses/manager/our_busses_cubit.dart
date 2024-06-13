import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

part 'our_busses_state.dart';

class OurBussesCubit extends Cubit<OurBussesState> {
  OurBussesCubit() : super(OurBussesInitial());

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
        ],
        'images':[
          'assets/1.1.jpeg',
          'assets/1.jpg',
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
        ],
        'images':[
          'assets/2.1.jpeg',
          'assets/2.jpg',
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
        ],
        'images':[
          'assets/3.1.jpeg',
          'assets/3.jpg',
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
        ],
        'images':[
          'assets/4.1.jpeg',
          'assets/4.jpg',
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
        ],
        'images':[
          'assets/5.1.jpeg',
          'assets/5.jpg',
        ]
      }
    ]
  };
  getData(){
    emit(OurBussesSuccessState());
  }
}
