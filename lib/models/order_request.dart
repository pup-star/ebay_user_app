import 'dart:convert';

OrderRequest orderRequestFromJson(String str) =>
    OrderRequest.fromJson(json.decode(str));

String orderRequestToJson(OrderRequest data) => json.encode(data.toJson());

class OrderRequest {
  final String userId;
  final String imageUser;
  final String nameUser;
  final String address;
  final String imageProduct;
  final String nameProduct;
  final int price;
  final String type;
  //final String orderStatus;
  final String storeName;
  final String dealerImage;
  final String dealerId;

  OrderRequest({
    required this.userId,
    required this.imageUser,
    required this.nameUser,
    required this.address,
    required this.imageProduct,
    required this.nameProduct,
    required this.price,
    required this.type,
    //required this.orderStatus,
    required this.storeName,
    required this.dealerImage,
    required this.dealerId,
  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) => OrderRequest(
        userId: json["userId"],
        imageUser: json["imageUser"],
        nameUser: json["nameUser"],
        address: json["address"],
        imageProduct: json["imageProduct"],
        nameProduct: json["nameProduct"],
        price: json["price"],
        type: json["type"],
        //orderStatus: json["orderStatus"],
        storeName: json["storeName"],
        dealerImage: json["dealerImage"],
        dealerId: json["dealerId"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "imageUser": imageUser,
        "nameUser": nameUser,
        "address": address,
        "imageProduct": imageProduct,
        "nameProduct": nameProduct,
        "price": price,
        "type": type,
        //"orderStatus": orderStatus,
        "storeName": storeName,
        "dealerImage": dealerImage,
        "dealerId": dealerId,
      };
}
