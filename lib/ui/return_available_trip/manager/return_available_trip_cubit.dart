import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'return_available_trip_state.dart';

class ReturnAvailableTripCubit extends Cubit<ReturnAvailableTripState> {
  ReturnAvailableTripCubit() : super(ReturnAvailableTripInitial());
  String from = '';
  String fromStation = '';
  String to = '';
  String toStation = '';
  String returnDate = '';
  final fireStore = FirebaseFirestore.instance;

  Map<String, dynamic> availableGoTrips = {
    'goTrips': [],
    'returnTrips': [],
  };


  getData() {
    fireStore
        .collection('availableTrips')
        .where('from', isEqualTo: from)
        .where('fromStation', isEqualTo: fromStation)
        .where('departureDate', isEqualTo: returnDate)
        .where('to', isEqualTo: to)
        .where('toStation', isEqualTo: toStation)
        .get()
        .then((value) {
      availableGoTrips['returnTrips'].clear();
      for (var doc in value.docs) {
        availableGoTrips['returnTrips'].add(doc.data());
      }
      emit(ReturnAvailableTripSuccessState());
    });
  }
}
