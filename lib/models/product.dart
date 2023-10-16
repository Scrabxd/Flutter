import 'package:meta/meta.dart';
import 'dart:convert';

// class Product {
//     Map<String, Product> products;

//     Product({
//         required this.products,
//     });

//     factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         products: Map.from(json["products"]).map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v))),
//     );

//     Map<String, dynamic> toJson() => {
//         "products": Map.from(products).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//     };
// }

class Product {
    bool available;
    String? description;
    String name;
    String ? pic;
    double price;

    Product({
        required this.available,
        this.description,
        required this.name,
        this.pic,
        required this.price,
    });

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toRawJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        description: json["description"],
        name: json["name"],
        pic: json["pic"],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "description": description,
        "name": name,
        "pic": pic,
        "price": price,
    };
}
