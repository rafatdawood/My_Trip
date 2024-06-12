import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'return_booking_trip_state.dart';

class ReturnBookingTripCubit extends Cubit<ReturnBookingTripState> {
  ReturnBookingTripCubit() : super(ReturnBookingTripInitial());
  Map<String, dynamic> tripMap = {};
  Map<String, dynamic> bookingData = {};
  Map<String, dynamic> bookingTripMap = {
    'tripId': '',
    'data': [

    ]
  };

  List<dynamic> selectedMap = [];
  List seatsNumber = [];
  String from ='';
  String fromStation ='';
  String to ='';
  String toStation ='';
  String returnDate = '';

  num setPrice() {
    num price = 0;
    for (var i in selectedMap) {
      price += i['price'];
    }
    return price;
  }

  select({required x, required index, required price, required type}) {
    if (index.runtimeType == String ||
        bookingTripMap['booked'].contains(index)) {
      return null;
    }
    var target = selectedMap.where((e) => (e['seatNumber'] == index));
    if (target.isEmpty) {
      selectedMap.add({'seatNumber': index, 'price': price, 'type': type});
      seatsNumber.add(index);
      emit(ReturnBookingTripAddSuccessState());
    } else {
      selectedMap.removeWhere((e) => e['seatNumber'] == index);
      seatsNumber.remove(index);
      emit(ReturnBookingTripRemoveSuccessState());
    }
  }

  getData() {
    bookingTripMap = tripMap;
  }

  // naToBillScreen() {
  //   if (seatsNumber.isEmpty) {
  //     emit(BookingTripHaveSeatsFailureState('You have no selected seats'));
  //   }else{
  //     bookingData.addAll({
  //       'seatsNumber': seatsNumber,
  //       'price': setPrice(),
  //       'from': tripMap['from'],
  //       'fromStation': tripMap['fromStation'],
  //       'to': tripMap['to'],
  //       'toStation': tripMap['toStation'],
  //       'departureDate': tripMap['departureDate'],
  //       'tripId': tripMap['tripId'],
  //       'selectedMap': selectedMap,
  //     });
  //     emit(BookingTripHaveSeatsSuccessState());
  //   }
  // }
  naToBillScreen() {
    if (seatsNumber.isEmpty) {
      emit(ReturnBookingTripHaveSeatsFailureState('You have no selected seats'));
    }else{
      bookingData['seatsNumber'] = seatsNumber;
      bookingData['price']= setPrice();
      bookingData['from']= tripMap['from'];
      bookingData['fromStation']= tripMap['fromStation'];
      bookingData['to']= tripMap['to'];
      bookingData['toStation']= tripMap['toStation'];
      bookingData['departureDate']= tripMap['departureDate'];
      bookingData['tripId']= tripMap['tripId'];
      bookingData['selectedMap']= selectedMap;
      print(bookingData);
      emit(ReturnBookingTripHaveSeatsSuccessState());
    }
  }
}
