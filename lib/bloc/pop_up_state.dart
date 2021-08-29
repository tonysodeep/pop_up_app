part of 'pop_up_bloc.dart';

@immutable
abstract class PopUpState {}

class PopUpInitial extends PopUpState {}

class ShowPopUp extends PopUpState{}

class ClosedPopUp extends PopUpState{}

class FinishedPopUp extends PopUpState{}

class Loading extends PopUpState{}