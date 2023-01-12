import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'kpop_model.dart';

class Home extends StatelessWidget {
  Controller controller = Get.put(Controller());

  @override
  void dependencies() {
    Get.lazyPut<Controller>(
      () => Controller(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: Obx(() => controller.isDataLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller._kpopModel!.members!.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(
                      controller._kpopModel!.members![index].name!,
                    ),
                    subtitle: Text(
                        controller._kpopModel!.members![index].birthPlace!),
                  );
                },
              )),
      ),
    );
  }
}

class Controller extends GetxController {
  KpopModel? _kpopModel;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(Uri.parse(
          "https://rizalkalam-my-id.preview-domain.com/api/member/index"));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        _kpopModel = KpopModel.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
