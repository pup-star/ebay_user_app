import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping/tab/tab_all.dart';
import 'package:shopping/tab/tab_clothes.dart';
import 'package:shopping/tab/tab_hat.dart';
import 'package:shopping/tab/tab_pants.dart';
import 'package:shopping/tab/tab_shoe.dart';
import 'package:shopping/views/count/bag_page.dart';
import 'package:shopping/views/login/login_page.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var status;
  var sum;
  final box = GetStorage();

  GetCount() async {
    // String? accessToken = box.read("token");

    // Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $accessToken'
    // };

    //setLoading = true;

    String userId = box.read("userId");
    print("user id is ${userId}");

    var url = Uri.parse('http://localhost:8000/api/order/count/${userId}');
    http.Response response = await http.get(url);

    //print("count token is $accessToken");

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);

      setState(() {
        this.status = results['status'];
        this.sum = results['count'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    GetCount();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String? token = box.read('token');
    if (token == null) {
      return LoginPage();
    }

    if (sum == null) {
      sum = 0;
    }
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                child: Image.asset('assets/profile/profile.avif'),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: SizedBox(
              height: 30,
              width: 90,
              child: Image.asset(
                'assets/image/ebay.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const BagPage());
                },
                icon: Badge(
                  label: Text("${sum}"),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.black54,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
          bottom: ButtonsTabBar(
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 18),
            radius: 12,
            tabs: [
              Tab(
                child: Text(
                  "All",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Clothes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Shoes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Pants",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Hats",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: TabAll(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: TabClothes(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TabShoe(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TabPants(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TabHat(),
            ),
          ],
        ),
      ),
    );
  }
}
