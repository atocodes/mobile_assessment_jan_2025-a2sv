import "package:flutter/material.dart";
import "package:mobile_assessment_jan_2025/models/product.dart";
import "package:provider/provider.dart";

import "../providers/cart_provider.dart";

class FavoritesScreen extends StatelessWidget {
  static String route = "/favorites";

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> favorites = Provider.of<CartProvider>(context).favorites;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(favorites[index].image),
            title: Text(favorites[index].title),
            subtitle: Text("\$${favorites[index].price.toString()}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
