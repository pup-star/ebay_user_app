import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/views/details/hat_details.dart';

class TabHat extends StatelessWidget {
  const TabHat({super.key});

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   child: GridView.builder(
    //     itemCount: 20,
    //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //       maxCrossAxisExtent: 200,
    //       mainAxisSpacing: 16,
    //       crossAxisSpacing: 16,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       return Image.asset(
    //         "assets/image/straw_hat.jpeg",
    //         fit: BoxFit.cover,
    //       );
    //     },
    //   ),
    // );

    // return SizedBox(
    //   child: GridView.builder(
    //     itemCount: 20,
    //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //       maxCrossAxisExtent: 200,
    //       mainAxisSpacing: 16,
    //       crossAxisSpacing: 16,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       return Card(
    //         elevation: 0.5,
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               height: 140,
    //               child: Image.asset(
    //                 "assets/image/straw_hat.jpeg",
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Container(
    //               padding: const EdgeInsets.all(16.0),
    //               alignment: Alignment.centerLeft,
    //               child: const Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "Levi's ",
    //                     style: TextStyle(fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     " \$ 99",
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.normal,
    //                         fontSize: 14,
    //                         color: Colors.black54),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => const HatDetails());
          },
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset("assets/image/addidas_hat.png"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/profile/addidas_logo.png'),
                  ),
                  title: const Text(
                    "Coca Cola",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: const Text("coke"),
                  trailing: const Text("\$ 100"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
