import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testspatium/controller/new_controller.dart';

import '../custom_widget/custom_widget_new.dart';

class CustomListviewNew extends StatelessWidget {
  const CustomListviewNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewController>(
        init: NewController(),
        builder: (controller) => ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.isLoadMore ? controller.posts.length + 1 : controller.posts.length,
        itemBuilder: (context, index) {
          if(index>=controller.posts.length){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return  CustomCardNew(index: index);
          }
        },));
  }
}
