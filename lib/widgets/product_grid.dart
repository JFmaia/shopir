import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_grid_item.dart';

class ProductGrid extends StatelessWidget {
  final bool _showFavorite;
  ProductGrid(this._showFavorite);
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products =
        _showFavorite ? productsProvider.favoriteItems : productsProvider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
