import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hogozat/core/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'my_trips_state.dart';

class MyTripsCubit extends Cubit<MyTripsState> {
  MyTripsCubit() : super(MyTripsInitial());

  final fireStore = FirebaseFirestore.instance;
  int time = DateTime.now().microsecondsSinceEpoch;
  String uid = PreferenceUtils.getString(PrefKeys.uid);
  Map<String, dynamic> upComingMap = {
    'data': [
      // {
      //   'from': 'Giza',
      //   'fromStation': 'Ramses',
      //   'to': 'Alexandria',
      //   'toStation': 'karmoz',
      //   'departureDate': '2024/5/4',
      //   'price': 300,
      //   'typBus': 'first'
      // },
      // {
      //   'from': 'Giza',
      //   'fromStation': 'Ramses',
      //   'to': 'Hurghada',
      //   'toStation': 'Al Ahyaa',
      //   'departureDate': '2024/7/20',
      //   'price': 300,
      //   'typBus': 'first'
      // }
    ]
  };
  Map<String, dynamic> currentMap = {
    'data': [
      // {
      //   'from': 'Giza',
      //   'fromStation': 'Ramses',
      //   'to': 'Alexandria',
      //   'toStation': 'karmoz',
      //   'departureDate': '2024/4/4',
      //   'price': 300,
      //   'type': 'first'
      // },
      // {
      //   'from': 'Giza',
      //   'fromStation': 'Ramses',
      //   'to': 'Hurghada',
      //   'toStation': 'Al Ahyaa',
      //   'departureDate': '2024/4/4',
      //   'price': 300,
      //   'type': 'first'
      // }
    ]
  };
  Map<String, dynamic> pastMap = {
    'data': [
      {
        'from': 'Giza',
        'fromStation': 'Ramses',
        'to': 'Alexandria',
        'toStation': 'karmoz',
        'departureDate': '2024/4/4',
        'price': 300,
        'type': 'first'
      },
      {
        'from': 'Alexandria',
        'fromStation': 'karmoz',
        'to': 'Giza',
        'toStation': 'Ramses',
        'departureDate': '2024/4/6',
        'price': 300,
        'type': 'first'
      },
      {
        'from': 'Giza',
        'fromStation': 'Ramses',
        'to': 'Hurghada',
        'toStation': 'Al Ahyaa',
        'departureDate': '2024/4/9',
        'price': 300,
        'type': 'first'
      },
      {
        'from': 'Hurghada',
        'fromStation': 'Al Ahyaa',
        'to': 'Giza',
        'toStation': 'Ramses',
        'departureDate': '2024/4/12',
        'price': 300,
        'type': 'first'
      },
      {
        'from': 'Giza',
        'fromStation': 'Ramses',
        'to': 'Hurghada',
        'toStation': 'Al Ahyaa',
        'departureDate': '2024/4/25',
        'price': 300,
        'type': 'first'
      },
      {
        'from': 'Hurghada',
        'fromStation': 'karmoz',
        'to': 'Giza',
        'toStation': 'Ramses',
        'departureDate': '2024/4/30',
        'price': 300,
        'type': 'first'
      },
    ]
  };
  DateTime dateNow = DateTime.now();

  getData() {
    fireStore
        .collection('upComingMap').where('userId',isEqualTo: uid)
        .get()
        .then((value) {
          value.docs.forEach((doc) {
            print(doc.data());
        upComingMap['data'].add(doc.data());
      });
      emit(MyTripsSuccessState());
    })
        .catchError((er) {
          emit(MyTripsFailureState());
    });
  }
}
