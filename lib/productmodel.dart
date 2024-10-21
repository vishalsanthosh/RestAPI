// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductModelApi ProductModelApiFromJson(String str) =>ProductModelApi.fromJson(json.decode(str));


class ProductModelApi {
    List<Product> products;

   ProductModelApi({
        required this.products,
    });

    factory ProductModelApi.fromJson(Map<String, dynamic> json) => ProductModelApi(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

   
}

class Product {
    int id;
    String title;
   
    double price;
  
    String thumbnail;

    Product({
        required this.id,
        required this.title,
       
        required this.price,
       
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        
        price: json["price"]?.toDouble(),
       
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      
        "price": price,
        
        "thumbnail": thumbnail,
    };
}

