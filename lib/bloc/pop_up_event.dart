part of 'pop_up_bloc.dart';

@immutable
abstract class PopUpEvent {}

class CheckingEvent extends PopUpEvent{}

class AcceptEvent extends PopUpEvent{}

class CancelEvent extends PopUpEvent{}
