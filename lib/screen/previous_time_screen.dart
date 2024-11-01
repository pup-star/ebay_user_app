import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/models/previous_response_model.dart';
import 'package:shopping/views/login/login_page.dart';
import 'package:http/http.dart' as http;

class PreviousTimeScreen extends StatefulWidget {
  const PreviousTimeScreen({super.key});

  @override
  State<PreviousTimeScreen> createState() => _PreviousTimeScreenState();
}

class _PreviousTimeScreenState extends State<PreviousTimeScreen> {
  Future<List<PreviousModel>> ListAll = getAllApi();
  static Future<List<PreviousModel>> getAllApi() async {
    final box = GetStorage();
    String? userId = box.read('userId');
    var url = Uri.parse(
        "http://localhost:8000/api/order/userId/${userId}?orderStatus=Preparing");
    final response = await http.get(url);
    final List body = jsonDecode(response.body);
    return body.map((e) => PreviousModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String? token = box.read('token');
    if (token == null) {
      return LoginPage();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              child: Text(
                "Previous Time  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              Ionicons.pricetags_sharp,
              size: 20,
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<PreviousModel>>(
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
      // body: ListView.builder(
      //   itemCount: 20,
      //   itemBuilder: (BuildContext context, int index) {
      //     return SizedBox(
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 8, top: 10),
      //         child: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   height: 150,
      //                   width: 200,
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       image: AssetImage('assets/image/hoodie.png'),
      //                       fit: BoxFit.contain,
      //                     ),
      //                     borderRadius: BorderRadius.circular(12),
      //                   ),
      //                 ),
      //                 Column(
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Container(
      //                           child: Text(
      //                             "Hoodie",
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 18,
      //                             ),
      //                           ),
      //                         ),
      //                         Container(
      //                           child: Text(
      //                             "               99 \$",
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 14,
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: 20,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           child: CircleAvatar(
      //                             child: Image.asset('assets/profile/hm.png'),
      //                           ),
      //                         ),
      //                         Container(
      //                           child: Text(
      //                             "   H&M SHOP",
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }

  Widget buildAll(List<PreviousModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        var post = posts[index];
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(post.imageProduct),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                post.nameProduct,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "               ${post.price} \$",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                child: Image.asset('assets/profile/hm.png'),
                              ),
                            ),
                            Container(
                              child: Text(
                                "   H&M SHOP",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
