import 'package:flutter/material.dart';
import 'package:statemanagementshopapp/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // // final String description;
  // // final double price;
  // final String imageUrl;

  // ProductItem(
  //     {required this.imageUrl,
  //     required this.title,
  //     required this.id}); // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetail.routeName,
            arguments: product.id,
          );
        },
        child: Image.network(
          product.imageUrl,
        ),
      ),
      footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              product.toggleIsFavorite();
            },
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
            color: Theme.of(context).accentColor,
          )),
    );
  }
}
