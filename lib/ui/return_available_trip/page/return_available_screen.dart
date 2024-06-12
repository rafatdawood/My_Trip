import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogozat/ui/booking_trip/manager/booking_trip_cubit.dart';
import 'package:hogozat/ui/booking_trip/page/booking_trip_screen.dart';
import 'package:hogozat/ui/return_available_trip/manager/return_available_trip_cubit.dart';
import 'package:hogozat/ui/return_booking_trip/page/return_booking_trip.dart';

class ReturnAvailableScreen extends StatefulWidget {
  const ReturnAvailableScreen(
      {super.key,
      required this.from,
      required this.fromStation,
      required this.to,
      required this.toStation,
      required this.returnDate});

  final String from;
  final String fromStation;
  final String to;
  final String toStation;
  final String returnDate;

  @override
  State<ReturnAvailableScreen> createState() => _ReturnAvailableScreenState();
}

class _ReturnAvailableScreenState extends State<ReturnAvailableScreen> {
  late BookingTripCubit dataCubit;
  final cubit = ReturnAvailableTripCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.from = widget.from;
    cubit.fromStation = widget.fromStation;
    cubit.to = widget.to;
    cubit.toStation = widget.toStation;
    cubit.returnDate = widget.returnDate;
    cubit.getData();
    dataCubit = BlocProvider.of<BookingTripCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Available trips'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 25,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.circle,
                          size: 19,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        ' - ${cubit.from} - ${cubit.fromStation}',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 25,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.arrowDownLong,
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        cubit.returnDate,
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 25,
                        alignment: AlignmentDirectional.center,
                        child: FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 19,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        ' - ${cubit.to} - ${cubit.toStation}',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<ReturnAvailableTripCubit, ReturnAvailableTripState>(
              builder: (context, state) {
                return Expanded(child: body());
              },
            )
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.blue, width: 5),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Return Trips",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        finalTrips()
      ],
    );
  }

  Widget finalTrips() {
    if (cubit.availableGoTrips['returnTrips'].length == 0) {
      return Expanded(
          child: Center(
              child: Text(
        'No Trips Available',
        style: TextStyle(
            color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 20),
      )));
    } else {
      return AnimationLimiter(
        child: Expanded(
          child: ListView.builder(
            itemCount: cubit.availableGoTrips['returnTrips'].length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => navToBookingTrip(
                            tripMap: cubit.availableGoTrips['returnTrips'][index],
                            from: cubit.from,
                            to: cubit.to,
                            returnDate: cubit.returnDate,
                            fromStation: cubit.fromStation,
                            toStation: cubit.toStation,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                color: Color(0xfff0f3ff),
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: 250,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.all(20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.wb_sunny_outlined,
                                              color: Colors.blue),
                                          Text(
                                            "12:30 AM",
                                            style: TextStyle(
                                                color: Colors.blue[800],
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.arrow_right_alt,
                                              color: Colors.blue),
                                          Icon(Icons.directions_bus_outlined,
                                              color: Colors.blue[800]),
                                          Icon(Icons.arrow_right_alt,
                                              color: Colors.blue),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.wb_sunny_outlined,
                                              color: Colors.blue),
                                          Text(
                                            "3:30 AM",
                                            style: TextStyle(
                                                color: Colors.blue[800],
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            '${cubit.availableGoTrips['returnTrips'][index]['from']}/${cubit.availableGoTrips['returnTrips'][index]['fromStation']}',
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                      ),
                                      Expanded(
                                        child: Text(
                                            '${cubit.availableGoTrips['returnTrips'][index]['to']}/${cubit.availableGoTrips['returnTrips'][index]['toStation']}',
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                      cubit.availableGoTrips['returnTrips'][index]
                                          ['departureDate'],
                                      style: TextStyle(
                                          color: Colors.blue[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                  //   children: [
                                  //     Text(
                                  //         cubit.availableGoTrips[cubit.target][index]
                                  //             ['typBus'],
                                  //         style: TextStyle(
                                  //             color: Colors.blue,
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 17)),
                                  //     SizedBox(width: 50),
                                  //     Text(
                                  //         '${cubit.availableGoTrips[cubit.target][index]['price'].toString()} EGP',
                                  //         style: TextStyle(
                                  //             color: Colors.blue,
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 17))
                                  //   ],
                                  // ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: cubit
                                          .availableGoTrips['returnTrips'][index]
                                              ['busData']
                                          .length,
                                      itemBuilder: (context, i) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                cubit.availableGoTrips['returnTrips']
                                                    [index]['busData'][i]['typBus'],
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17)),
                                            SizedBox(width: 50),
                                            Text(
                                                '${cubit.availableGoTrips['returnTrips'][index]['busData'][i]['price'].toString()} EGP',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17))
                                          ],
                                        );
                                      },
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  navToBookingTrip(
      {required tripMap,
      required String from,
      required String fromStation,
      required String to,
      required String toStation,
      required String returnDate}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: dataCubit,
            child: ReturnBookingTrip(
              tripMap: tripMap,
              from: from,
              to: to,
              returnDate: returnDate,
              fromStation: fromStation,
              toStation: toStation,
            ),
          ),
        ));
  }
}
