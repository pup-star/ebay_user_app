import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/controller/order_controller.dart';
import 'package:shopping/models/hats_model.dart';
import 'package:shopping/models/order_request.dart';

class HatDetails extends StatelessWidget {
  const HatDetails({super.key, required this.hats});

  final HatsModel hats;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrdersController());
    final box = GetStorage();

    String? userId = box.read('userId');
    //print(hats.id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Ionicons.chevron_back_circle,
            size: 30,
            color: Colors.grey.shade700,
          ),
        ),
        title: Container(
          child: Text(
            hats.title,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(hats.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset('assets/profile/hm.png'),
                  ),
                  title: Container(
                    child: Text(
                      hats.dealerName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text("Open 09:00 - 16:00"),
                  trailing: Container(
                    child: Text(
                      '${hats.price}  \$',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Container(
                        child: Text(
                          hats.title,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              //print(userId);
              OrderRequest order = OrderRequest(
                userId: userId.toString(),
                imageUser: "",
                nameUser: "",
                address: "",
                imageProduct: hats.imageUrl,
                nameProduct: hats.title.toString(),
                price: hats.price,
                type: hats.type,
                storeName: hats.dealerName,
                dealerImage: "",
                dealerId: hats.dealerId,
                //orderStatus: 'Pending',
              );
              String orderData = orderRequestToJson(order);
              controller.createOrder(orderData, order);
            },
            child: Text(
              "A D D   T O   C A R T",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
