import 'package:bionic_tech/app/controllers/page_index_controller.dart';
import 'package:bionic_tech/app/widgets/app_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/card_media.dart';
import '../../../widgets/video_player_item.dart';
import '../controllers/media_controller.dart';

class MediaView extends GetView<MediaController> {
  const MediaView({super.key});
  @override
  Widget build(BuildContext context) {
    final pageIndexCtr = Get.find<PageIndexController>();

    return Scaffold(
      body: const Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 150),
                    VideoPlayerItem(
                      videoId: 'aFZH9MgykEw',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                    CardMediaWidget(
                      title: 'Title 1',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae',
                    ),
                  ],
                ),
              ),
            ),
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
