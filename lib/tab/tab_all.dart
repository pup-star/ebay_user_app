import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/models/all_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/views/details/all_details.dart';

class TabAll extends StatefulWidget {
  const TabAll({super.key});

  @override
  State<TabAll> createState() => _TabAllState();
}

class _TabAllState extends State<TabAll> {
  Future<List<AllModel>> ListAll = getAllApi();
  static Future<List<AllModel>> getAllApi() async {
    var url = Uri.parse("http://localhost:8000/api/item/all");
    final response = await http.get(url);
    final List body = jsonDecode(response.body);
    return body.map((e) => AllModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<AllModel>>(
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
      ),
    );
  }

  Widget buildAll(List<AllModel> posts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => AllDetails(all: post));
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
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/profile/apple_logo2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    post.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(post.dealerName.toString()),
                  trailing: Text(
                    "\$ ${post.price}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
