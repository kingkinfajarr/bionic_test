import 'package:bionic_tech/app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  ChatView({super.key});

  final authC = Get.find<AuthController>();
  final chatId = (Get.arguments as Map<String, dynamic>)["chat_id"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: const Text('ChatView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.streamChats(chatId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var data = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return itemChat(
                            isSender: data[index]["pengirim"] ==
                                    authC.user.value.email
                                ? true
                                : false,
                            message: '${data[index]["msg"]}',
                            time: '${data[index]["time"]}',
                          );
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textEditingController: controller.messageController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.newChat(
                        authC.user.value.email!,
                        Get.arguments as Map<String, dynamic>,
                        controller.messageController.text,
                      );
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class itemChat extends StatelessWidget {
  final bool isSender;
  final String? message;
  final String? time;
  const itemChat({
    super.key,
    required this.isSender,
    this.message,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(time ?? '');

    // Format DateTime to extract hours and minutes
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: isSender ? Radius.circular(15) : Radius.circular(0),
                bottomRight:
                    isSender ? Radius.circular(0) : Radius.circular(15),
              ),
            ),
            child: Text(
              message ?? '-',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            formattedTime,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
