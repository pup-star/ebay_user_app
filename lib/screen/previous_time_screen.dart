import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PreviousTimeScreen extends StatelessWidget {
  const PreviousTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
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
                            image: AssetImage('assets/image/hoodie.png'),
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
                                  "Hoodie",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "               99 \$",
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
      ),
    );
  }
}
