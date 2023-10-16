import 'package:flutter/material.dart';
import 'package:fluttertest/models/product.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({ Key ? key, required this.product }):super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          margin: const EdgeInsets.only(top: 40, bottom: 40),
          width: double.infinity,
          height: 300,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _BackgroundImage(product.pic)
            ],
          ),
        )
      );
  }
}

class _BackgroundImage extends StatelessWidget {

  final String? url;
  
  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: url == null ? Image(image: AssetImage('assets/imagenPredeterminada.jpeg')) 
      : FadeInImage(
        placeholder: const AssetImage('assets/imagenPredeterminada.jpeg'),
        image: NetworkImage(url!),
        fit: BoxFit.cover,
        ),
    );
  }
}