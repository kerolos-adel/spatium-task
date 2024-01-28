import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testspatium/custom_widgets/custom_widget/custom_widget_rising.dart';

import '../../controller/hot_controller.dart';
import '../../controller/rising_controller.dart';

class CustomListviewRising extends StatelessWidget {
  const CustomListviewRising({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RisingController>(
      init: RisingController(),
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
              return CustomCardRising(index: index);
            }
          }),
    );
  }
}
