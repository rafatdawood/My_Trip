part of 'edit_cubit.dart';

@immutable
abstract class EditState {}

class EditInitial extends EditState {}
class EditSuccessState extends EditState {}
class EditFailureState extends EditState {}
class EditAddSuccessState extends EditState {}
class EditAddFailureState extends EditState {}
class EditRemoveSuccessState extends EditState {}
class EditRemoveFailureState extends EditState {}
class EditHaveSeatsSuccessState extends EditState {}
class EditNotCompletedState extends EditState {
  final String massage;

  EditNotCompletedState(this.massage);
}
class EditHaveSeatsFailureState extends EditState {
  final String massage;

  EditHaveSeatsFailureState(this.massage);
}
