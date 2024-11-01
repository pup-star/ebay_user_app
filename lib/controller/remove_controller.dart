import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void removeFrom(String orderId) async {
    setLoading = true;

    String accessToken = box.read("token");
    final userId = box.read("userId");

    var url = Uri.parse(
        "http://localhost:8000/api/order/remove/${userId}/${orderId}");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.delete(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        setLoading = false;

        Get.snackbar(
            "Product removed successfully", "Enjoy your awesome experience",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ));
        //Get.offAll(() => ());
      } else {
        Get.snackbar("Error", "",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(
              Icons.error_outline,
              color: Colors.white,
            ));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }
}
