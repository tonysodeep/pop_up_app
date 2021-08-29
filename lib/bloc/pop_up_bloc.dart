import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:popup_dialog_sample/repository/date_pop_up_repository.dart';
import 'package:popup_dialog_sample/helpers/utils/counter_share_preferences.dart';
import 'package:popup_dialog_sample/helpers/utils/date_converter.dart';

part 'pop_up_event.dart';

part 'pop_up_state.dart';

class PopUpBloc extends Bloc<PopUpEvent, PopUpState> {
  PopUpBloc() : super(PopUpInitial());
  DatePopUpRepository datePopUpRepository = DatePopUpRepository();

  @override
  Stream<PopUpState> mapEventToState(
    PopUpEvent event,
  ) async* {
    switch (event.runtimeType) {
      case CheckingEvent:
        var isPopup =
            await showPopUp(DateConvert().convertTodayToString(DateTime.now()));
        if (isPopup) {
          yield ShowPopUp();
        }
        break;
      case AcceptEvent:
        yield Loading();
        var data = await datePopUpRepository.getDateApi();
        CounterSharePreferences.setDateOpenPopUp(data.userPress);
        yield FinishedPopUp();
        break;
      case CancelEvent:
        yield Loading();
        var data = await datePopUpRepository.getDateApi();
        CounterSharePreferences.setDateOpenPopUp(data.userCancel);
        yield ClosedPopUp();
    }
  }

  Future<bool> checkCounterTime() async {
    var counter = await CounterSharePreferences.getCounter();
    print('my counter is $counter');
    if (counter == 10) {
      counter++;
      return true;
    } else {
      counter++;
      try {
        await CounterSharePreferences.setCounter(counter);
      } catch (e) {
        print(e.toString());
      }
      return false;
    }
  }

  Future<bool> showPopUp(String date) async {
    var popUpDate = await CounterSharePreferences.getDatePopUp();
    var checkCounter = await checkCounterTime();
    var openedDate = await CounterSharePreferences.getDateOpenPopUp();

    if (popUpDate == null && checkCounter) {
      await CounterSharePreferences.setDatePopUp(date);
      return true;
    }
    if (openedDate != null) {
      print('Day show popUP $openedDate');
      if (compareTwoDate(DateConvert().convertStringToDate(popUpDate!)) ==
          openedDate) {
        return true;
      }
    }
    return false;
  }

  int compareTwoDate(DateTime dateTime) {
    final today = DateTime.now();
    print('date show last pop up $dateTime');
    final difference = today.difference(dateTime).inDays;
    print('calculate date bettween $difference');
    return difference;
  }
}
