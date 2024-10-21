import 'package:flutter/material.dart';
import 'package:rest_api/productmodel.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  DetailScreen ({required this.product});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Column(
          children: [
           Image.network(product.thumbnail),
           SizedBox(height: 5,),
           Text("Name:${product.title}"),
           SizedBox(height: 5,),
           Text("Price: \$ ${product.price.toString()}")
          ],
        ),
      ),
    );
  }
}