import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogozat/ui/bill/page/bill_screen.dart';
import 'package:hogozat/ui/edit/manager/edit_cubit.dart';

import '../../booking_trip/manager/booking_trip_cubit.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    // required this.tripData,
    required this.index,
  });

  // final Map<String, dynamic> tripData;
  final int index;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final editCubit = EditCubit();
  late BookingTripCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = BlocProvider.of<BookingTripCubit>(context);
    editCubit.tripData = cubit.bookingData[editCubit.index];
    editCubit.index = widget.index;
    editCubit.getData(editCubit.tripData['tripId']);
    //{seatsNumber: [8],
    // price: 845,
    // from: Hurghada,
    // fromStation: Al Ahyaa,
    // to: Cairo,
    // toStation: Ramsis,
    // departureDate: 2024/7/21,
    // tripId: nyKiaNYPu7GvCNG2Wa15,
    // selectedMap: [{seatNumber: 8, price: 845, type: First Prime}]}
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => editCubit,
        child: BlocBuilder<EditCubit, EditState>(
          buildWhen: (previous, current) => current is EditSuccessState,
          builder: (context, state) {
            if (state is EditSuccessState) {
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
                          itemCount: editCubit
                              .bookingTripMap['data']['busData'].length,
                          itemBuilder: (context, x) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        editCubit.bookingTripMap['data']
                                        ['busData'][x]['typBus'],
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ],
                                ),
                                GridView.builder(
                                  itemCount: editCubit
                                      .bookingTripMap['data']['busData'][x]
                                  ['allSeats']
                                      .length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(5),
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      enableFeedback: false,
                                      overlayColor: MaterialStatePropertyAll(
                                          Colors.transparent),
                                      onTap: () =>
                                          editCubit.select(
                                              x: x,
                                              index: editCubit
                                                  .bookingTripMap['data']
                                              ['busData'][x]['allSeats'][index],
                                              price:
                                              editCubit.bookingTripMap['data']
                                              ['busData'][x]['price'],
                                              type: editCubit
                                                  .bookingTripMap['data']
                                              ['busData'][x]['typBus']),
                                      child: sets(
                                          x,
                                          editCubit.bookingTripMap['data']
                                          ['busData'][x]['allSeats']
                                          [index]),
                                    );
                                  },
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
                                  Text('${editCubit.setPrice().toString()} EGP',
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
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => navToBillScreen(),
                            style: const ButtonStyle(
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                            child: const Text("Done",
                                style: TextStyle(color: Colors.white)),
                          ),
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
                                  editCubit.selectedMap.length.toString(),
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
                                  '${editCubit.setPrice().toString()} EGP',
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
            } else {
              return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
            }
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
    if (editCubit.bookingTripMap['data']['busData'][x]['booked']
        .contains(index)) {
      return Colors.red;
    } else if (editCubit.seatsNumber.contains(index)) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }

  seatsCount() {
    if (editCubit.selectedMap.isEmpty) {
      return Text(
        'You have no selected seats yet',
        style: TextStyle(color: Colors.blue),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: editCubit.selectedMap.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Text(
                'Seat Number ${editCubit.selectedMap[index]['seatNumber']}',
                style: TextStyle(color: Colors.blue),
              ),
              Spacer(),
              Text(
                '${editCubit.selectedMap[index]['type']}',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          );
        },
      );
    }
  }

  navToBillScreen() {
    cubit.bookingData[editCubit.index] = editCubit.tripData;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BlocProvider.value(
              value: cubit,
              child: BillScreen(),
            ),
      ),
    );
  }
}
