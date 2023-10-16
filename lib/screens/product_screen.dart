import 'package:flutter/material.dart';
import 'package:fluttertest/models/product.dart';

import 'package:fluttertest/services/products_service.dart';
import 'package:fluttertest/screens/loading_screen.dart';
import 'package:fluttertest/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);  

    if(productsService.isLoading){
      return const LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Products")  
      ),
      body: ListView.builder(
        itemBuilder:(BuildContext context, index) => GestureDetector(
            child: ProductCard(product: productsService.products[index], 
            ),
            onTap: () => {},
          ),
          itemCount: productsService.products.length,
        ),
    );
  }
}