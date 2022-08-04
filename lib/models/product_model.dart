// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'dart:convert';

List<Product> productFromJson(String str) => 
  List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    final int id;
    final String title;
    final double price;
    final String description;
    final String category;
    final String image;
    final Rating rating;

    Product copyWith({
        int? id,
        String? title,
        double? price,
        String? description,
        String? category,
        String? image,
        Rating? rating,
    }) => 
        Product(
            id: id ?? this.id,
            title: title ?? this.title,
            price: price ?? this.price,
            description: description ?? this.description,
            category: category ?? this.category,
            image: image ?? this.image,
            rating: rating ?? this.rating,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
    };
}




class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final double rate;
    final int count;

    Rating copyWith({
        double? rate,
        int? count,
    }) => 
        Rating(
            rate: rate ?? this.rate,
            count: count ?? this.count,
        );

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
