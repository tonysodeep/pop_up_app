import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popup_dialog_sample/bloc/pop_up_bloc.dart';
import 'package:popup_dialog_sample/widget/custom_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PopUpBloc, PopUpState>(
      listener: (context, state) {
        if (state is ShowPopUp) {
          showDialog(
            context: context,
            builder: (context) => CustomDialog(context: context,),
            barrierDismissible: false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Container(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(
                      context: context,
                      key: null,
                    );
                  },
                );
              },
              child: Text('click me'),
            ),
          ),
        ),
      ),
    );
  }
}
