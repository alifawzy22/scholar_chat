import 'package:flutter/material.dart';
import 'package:scholar_chat/common/show_snack_bar.dart';
import 'package:scholar_chat/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  static String id = 'ChatPage Screen';
  TextEditingController txtFieldController = TextEditingController();
  CollectionReference<Map<String, dynamic>> messages =
      FirebaseFirestore.instance.collection(kMessagesFireBaseStoreCollection);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 60,
            ),
            const Text('Chat')
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return chatBuble();
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 16,
              right: 32,
            ),
            child: TextField(
              controller: txtFieldController,
              onSubmitted: (value) {
                messages.add({'message': value}).then((DocumentReference doc) {
                  print('DocumentSnapshot added with ID: ${doc.id}');
                  ShowSnackBar.snackBarFunction(
                    context,
                    text: 'Message added with ID: ${doc.id}',
                    color: Colors.green,
                  );
                });
                txtFieldController.clear();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
