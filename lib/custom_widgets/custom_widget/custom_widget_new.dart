import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testspatium/controller/new_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardNew extends StatelessWidget {
  CustomCardNew({Key? key, required this.index}) : super(key: key);
  int index = 0;

  @override
  Widget build(BuildContext context) {

    NewController controller = Get.put(NewController());
    return InkWell(
      onTap: () async{
        final url = "${controller.posts[index]['data']["url"]}";
        if(await canLaunch(url)){
          await launch(url);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Card(
          shape: const Border(top: BorderSide(color: Colors.amber)),
          elevation: 15,
          child: ListTile(
            leading:Text("${controller.posts[index]['kind']}",maxLines: 3,overflow: TextOverflow.ellipsis,),
            title: Text("${controller.posts[index]['data']["title"]}",maxLines: 3,overflow: TextOverflow.ellipsis,),
          ),
        ),
      ),
    );
  }
}
