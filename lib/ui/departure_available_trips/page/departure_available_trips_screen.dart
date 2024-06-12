import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogozat/ui/departure_available_trips/manager/departure_available_trips_cubit.dart';
import '../../booking_trip/page/booking_trip_screen.dart';

class DepartureAvailableTripsScreen extends StatefulWidget {
  const DepartureAvailableTripsScreen(
      {super.key,
      required this.from,
      required this.to,
      required this.goDate,
      required this.returnDate});

  final String from;
  final String to;
  final String goDate;
  final String returnDate;

  @override
  State<DepartureAvailableTripsScreen> createState() =>
      _DepartureAvailableTripsScreenState();
}

class _DepartureAvailableTripsScreenState
    extends State<DepartureAvailableTripsScreen> {
  final cubit = DepartureAvailableTripsCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.from = widget.from.split('-')[0].trim();
    cubit.fromStation = widget.from.split('-')[1].trim();
    cubit.to = widget.to.split('-')[0].trim();
    cubit.toStation = widget.to.split('-')[1].trim();
    cubit.goDate = widget.goDate;
    cubit.returnDate = widget.returnDate;
    cubit.getData();
    print(cubit.bookingData['data']);
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
                        cubit.goDate,
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
            BlocBuilder<DepartureAvailableTripsCubit,
                DepartureAvailableTripsState>(
              builder: (context, state) {
                return Expanded(child: body());
              },
            ),
          ],
        ),
        // bottomSheet: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 20),
        //   height: 100,
        //   width: double.infinity,
        //   decoration: BoxDecoration(color: Colors.blue[900]),
        //   child:
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.event_seat,
        //           color: Colors.white,
        //         ),
        //         SizedBox(width: 10),
        //         Text(
        //           '${cubit.getSeatsCount()} Seats',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 15,
        //           ),
        //         )
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         Text(
        //           'Price',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 17,
        //           ),
        //         ),
        //         SizedBox(width: 10),
        //         InkWell(
        //           onTap: () {
        //             print(cubit.bookingData);
        //           },
        //           child: Text(
        //             '${cubit.setPrice()} EGP',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 15,
        //             ),
        //           ),
        //         )
        //       ],
        //     )
        //   ]),
        // ),
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
                    "Departure Trips",
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
    if (cubit.availableGoTrips['goTrips'].length == 0) {
      return Expanded(
          child: Center(
              child: Text(
        'No Trips Available',
        style: TextStyle(
            color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 20),
      )));
    } else {
      return Expanded(
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: cubit.availableGoTrips['goTrips'].length,
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
                                tripMap: cubit.availableGoTrips['goTrips'][index],
                                from: cubit.from,
                                fromStation: cubit.fromStation,
                                to: cubit.to,
                                toStation: cubit.toStation,
                                goDate: cubit.goDate,
                              returnDate: cubit.returnDate,
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
                                              '${cubit.availableGoTrips['goTrips'][index]['from']}/${cubit.availableGoTrips['goTrips'][index]['fromStation']}',
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17)),
                                        ),
                                        Expanded(
                                          child: Text(
                                              '${cubit.availableGoTrips['goTrips'][index]['to']}/${cubit.availableGoTrips['goTrips'][index]['toStation']}',
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
                                        cubit.availableGoTrips['goTrips'][index]
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
                                            .availableGoTrips['goTrips'][index]['busData']
                                            .length,
                                        itemBuilder: (context, i) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  cubit.availableGoTrips['goTrips'][index]
                                                      ['busData'][i]['typBus'],
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17)),
                                              SizedBox(width: 50),
                                              Text(
                                                  '${cubit.availableGoTrips['goTrips'][index]['busData'][i]['price'].toString()} EGP',
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
      required String returnDate,
      required String goDate}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingTripScreen(
            tripMap: tripMap,
            from: from,
            to: to,
            fromStation: fromStation,
            toStation: toStation, goDate: goDate, returnDate: returnDate,
          ),
        ));
  }
}
