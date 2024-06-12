part of 'bill_cubit.dart';

@immutable
abstract class BillState {}

class BillInitial extends BillState {}
class BillSuccessState extends BillState {}
class BillFailureState extends BillState {}
class BillRemoveState extends BillState {
  final String massage;

  BillRemoveState(this.massage);
}
