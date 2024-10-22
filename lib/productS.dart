import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart'as http;

import 'package:rest_api/details.dart';
import 'package:rest_api/productmodel.dart';
import 'package:rest_api/wishlist.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Box box;
  bool _isLoading=true;
  @override
void initState(){
  super.initState();
  _getData();
}
ProductModelApi? dataFromAPI;
_getData()async{
  try{
    String url ="https://dummyjson.com/products";
    http.Response res= await http.get(Uri.parse(url));
    if(res.statusCode==200){
      dataFromAPI = ProductModelApi.fromJson(json.decode(res.body));
      _isLoading = false;
      setState(() {
        
      });
    }
  } catch (e){
    debugPrint (e.toString());
  }
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"),backgroundColor: const Color.fromARGB(255, 51, 142, 216),centerTitle: true,actions: [IconButton(onPressed: (){
        
      }, icon: Icon(Icons.favorite,color: Colors.red,))],),
      body:
      
      _isLoading? Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
             child: CircularProgressIndicator(),
        ),
      )
      :dataFromAPI== null
      ? Center(
        child: Text("Failed to load data"),
      )
          :GridView.builder(
            
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 5,mainAxisSpacing: 5),
            itemCount: dataFromAPI!.products.length,
             itemBuilder: (context,index){
              final product=dataFromAPI!.products[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailScreen(
                  product:product,)));
              },
              child: Container(
              
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.black)),
                
                child: Center(
                  child: Column(
                    children: [
                      Image.network(product.thumbnail,width: double.infinity,height: 66,),
                    
                      Text(product.title),

                       
                      Text("\$${product.price.toString()}"),
                      
                     Row(children: [
                      SizedBox(width: 120,),
                      IconButton(onPressed: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context)=> WishListScreen(product: product)));
                      }, icon: Icon(Icons.favorite,size: 20,))
                     ],)
                    ],
                  ),
                ),
              ),
            );
          })
     
    );
  }
}