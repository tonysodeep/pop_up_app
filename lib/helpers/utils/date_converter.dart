import 'package:intl/intl.dart';
class DateConvert{
  String convertTodayToString(DateTime dateTime){
    String formattedDate = DateFormat("yyyy-MM-dd hh:mm:ss").format(dateTime);
    return formattedDate;
  }
  DateTime convertStringToDate(String date){
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    return tempDate;
  }
}