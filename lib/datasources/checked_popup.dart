import 'package:popup_dialog_sample/helpers/utils/counter_share_preferences.dart';

class CheckPopup{
  void increaseCounterTime() async {
    var counter = await CounterSharePreferences.getCounter();
    counter++;
    try {
      await CounterSharePreferences.setCounter(counter);
    } catch (e) {
      print(e.toString());
    }
  }
}