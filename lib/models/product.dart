import 'rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String category;
  final Rating rating;
  bool favorite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
    this.favorite = false,
  });

  factory Product.empty() {
    return Product(
      id: -1,
      title: "Empty",
      price: 0,
      image: "",
      description: "This is default description",
      category: "None",
      rating: Rating(rate: 0, count: 0),
    );
  }
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      rating: Rating.fromMap(map['rating'] ?? {}),
    );
  }
}
