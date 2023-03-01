import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scholar_chat/Models/message.dart';
import 'package:scholar_chat/common/show_snack_bar.dart';
import 'package:scholar_chat/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat_buble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  static String id = 'ChatPage Screen';
  TextEditingController txtFieldController = TextEditingController();
  CollectionReference<Map<String, dynamic>> messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('date', descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
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
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return snapshot.data!.docs[index]['id'] == email
                            ? chatBuble(
                                txtMessage: snapshot.data!.docs[index]
                                    ['message'],
                                date: snapshot.data!.docs[index]['date'],
                                userId: snapshot.data!.docs[index]['id'],
                              )
                            : chatBubleForFriends(
                                txtMessage: snapshot.data!.docs[index]
                                    ['message'],
                                date: snapshot.data!.docs[index]['date'],
                                userId: snapshot.data!.docs[index]['id'],
                              );
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
                    keyboardType: TextInputType.text,
                    controller: txtFieldController,
                    onSubmitted: (value) {
                      DateTime now = DateTime.now();
                      String formattedDate =
                          DateFormat('yy/MM/dd-hh:mm:ss').format(now);

                      final message = Message(
                          message: value, date: formattedDate, id: email);
                      messages.add(Message.toFireStore(message));

                      txtFieldController.clear();
                      _controller.animateTo(
                        0,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
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
                      suffixIcon: IconButton(
                          onPressed: () {
                            DateTime now = DateTime.now();
                            String formattedDate =
                                DateFormat('yy/MM/dd-hh:mm:ss').format(now);

                            final message = Message(
                                message: txtFieldController.text,
                                date: formattedDate,
                                id: email);
                            messages.add(Message.toFireStore(message));

                            txtFieldController.clear();
                            _controller.animateTo(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: const Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('There is Error'),
          );
        }
      },
    );
  }
}
