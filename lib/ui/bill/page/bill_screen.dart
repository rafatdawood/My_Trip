import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hogozat/ui/bill/manager/bill_cubit.dart';
import 'package:hogozat/ui/book_now/page/book_now_screen.dart';
import 'package:hogozat/ui/booking_trip/manager/booking_trip_cubit.dart';
import 'package:hogozat/ui/edit/manager/edit_cubit.dart';
import 'package:hogozat/ui/edit/page/edit_screen.dart';
import 'package:hogozat/ui/pay_options/page/pay_options_screen.dart';

import '../../main/page/main.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({
    super.key,
  });

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  List<dynamic> selectedMap = [];
  late BookingTripCubit cubit;

  final billCubit = BillCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = BlocProvider.of<BookingTripCubit>(context);
    billCubit.billMap['data'] = cubit.bookingData;
    billCubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => billCubit,
      child: BlocListener<BillCubit, BillState>(
        listener: (context, state) => logic(state),
        child: BlocBuilder<BillCubit, BillState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                  leading: InkWell(
                      onTap: () => navToMainScreen(),
                      child: Icon(
                        Icons.home,
                        color: Colors.blue[900],
                      ))),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: billCubit.billMap['data'].length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Color(0xfff0f3ff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            // padding: EdgeInsets.all(30),
                            margin: EdgeInsets.all(20),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'From : ',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        '${billCubit.billMap['data'][index]['from']} - ${billCubit.billMap['data'][index]['fromStation']}',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'To : ',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        '${billCubit.billMap['data'][index]['to']} - ${billCubit.billMap['data'][index]['toStation']}',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Date : ',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        billCubit.billMap['data'][index]
                                            ['departureDate'],
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Trip Number : ',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        billCubit.billMap['data'][index]
                                            ['tripId'],
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Number of seats : ',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        InkWell(
                                          onTap: () => showSeatsDialog(index),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Icon(Icons.info,
                                                color: Colors.blue[900]),
                                          ),
                                        ),
                                        Text(
                                          billCubit
                                              .billMap['data'][index]
                                                  ['seatsNumber']
                                              .length
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Divider(),
                                      Positioned(
                                        right: -25,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                      Positioned(
                                        left: -25,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${billCubit.billMap['data'][index]['price']} EGP',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () => editTrip(index),
                                        child: Text('Edit Ticket',
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            billCubit.removeTripState(),
                                        child: Text('Cancel Ticket',
                                            style:
                                                TextStyle(color: Colors.blue)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () => navToPayOptionsScreen(),
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 50)),
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future showSeatsDialog(index) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Your Seats', style: TextStyle(color: Colors.blue[900])),
        children: [
          Container(
            height: 200,
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: billCubit.billMap['data'][index]['selectedMap'].length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Text(
                      'Seat Number ${billCubit.billMap['data'][index]['selectedMap'][i]['seatNumber']}',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Spacer(),
                    Text(
                      billCubit.billMap['data'][index]['selectedMap'][i]
                          ['type'],
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 50)),
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }

  navToMainScreen() {
    billCubit.billMap['data'] = [];
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
  }

  logic(BillState state) {
    if (state is BillRemoveState) {
      billCubit.billMap['data'] = cubit.bookingData;
      Fluttertoast.showToast(msg: state.massage);
      billCubit.getData();
    }
  }

  editTrip(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: cubit,
          child: EditScreen(
            index: index,
          ),
        ),
      ),
    );
  }

  navToPayOptionsScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PayOptionsScreen(
            totalPrice: billCubit.concatPrise(),
            tripsData: billCubit.billMap['data'],
          ),
        ));
  }
}
