import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/models/shoes_model.dart';
import 'package:shopping/views/details/shoe_details.dart';
import 'package:http/http.dart' as http;

class TabShoe extends StatefulWidget {
  const TabShoe({super.key});

  @override
  State<TabShoe> createState() => _TabShoeState();
}

class _TabShoeState extends State<TabShoe> {
  Future<List<ShoesModel>> ListShoes = getShoesApi();

  static Future<List<ShoesModel>> getShoesApi() async {
    var url = Uri.parse("http://localhost:8000/api/item/getRandom/shoes");
    final response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);
    final List body = jsonDecode(response.body);
    return body.map((e) => ShoesModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ShoesModel>>(
          future: ListShoes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final posts = snapshot.data!;
              return buildShoes(posts);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildShoes(List<ShoesModel> posts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => ShoeDetails(shoes: post));
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
                      'assets/profile/conserse_store.png',
                    ),
                    backgroundColor: Colors.white,
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
