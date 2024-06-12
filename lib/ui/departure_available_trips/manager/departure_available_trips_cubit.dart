import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'departure_available_trips_state.dart';

class DepartureAvailableTripsCubit extends Cubit<DepartureAvailableTripsState> {
  DepartureAvailableTripsCubit() : super(DepartureAvailableTripsInitial());
  String from = '';
  String fromStation = '';
  String to = '';
  String toStation = '';
  String goDate = '';
  String returnDate = '';
  final fireStore = FirebaseFirestore.instance;

  Map<String, dynamic> bookingData = {
    'data': [
    ]
  };

  Map<String, dynamic> availableGoTrips = {
    'goTrips': [],
    'returnTrips': [],
  };


  getData() {
    fireStore
        .collection('availableTrips')
        .where('from', isEqualTo: from)
        .where('fromStation', isEqualTo: fromStation)
        .where('departureDate', isEqualTo: goDate)
        .where('to', isEqualTo: to)
        .where('toStation', isEqualTo: toStation)
        .get()
        .then(
          (value) {
        availableGoTrips['goTrips'].clear();
        for (var doc in value.docs) {
          availableGoTrips['goTrips'].add(doc.data());
        }
        emit(DepartureAvailableTripsSuccessState());
      },
    ).catchError(
          (e) {
        emit(DepartureAvailableTripsFailureState());
      },
    );
    // fireStore.collection('availableTrips').doc('nyKiaNYPu7GvCNG2Wa17').set({
    //   'busData':[{
    //       'allSeats': [1,2,'0',3,4,5,6,'0',7,8,9,10,'0',11,12,13,14,'0',15,16,17,18,'0','0','Wc',19,20,'0','0','0',21,22,'0',23,24,25,26,'0',27,28,29,30,'0',31,32,33,34,'0',35,36,37,38,'0',39,40,41,42,'0',43,44],
    //       'price': 360,
    //       'typBus': "Comfort",
    //       'booked':[],
    //     }],
    //   'departureDate':'2024/7/20',
    //   'from':'Cairo',
    //   'fromStation':'Ramsis',
    //   'to':'Hurghada',
    //   'toStation':'Al Ahyaa',
    //   'tripId':'nyKiaNYPu7GvCNG2Wa17'
    // }).then((value) => null);
  }

  num setPrice() {
    num price = 0;
    for (var i in bookingData['data']) {
      for(var x in i['selectedMap']){
        price += x['price'];
      }
    }
    return price;
  }

  num getSeatsCount() {
    num count = 0;
    for (var i in bookingData['data']) {
      for(var x in i['selectedMap']){
        count +=1;
      }
    }
    return count;
  }
}
