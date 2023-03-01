// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constant.dart';

class chatBuble extends StatelessWidget {
  final String txtMessage;
  final String date;
  final String userId;

  const chatBuble({
    required this.txtMessage,
    required this.date,
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                )),
            child: Text(
              txtMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Text(
              date,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class chatBubleForFriends extends StatelessWidget {
  final String txtMessage;
  final String date;
  final String userId;
  const chatBubleForFriends({
    Key? key,
    required this.txtMessage,
    required this.date,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            decoration: const BoxDecoration(
                color: kBubleChatFriends,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                )),
            child: Text(
              txtMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Text(
              date,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
