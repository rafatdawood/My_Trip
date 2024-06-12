import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hogozat/ui/my_trips/manager/my_trips_cubit.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  final cubit = MyTripsCubit();

  @override
  void initState() {
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Trips"),
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('UpComing'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Current'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Past'),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
          body: BlocBuilder<MyTripsCubit, MyTripsState>(
            builder: (context, state) {
              return TabBarView(
                  children: [upComingPage(), currentPage(), pastPage()]);
            },
          ),
        ),
      ),
    );
  }

  Widget upComingPage() {
    if (cubit.upComingMap['data'].length == 0) {
      return Center(
        child: Text(
          'No Trips Available',
          style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      );
    } else {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: cubit.upComingMap['data'].length,
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          color: Color(0xfff0f3ff),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 400,
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
                                Text(
                                    '${cubit.upComingMap['data'][index]['from']}/${cubit.upComingMap['data'][index]['fromStation']}',
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text(
                                    '${cubit.upComingMap['data'][index]['to']}/${cubit.upComingMap['data'][index]['toStation']}',
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                cubit.upComingMap['data'][index]
                                    ['departureDate'],
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Trip Id',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(width: 50),
                                Text(
                                  cubit.upComingMap['data'][index]['tripId'],
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(width: 50),
                                Text(
                                    '${cubit.upComingMap['data'][index]['price'].toString()} EGP',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17))
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Seats details',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(width: 50),
                                InkWell(
                                  onTap: () => showSeatsDialog(index),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(Icons.info,
                                        color: Colors.blue[900]),
                                  ),
                                ),
                              ],
                            ),
                          ]),
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
    );}
  }

  Widget currentPage() {
    if (cubit.currentMap['data'].length == 0) {
      return Center(
          child: Text(
            'No Trips Available',
            style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
      );
    } else {
      return ListView.builder(
        itemCount: cubit.currentMap['data'].length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
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
                              Icon(Icons.wb_sunny_outlined, color: Colors.blue),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_right_alt, color: Colors.blue),
                              Icon(Icons.directions_bus_outlined,
                                  color: Colors.blue[800]),
                              Icon(Icons.arrow_right_alt, color: Colors.blue),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.wb_sunny_outlined, color: Colors.blue),
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
                          Text(
                              '${cubit.currentMap['data'][index]['from']}/${cubit.currentMap['data'][index]['fromStation']}',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          Text(
                              '${cubit.currentMap['data'][index]['to']}/${cubit.currentMap['data'][index]['toStation']}',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(cubit.currentMap['data'][index]['departureDate'],
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(cubit.currentMap['data'][index]['type'],
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                          SizedBox(width: 50),
                          Text(
                              '${cubit.currentMap['data'][index]['price'].toString()} EGP',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17))
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      );
    }
  }

  Widget pastPage() {
    if (cubit.pastMap['data'].length == 0) {
      return Center(
        child: Text(
          'No Trips Available',
          style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      );
    } else {
    return ListView.builder(
      itemCount: cubit.pastMap['data'].length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
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
                            Icon(Icons.wb_sunny_outlined, color: Colors.blue),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_right_alt, color: Colors.blue),
                            Icon(Icons.directions_bus_outlined,
                                color: Colors.blue[800]),
                            Icon(Icons.arrow_right_alt, color: Colors.blue),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.wb_sunny_outlined, color: Colors.blue),
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
                        Text(
                            '${cubit.pastMap['data'][index]['from']}/${cubit.pastMap['data'][index]['fromStation']}',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                        Text(
                            '${cubit.pastMap['data'][index]['to']}/${cubit.pastMap['data'][index]['toStation']}',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 17))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(cubit.pastMap['data'][index]['departureDate'],
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(cubit.pastMap['data'][index]['type'],
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                        SizedBox(width: 50),
                        Text(
                            '${cubit.pastMap['data'][index]['price'].toString()} EGP',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 17))
                      ],
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );}
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
              itemCount: cubit.upComingMap['data'][index]['selectedMap'].length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Text(
                      'Seat Number ${cubit.upComingMap['data'][index]['selectedMap'][i]['seatNumber']}',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Spacer(),
                    Text(
                      cubit.upComingMap['data'][index]['selectedMap'][i]
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
}
