import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/controller/order_update_controller.dart';
import 'package:shopping/controller/remove_controller.dart';
import 'package:shopping/models/bag_response_model.dart';
import 'package:http/http.dart' as http;

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  Future<List<BagResponseModel>> ListAll = getAllApi();
  static Future<List<BagResponseModel>> getAllApi() async {
    final box = GetStorage();
    String? userId = box.read('userId');
    var url = Uri.parse(
        "http://localhost:8000/api/order/userId/$userId?orderStatus=Pending");
    final response = await http.get(url);
    final List body = jsonDecode(response.body);
    return body.map((e) => BagResponseModel.fromJson(e)).toList();
  }

  var status;
  var sum;
  final box = GetStorage();

  getDatatt() async {
    // String? accessToken = box.read("token");

    // Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $accessToken'
    // };

    //setLoading = true;

    String userId = box.read("userId");
    print("user id is ${userId}");

    var url = Uri.parse('http://localhost:8000/api/order/total/${userId}');
    http.Response response = await http.get(url);

    //print("count token is $accessToken");

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);

      setState(() {
        this.status = results['status'];
        this.sum = results['sum'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDatatt();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartOrderUpdateController());

    if (sum == null) {
      sum = 0;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Ionicons.chevron_back_circle,
            size: 30,
            color: Colors.grey.shade600,
          ),
        ),
        title: const Text(
          "My Bag",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<BagResponseModel>>(
        future: ListAll,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return buildAll(posts);
          } else {
            return const Text("No data available");
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () {
              controller.orderUpdate();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(13.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '    Price  =  ${sum}  \$',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // pay now
                  Container(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      children: [
                        const Text(
                          'Pay Now',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAll(List<BagResponseModel> posts) {
    final controllers = Get.put(CartController());
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return ListTile(
          leading: Image.network(post.imageProduct.toString()),
          title: Text(post.nameProduct.toString()),
          trailing: IconButton(
              onPressed: () {
                controllers.removeFrom(
                  post.id,
                );
              },
              icon: Icon(Icons.delete)),
          subtitle: Text(post.price.toString()),
        );
      },
    );
  }
}
