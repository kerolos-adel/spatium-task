import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewController extends GetxController {
  List posts = [];
  var after;
  int limit = 10;
  bool isLoadMore = false;
  ScrollController scrollController = ScrollController();

  getNew() async {
    var url =
    Uri.parse("https://oauth.reddit.com/r/FlutterDev/new/?limit=$limit&after=$after");
    var response = await http.get(url, headers: {
      "Authorization":
      "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IlNIQTI1NjpzS3dsMnlsV0VtMjVmcXhwTU40cWY4MXE2OWFFdWFyMnpLMUdhVGxjdWNZIiwidHlwIjoiSldUIn0.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNzA2NTIyNjMzLjQ0OTYxOSwiaWF0IjoxNzA2NDM2MjMzLjQ0OTYxOSwianRpIjoieFVpc2RXcHlTaDEzb0J6cFg2NlV5bFVOblUzamZRIiwiY2lkIjoidjZvNVc5dVdWWTVhMWpIRTRDb3FaZyIsImxpZCI6InQyX3NtZG1zOGs2byIsImFpZCI6InQyX3NtZG1zOGs2byIsImxjYSI6MTcwNTk0ODU1NTExMSwic2NwIjoiZUp5S1Z0SlNpZ1VFQUFEX193TnpBU2MiLCJmbG8iOjl9.QCVJTDW6G1w_3t724tUaCDWvyAeDw9V2DIvBNdjc7BqRgPTQz1EEwZBIx8T81gRoWqK_mftigbptvJfCfC0RW4rx85WYx5GAwAmjWPstYIS6wwTNESKB0Is0t5L6h6E3q0krtZgKUqz5b2SWnKa7SUnQr6ZdHufnEsm7WLim5NN2Lk46DTPaR6vtjKfEz_D989M14EuRXX1eQPWnZcRGvm7K9JfTsECJjoIeY3hnjpXwe68P8tUAdMWXUsGwB88jdVRbf6db6jTRq-K0MLzmhplCTMCEgOJNi9DmhfDKfMrNrdb2GJWz-xVutMy-6BmaKd61IBjctqGO6CfaapDQqg"
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body)["data"]["children"];
      after=jsonDecode(response.body)["data"]["after"];

      print(json);

      posts.addAll(json);
      update();
    } else {
      throw Exception('Failed to fetch repos');
    }
  }

  Future<void> urlLaunch(int i) async {
    Uri url = Uri.parse("${posts[i]['data']["url"]}");
    print(url);
    print("+++++++++++++++++++++++");
    try{
      if (await canLaunchUrl(url)) {
        await canLaunchUrl(url);
      }
      else {
        throw 'Could not launch maps';
      }
    }catch(ex){
      print(ex);
    }

    update();
  }

  @override
  void onInit() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        isLoadMore = true;
        update();
        after;
        await getNew();
        isLoadMore = false;
        update();
      }
    });
    getNew();
    super.onInit();
  }
}
