import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/models/hats_model.dart';
import 'package:shopping/views/details/hat_details.dart';
import 'package:http/http.dart' as http;

class TabHat extends StatefulWidget {
  const TabHat({super.key});

  @override
  State<TabHat> createState() => _TabHatState();
}

class _TabHatState extends State<TabHat> {
  Future<List<HatsModel>> ListHats = getHatsApi();

  static Future<List<HatsModel>> getHatsApi() async {
    var url = Uri.parse("http://localhost:8000/api/item/getRandom/hats");
    final response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);
    final List body = jsonDecode(response.body);
    return body.map((e) => HatsModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<HatsModel>>(
          future: ListHats,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final posts = snapshot.data!;
              return buildHats(posts);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildHats(List<HatsModel> posts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => HatDetails(hats: post));
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
                    child: Image.asset('assets/profile/addidas_logo.png'),
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
