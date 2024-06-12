import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hogozat/ui/bill/page/bill_screen.dart';
import 'package:hogozat/ui/booking_trip/manager/booking_trip_cubit.dart';
import 'package:hogozat/ui/return_booking_trip/manager/return_booking_trip_cubit.dart';

class ReturnBookingTrip extends StatefulWidget {
  const ReturnBookingTrip({
    super.key,
    required this.tripMap,
    required this.from,
    required this.fromStation,
    required this.toStation,
    required this.to,
    required this.returnDate,
  });

  final Map<String, dynamic> tripMap;
  final String from;
  final String fromStation;
  final String to;
  final String toStation;
  final String returnDate;

  @override
  State<ReturnBookingTrip> createState() => _ReturnBookingTripState();
}

class _ReturnBookingTripState extends State<ReturnBookingTrip> {
  final cubit = ReturnBookingTripCubit();
  late BookingTripCubit dataCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.tripMap = widget.tripMap;
    cubit.from = widget.from;
    cubit.fromStation = widget.fromStation;
    cubit.to = widget.to;
    cubit.toStation = widget.toStation;
    cubit.returnDate = widget.returnDate;
    cubit.getData();
    print(cubit.bookingTripMap);
    dataCubit = BlocProvider.of<BookingTripCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ReturnBookingTripCubit, ReturnBookingTripState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.event_seat,
                                    color: Colors.red, size: 30),
                                Text(
                                  'Booked',
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.event_seat,
                                    color: Colors.grey, size: 30),
                                Text(
                                  'Available',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.event_seat,
                                    color: Colors.blue, size: 30),
                                Text(
                                  'Selected',
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.bookingTripMap['busData'].length,
                        itemBuilder: (context, x) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      cubit.bookingTripMap['busData'][x]
                                          ['typBus'],
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                              AnimationLimiter(
                                child: GridView.builder(
                                  itemCount: cubit
                                      .bookingTripMap['busData'][x]['allSeats']
                                      .length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(5),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5),
                                  itemBuilder: (context, index) {
                                    return  AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 5,
                                      duration: Duration(milliseconds: 200),
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            enableFeedback: false,
                                            overlayColor: MaterialStatePropertyAll(
                                                Colors.transparent),
                                            onTap: () => cubit.select(
                                                x: x,
                                                index: cubit.bookingTripMap['busData']
                                                    [x]['allSeats'][index],
                                                price: cubit.bookingTripMap['busData']
                                                    [x]['price'],
                                                type: cubit.bookingTripMap['busData'][x]
                                                    ['typBus']),
                                            child: sets(
                                                x,
                                                cubit.bookingTripMap['busData'][x]
                                                    ['allSeats'][index]),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Selected Seats',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: seatsCount(),
                            ),
                            Row(
                              children: [
                                Text('Price',
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Spacer(),
                                Text('${cubit.setPrice().toString()} EGP',
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  width: double.infinity,
                  color: Colors.blue[900],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlocListener<ReturnBookingTripCubit,
                          ReturnBookingTripState>(
                        listener: (context, state) => logic(state),
                        child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => cubit.naToBillScreen(),
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              child: const Text("Book Now",
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.event_seat,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                cubit.selectedMap.length.toString(),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '${cubit.setPrice().toString()} EGP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  sets(x, index) {
    if (index == '0') {
      return SizedBox();
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              index == 'Wc' ? Icons.wc : Icons.event_seat,
              color: changeColor(x, index),
              size: 30,
            ),
            Text('$index')
          ],
        ),
      );
    }
  }

  changeColor(x, index) {
    if (cubit.bookingTripMap['booked'].contains(index)) {
      return Colors.red;
    } else if (cubit.seatsNumber.contains(index)) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }

  seatsCount() {
    if (cubit.selectedMap.isEmpty) {
      return Text(
        'You have no selected seats yet',
        style: TextStyle(color: Colors.blue),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: cubit.selectedMap.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Text(
                'Seat Number ${cubit.selectedMap[index]['seatNumber']}',
                style: TextStyle(color: Colors.blue),
              ),
              Spacer(),
              Text(
                '${cubit.selectedMap[index]['type']}',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          );
        },
      );
    }
  }

  logic(ReturnBookingTripState state) {
    if (state is ReturnBookingTripHaveSeatsFailureState) {
      Fluttertoast.showToast(msg: state.massage);
    } else if (state is ReturnBookingTripHaveSeatsSuccessState) {
      dataCubit.bookingData.add(cubit.bookingData);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: dataCubit,
              child: BillScreen(),
            ),
          ),);
    }
  }

}
