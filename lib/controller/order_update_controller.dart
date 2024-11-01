import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/homepage.dart';

class CartOrderUpdateController extends GetxController {
  final box = GetStorage();

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void orderUpdate() async {
    setLoading = true;

    String userId = box.read("userId");
    print("food id is ${userId}");

    Uri url = Uri.parse('http://localhost:8000/api/order/update/${userId}');

    try {
      var response = await http.put(url);

      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        setLoading = false;
        Get.snackbar(
          "Updated Order",
          "Successfully",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          icon: const Icon(Icons.error_outline),
        );

        Get.offAll(() => HomePage());
      } else {
        Get.snackbar(
          "Failed to Updated Order",
          "Error",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
