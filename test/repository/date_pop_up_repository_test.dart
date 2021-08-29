import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:popup_dialog_sample/models/pop_up_date.dart';
import 'package:popup_dialog_sample/repository/date_pop_up_repository.dart';

void main() {
  test('Fetch date pop up from api', () async {
    final popApi = DatePopUpRepository();
    popApi.client = MockClient(
      (request) async {
        final jsonMap = {
          'userPress': 2,
          'userCancel': 3,
        };
        return Response(
          json.encode(jsonMap),
          200,
        );
      },
    );
    final popUpDate = await popApi.getDateApi();
    expect(popUpDate.userCancel, 3);
  });
}
