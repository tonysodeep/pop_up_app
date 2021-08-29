import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popup_dialog_sample/bloc/pop_up_bloc.dart';
import 'package:popup_dialog_sample/helpers/styles/styling.dart';
import 'package:popup_dialog_sample/pages/home_page.dart';
import 'package:popup_dialog_sample/pages/second_page.dart';
import 'package:popup_dialog_sample/helpers/utils/counter_share_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CounterSharePreferences.init();
  runApp(
    MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        '/': (context) {
          return BlocProvider(
            create: (context) {
              return PopUpBloc();
            },
            child: Builder(
              builder: (context) {
                BlocProvider.of<PopUpBloc>(context).add(CheckingEvent());
                return HomePage();
              },
            ),
          );
        },
        '/second_page': (context){
          return SecondPage();
        }
      },
    ),
  );
}


