import 'package:bionic_tech/app/controllers/page_index_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  ContactView({super.key});

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final pageIndexCtr = Get.find<PageIndexController>();

    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: Column(
        children: [
          Material(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black38,
                  ),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: controller.chatsStream(authC.user.value.email!),
              builder: (context, snapshot1) {
                if (snapshot1.connectionState == ConnectionState.active) {
                  var listDocsChat = snapshot1.data!.docs;
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      itemCount: listDocsChat.length,
                      itemBuilder: (context, index) {
                        return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                          stream: controller
                              .friendStream(listDocsChat[index]["connection"]),
                          builder: (context, snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.active) {
                              var friendData = snapshot2.data!.data();
                              return Card(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  onTap: () => Get.toNamed(
                                    Routes.CHAT,
                                    arguments: {
                                      "chat_id": listDocsChat[index].id,
                                      "friendEmail": listDocsChat[index]
                                          ["connection"],
                                    },
                                  ),
                                  title: Text(
                                    "${friendData!["name"]}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${friendData["email"]}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.SEARCH_CONTACT),
        backgroundColor: Colors.deepPurple[300],
        child: const Icon(
          Icons.search,
          size: 30,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.deepPurple[300],
        items: const [
          TabItem(icon: Icons.person, title: 'User'),
          TabItem(icon: Icons.map, title: 'Map'),
          TabItem(icon: Icons.contact_phone_rounded, title: 'Contact'),
          TabItem(icon: Icons.perm_media, title: 'Media'),
          TabItem(icon: Icons.data_saver_off_outlined, title: 'Data'),
        ],
        initialActiveIndex: pageIndexCtr.currentIndex.value,
        onTap: (int i) => pageIndexCtr.changeIndex(i),
      ),
    );
  }
}
