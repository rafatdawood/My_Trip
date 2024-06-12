import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_now_state.dart';

class BookNowCubit extends Cubit<BookNowState> {
  BookNowCubit() : super(BookNowInitial());

  Map<String, dynamic> cities = {
    'data': [
      // {
      //   'governorate': 'Giza',
      //   'station': [
      //     '6 October - El Hussary',
      //     'Abd Elmnem Read',
      //   ],
      //   'state': false,
      // },
      {
        'governorate': 'Cairo',
        'station': [
          'Ramsis ',
          'Sekka Club ',
          'Maadi Ring RD Watanya',
        ],
        'state': false,
      },
      // {
      //   'governorate': 'Alexandria',
      //   'station': [
      //     'Moharam Bek',
      //     'Sidi Gaber',
      //   ],
      //   'state': false,
      // },
      // {
      //   'governorate': 'Sohag',
      //   'station': [
      //     'Dar Elteb',
      //     'El Ray',
      //   ],
      //   'state': false,
      // },
      // {
      //   'governorate': 'Sharm Elshak',
      //   'station': [
      //     'Watanya-SSH',
      //     'El Ruwaysat',
      //   ],
      //   'state': false,
      // },
      {
        'governorate': 'Hurghada',
        'station': [
          'El Nasr Street',
          'Watanya-HRG ',
          'Al Ahyaa',
        ],
        'state': false,
      },
      {
        'governorate': 'Dahab',
        'station': [
          'Dahab',
        ],
        'state': false,
      },
      {
        'governorate': 'North Cost',
        'station': [
          'Marina 5',
          'Zahran Mall',
        ],
        'state': false,
      },
      {
        'governorate': 'Luxor',
        'station': [
          'Railway station',
          'Armant',
        ],
        'state': false,
      },
      {
        'governorate': 'Qena',
        'station': [
          'Qena',
          'Qift',
        ],
        'state': false,
      },
      {
        'governorate': 'Matrouh',
        'station': [
          'Marsa Matruh',
        ],
        'state': false,
      },
      {
        'governorate': 'Asyout',
        'station': [
          'Elmoalmien',
          'Elhialey',
        ],
        'state': false,
      },
      {
        'governorate': 'Ras Ghareb',
        'station': [
          'Ras Ghareb',
        ],
        'state': false,
      },
      {
        'governorate': 'Sahl Hashesh',
        'station': [
          'Sahl Hashesh',
        ],
        'state': false,
      },
      {
        'governorate': 'oyun Musa',
        'station': [
          'oyun Musa',
        ],
        'state': false,
      },
    ]
  };
  DateTime goDateTime = DateTime.now();
  DateTime returnDateTime = DateTime.now();
  String goDateController = '';
  String returnDateController = '';
  String fromController = '';
  String toController = '';
  bool addReturnDate = false;
  bool test = true;

  navToSearchScreen(
      {required String from,
      required String to,
      required String goDate,
      String returnDate = ''}) {
    if (goDateController == '' || fromController == '' || toController == '') {
      emit(BookNowFailureState('Data is required'));
    } else if (addReturnDate && returnDateController == '') {
      emit(BookNowFailureState('return date is required'));
    } else {
      emit(BookNowSuccessState());
    }
  }

  selectTo(int x, int index) {
    toController =
        '${cities['data'][x]['governorate']} - ${cities['data'][x]['station'][index]}';
    emit(BookNowAddSuccessState());
  }

  selectFrom(int x, int index) {
    fromController =
        '${cities['data'][x]['governorate']} - ${cities['data'][x]['station'][index]}';
    emit(BookNowAddSuccessState());
  }

  setGoDate() {
    goDateController =
        '${goDateTime.year}/${goDateTime.month}/${goDateTime.day}';
    emit(BookNowAddSuccessState());
  }

  setReturnDate() {
    returnDateController =
        '${returnDateTime.year}/${returnDateTime.month}/${returnDateTime.day}';
    // setState(() {}); //todo
    // Navigator.pop(context);
    emit(BookNowAddSuccessState());
  }

  addReturnField() {
    addReturnDate = !addReturnDate;
    returnDateController = '';
    emit(BookNowAddSuccessState());
  }
  changeState(index){
    for(var i = 0;i<cities['data'].length;i++){
      cities['data'][i]['state'] = false;
    }
    cities['data'][index]['state'] = !cities['data'][index]['state'];
    emit(BookNowChangeState());

  }
}
