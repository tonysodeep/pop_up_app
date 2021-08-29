import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:popup_dialog_sample/models/pop_up_date.dart';

final _root = 'my-json-server.typicode.com';

class DatePopUpRepository {
  Client client = Client();

  Future<PopUpDate> getDateApi() async {
    final response = await client.get(
      Uri.https(
        _root,
        'tonysodeep/mockJson/popupDays',
      ),
    );
    if(response.statusCode == 200){
      // print(PopUpDate.fromJson(json.decode(response.body)).userPress.toString());
      return PopUpDate.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Data');
    }
  }
}
