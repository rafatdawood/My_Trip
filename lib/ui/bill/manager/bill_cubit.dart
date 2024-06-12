import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit() : super(BillInitial());

  Map<String, dynamic> billMap = {
    'data': []
  };

  removeTripState() {
    billMap['data'].removeAt(0);
    emit(BillRemoveState('done'));
  }
  getData(){
    emit(BillSuccessState());
  }
  concatPrise(){
    num price = 0;
    for(var i in billMap['data']){
      price += i['price'];
    }
    return price;
  }
}
