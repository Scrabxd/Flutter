
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier{

  final String _baseUrl = 'fluttertest9a-default-rtdb.firebaseio.com';
  final List<Product>  products = [];

  bool isLoading = true;

  ProductsService(){
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async{

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');

    final resp = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(resp.body);

    productMap.forEach((key, value) { 
    final product = Product.fromMap(value);
    this.products.add(product);
    });

    this.isLoading = false;
    notifyListeners();

    print(productMap);

    return products;

    

  }

}