import 'package:flutter/material.dart';
import 'package:game_ticket/utils/constants.dart';

class FloatBtnWidget extends StatelessWidget {
  const FloatBtnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(32.0)),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Image.asset('assets/icons/float_ic.png'),
      ),
    );
  }
}
