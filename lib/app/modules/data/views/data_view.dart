import 'package:bionic_tech/app/controllers/page_index_controller.dart';
import 'package:bionic_tech/app/widgets/app_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/data_controller.dart';

class DataView extends GetView<DataController> {
  const DataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageIndexCtr = Get.find<PageIndexController>();

    return Scaffold(
      body: const Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'DataView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          AppBarWidget(),
        ],
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
