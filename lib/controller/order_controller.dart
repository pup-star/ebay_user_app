import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/homepage.dart';
import 'package:shopping/models/order_request.dart';

class OrdersController extends GetxController {
  final box = GetStorage();

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  RxString _paymentUrl = ''.obs;

  String get paymentUrl => _paymentUrl.value;

  set setPaymentUrl(String newState) {
    _paymentUrl.value = newState;
  }

  String orderId = '';
  String get getOrderId => orderId;

  set setOrderId(String newState) {
    orderId = newState;
  }

  OrderRequest? order;

  RxBool _iconChanger = false.obs;

  bool get iconChanger => _iconChanger.value;

  set setIcon(bool newValue) {
    _iconChanger.value = newValue;
  }

  void createOrder(String data, OrderRequest item) async {
    final box = GetStorage();
    String accessToken = box.read("token");

    Uri url = Uri.parse('http://localhost:8000/api/order/post');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: data);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        // ignore: unused_local_variable
        //OrderResponse data = orderResponseFromJson(response.body);
        var data = jsonDecode(response.body);

        Get.snackbar("Successfully", "Add to Order successfully",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            icon: const Icon(Icons.error_outline));

        Get.offAll(() => HomePage());
      } else {
        Get.snackbar("Error", "Can not post");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void paymentFunction(String payment) async {
    setLoading = true;

    var url = Uri.parse('');

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: payment,
      );

      if (response.statusCode == 200) {
        var urlData = jsonDecode(response.body);

        setPaymentUrl = urlData('url');

        setLoading = false;
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }
}
