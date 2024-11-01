import 'dart:convert';

List<PreviousModel> previousModelFromJson(String str) =>
    List<PreviousModel>.from(
        json.decode(str).map((x) => PreviousModel.fromJson(x)));

String previousModelToJson(List<PreviousModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreviousModel {
  final String id;
  final String userId;
  final String imageUser;
  final String nameUser;
  final String address;
  final String imageProduct;
  final String nameProduct;
  final int price;
  final String type;
  final String orderStatus;
  final String storeName;
  final String dealerImage;
  final String dealerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  PreviousModel({
    required this.id,
    required this.userId,
    required this.imageUser,
    required this.nameUser,
    required this.address,
    required this.imageProduct,
    required this.nameProduct,
    required this.price,
    required this.type,
    required this.orderStatus,
    required this.storeName,
    required this.dealerImage,
    required this.dealerId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory PreviousModel.fromJson(Map<String, dynamic> json) => PreviousModel(
        id: json["_id"],
        userId: json["userId"],
        imageUser: json["imageUser"],
        nameUser: json["nameUser"],
        address: json["address"],
        imageProduct: json["imageProduct"],
        nameProduct: json["nameProduct"],
        price: json["price"],
        type: json["type"],
        orderStatus: json["orderStatus"],
        storeName: json["storeName"],
        dealerImage: json["dealerImage"],
        dealerId: json["dealerId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "imageUser": imageUser,
        "nameUser": nameUser,
        "address": address,
        "imageProduct": imageProduct,
        "nameProduct": nameProduct,
        "price": price,
        "type": type,
        "orderStatus": orderStatus,
        "storeName": storeName,
        "dealerImage": dealerImage,
        "dealerId": dealerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
