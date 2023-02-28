import 'package:flutter/material.dart';

import '../constant.dart';

class chatBuble extends StatelessWidget {
  const chatBuble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            )),
        child: Text(
          'hello I\'m a new user what about you',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
