import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/hot_controller.dart';
import '../custom_widget/custom_widget_hot.dart';

class CustomListviewHot extends StatelessWidget {
  const CustomListviewHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotController>(
        init: HotController(),
        builder: (controller) => ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.isLoadMore
                ? controller.posts.length + 1
                : controller.posts.length,
            itemBuilder: (context, index) {
              if (index >= controller.posts.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return CustomCardHot(index: index);
              }
            }));
  }
}
