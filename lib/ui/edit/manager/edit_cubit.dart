import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());
  Map<String, dynamic> tripData = {};
  int index = 0;
  Map<String, dynamic> bookingTripMap = {'tripId': '', 'data': []};
  List<dynamic> selectedMap = [];
  List seatsNumber = [];
  final firebase = FirebaseFirestore.instance;

  select({required x, required index, required price, required type}) {
    if (index.runtimeType == String ||
        bookingTripMap['data']['busData'][x]['booked'].contains(index)) {
      return null;
    }
    var target = selectedMap.where((e) => (e['seatNumber'] == index));
    if (target.isEmpty) {
      selectedMap.add({'seatNumber': index, 'price': price, 'type': type});
      tripData['price'] = setPrice();
      seatsNumber.add(index);
      emit(EditAddSuccessState());
      print(seatsNumber);
    } else {
      selectedMap.removeWhere((e) => e['seatNumber'] == index);
      tripData['price'] = setPrice();
      seatsNumber.remove(index);
      print(seatsNumber);
      emit(EditRemoveSuccessState());
    }
    emit(EditSuccessState());
  }

  num setPrice() {
    num price = 0;
    for (var i in selectedMap) {
      price += i['price'];
    }
    return price;
  }

  getData(String id) {
    firebase.collection('availableTrips').doc(id).get().then((value) {
      bookingTripMap['data'] = value.data();
      selectedMap = tripData['selectedMap'];
      seatsNumber = tripData['seatsNumber'];
      emit(EditSuccessState());
    }).catchError((onError) {
      emit(EditFailureState());
    } );
  }
}
