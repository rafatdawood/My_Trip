import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hogozat/core/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'pay_options_state.dart';

class PayOptionsCubit extends Cubit<PayOptionsState> {
  PayOptionsCubit() : super(PayOptionsInitial());

  final fireStore = FirebaseFirestore.instance;
  final uid = PreferenceUtils.getString(PrefKeys.uid);

  Map<String, dynamic> tripData = {};
  int totalPrice = 0;
  List tripsData = [];
  int value = 0;

  num seats() {
    num count = 0;
    for (var i in tripsData) {
      count += i['seatsNumber'].length;
    }
    return count;
  }

  getData(data, price) {
    tripsData = data;
    totalPrice = price;
    emit(PayOptionsSuccessState());
  }

  selectPayMethod() {
    if (value == 0) {
      emit(PaymentMethodFailureState('No payment method has been selected'));
    } else {
      for (var i in tripsData) {
        fireStore
            .collection('availableTrips')
            .doc(i['tripId'])
            .update({'booked': FieldValue.arrayUnion(i['seatsNumber'])});
        fireStore.collection('myTrips').doc(uid).update({
          'upComingMap': FieldValue.arrayUnion([i])
        });
      }
      emit(PaymentMethodSuccessState('Payment method is done'));
    }
  }
}
