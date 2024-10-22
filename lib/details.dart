import 'package:flutter/material.dart';
import 'package:rest_api/productmodel.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  DetailScreen ({required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  bool _switchvalue=false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: Center(
        child: Column(
          children: [
           Image.network(widget.product.thumbnail),
           SizedBox(height: 5,),
           Text("Name:${widget.product.title}"),
           SizedBox(height: 5,),
           Text("Price: \$ ${widget.product.price.toString()}"),
           SizedBox(height: 15,),
           Text(_switchvalue? "ADDED TO Cart":'ADD TO CART'),
           Switch(value: _switchvalue, onChanged: (bool newValue){
            setState(() {
              _switchvalue=newValue;
            });
           })
          ],
        ),
      ),
    );
  }
}