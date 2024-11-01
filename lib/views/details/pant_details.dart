import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopping/controller/order_controller.dart';
import 'package:shopping/models/order_request.dart';
import 'package:shopping/models/pants_model.dart';

class PantDetails extends StatelessWidget {
  const PantDetails({super.key, required this.pants});

  final PantsModel pants;

  @override
  Widget build(BuildContext context) {
    //print(pants.id);

    final controller = Get.put(OrdersController());
    final box = GetStorage();

    String? userId = box.read('userId');
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
            pants.title,
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
                      image: NetworkImage(pants.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/profile/hm.png',
                    ),
                  ),
                  title: Container(
                    child: Text(
                      pants.dealerName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text("Open 09:00 - 16:00"),
                  trailing: Container(
                    child: Text(
                      '${pants.price}  \$',
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
                          pants.title,
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
              OrderRequest order = OrderRequest(
                userId: userId.toString(),
                imageUser: "",
                nameUser: "",
                address: "",
                imageProduct: pants.imageUrl,
                nameProduct: pants.title.toString(),
                price: pants.price,
                type: pants.type,
                storeName: pants.dealerName,
                dealerImage: "",
                dealerId: pants.dealerId,
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
