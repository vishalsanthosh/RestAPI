import 'package:flutter/material.dart';
import 'package:rest_api/productmodel.dart';

class WishListScreen extends StatelessWidget {
final Product product;
WishListScreen({required this.product});

  
  ProductModelApi? dataFromAPI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist"),centerTitle: true,actions: [IconButton(onPressed: (){}, icon: Icon(Icons.shop,color: Colors.grey,))],),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dataFromAPI?.products.length,
        itemBuilder: (context,index){
          return ListTile(
          leading: Image.network(product.thumbnail,height: 60,width: 60,),
          title: Text(product.title,style: TextStyle(fontSize: 12),),
          subtitle: Text("\$${product.price.toString()}"),
          trailing: ElevatedButton(onPressed: (){}, child:Text("ADD TO CART"
            
            
          ) ),
          );
        }),
    );
  }
}