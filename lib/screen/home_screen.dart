import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/tab/tab_all.dart';
import 'package:shopping/tab/tab_clothes.dart';
import 'package:shopping/tab/tab_hat.dart';
import 'package:shopping/tab/tab_pants.dart';
import 'package:shopping/tab/tab_shoe.dart';
import 'package:shopping/views/count/bag_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                icon: const Badge(
                  label: Text("0"),
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
