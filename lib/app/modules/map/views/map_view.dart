import 'package:bionic_tech/app/controllers/page_index_controller.dart';
import 'package:bionic_tech/app/widgets/app_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/card_indicator.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndexCtr = Get.find<PageIndexController>();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Lottie.asset(
                        "assets/lottie/login.json",
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Literature',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'loreum ipsum dolar sir amet lorem ipsum dolar lorem ipsum dolar sir amet',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardIndicatorWidget(
                          value: '12',
                          desc: 'Books',
                        ),
                        SizedBox(width: 22),
                        CardIndicatorWidget(
                          value: '12',
                          desc: 'Books',
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 40,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple,
                      ),
                      child: const Text(
                        'LOREM',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const AppBarWidget(),
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
