import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'package:rest_api/details.dart';
import 'package:rest_api/productmodel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
      appBar: AppBar(title: Text("Products"),),
      body:_isLoading? Center(
     child: CircularProgressIndicator(),
      )
      :dataFromAPI== null
      ? Center(
        child: Text("Failed to load data"),
      )
          :GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
            itemCount: dataFromAPI!.products.length,
             itemBuilder: (context,index){
              final product=dataFromAPI!.products[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailScreen(
                  product:product,)));
              },
              child: Container(
                
                child: Center(
                  child: Column(
                    children: [
                      Image.network(product.thumbnail,width: 100,height: 100,),
                      SizedBox(height: 5,),
                      Text(product.title),
                       SizedBox(height: 5,),
                      Text("\$${product.price.toString()}"),
                    ],
                  ),
                ),
              ),
            );
          })
     
    );
  }
}