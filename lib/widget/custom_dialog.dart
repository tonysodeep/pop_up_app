import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popup_dialog_sample/bloc/pop_up_bloc.dart';
import 'package:popup_dialog_sample/helpers/styles/app_color.dart';
import 'package:popup_dialog_sample/helpers/styles/app_text_style.dart';
import 'package:popup_dialog_sample/helpers/styles/images_path.dart';
import 'package:popup_dialog_sample/widget/pop_up_button.dart';

import '../helpers/styles/strings.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key, required BuildContext context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopUpBloc(),
      child: BlocListener<PopUpBloc, PopUpState>(
        listener: (context, state) {
          if (state is ClosedPopUp) {
            Navigator.pop(context);
          }

          if (state is FinishedPopUp) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/second_page');
          }
        },
        child: Builder(
          builder: (context) => Dialog(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            backgroundColor: Colors.transparent,
            child: buildDialogContentShape(context),
          ),
        ),
      ),
    );
  }

  Widget buildDialogContentShape(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 8),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<PopUpBloc>(context).add(CancelEvent());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'CLOSE',
                  style: TextStyle(color: AppColor.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.close,
                  color: AppColor.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65,
          child: BlocBuilder<PopUpBloc, PopUpState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              }
              return buildDialogContent(context);
            },
          ),
        ),
      ],
    );
  }

  Widget buildDialogContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Image.asset(ImagesPath.popUpdImage),
          ),
          Text(
            Strings.weWantFeedback,
            style: AppTextStyle.kBoldMidnightBue26,
          ),
          SizedBox(
            height: 20,
          ),
          Text(Strings.canWeSend,
              style: AppTextStyle.kNormalBlack20, textAlign: TextAlign.center),
          SizedBox(
            height: 20,
          ),
          PopUpButton(
            isPrimary: true,
            buttonText: Strings.yesPleaseButton,
            onPressed: () {
              BlocProvider.of<PopUpBloc>(context).add(AcceptEvent());
            },
          ),
          SizedBox(
            height: 20,
          ),
          PopUpButton(
            isPrimary: false,
            buttonText: Strings.mayBeNextTimeButton,
            onPressed: () {
              BlocProvider.of<PopUpBloc>(context).add(CancelEvent());
            },
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Provider by ForSee. Privacy Policy',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
