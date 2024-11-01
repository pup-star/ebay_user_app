import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/models/pants_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/views/details/pant_details.dart';

class TabPants extends StatefulWidget {
  const TabPants({super.key});

  @override
  State<TabPants> createState() => _TabPantsState();
}

class _TabPantsState extends State<TabPants> {
  Future<List<PantsModel>> ListPants = getPantsApi();

  static Future<List<PantsModel>> getPantsApi() async {
    var url = Uri.parse("http://localhost:8000/api/item/getRandom/pants");
    final response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);
    final List body = jsonDecode(response.body);
    return body.map((e) => PantsModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<PantsModel>>(
          future: ListPants,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final posts = snapshot.data!;
              return buildPants(posts);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildPants(List<PantsModel> posts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => PantDetails(pants: post));
          },
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.network(post.imageUrl),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/profile/logo_levi.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(post.dealerName),
                  trailing: Text("\$ ${post.price}"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
