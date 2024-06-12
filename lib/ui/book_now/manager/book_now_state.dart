part of 'book_now_cubit.dart';

@immutable
abstract class BookNowState {}

class BookNowInitial extends BookNowState {}
class BookNowSuccessState extends BookNowState {

}
class BookNowFailureState extends BookNowState {
  final String errorMessage;

  BookNowFailureState(this.errorMessage);
}
class BookNowAddSuccessState extends BookNowState {}
class BookNowAddFailureState extends BookNowState {}
class BookNowChangeState extends BookNowState {}
