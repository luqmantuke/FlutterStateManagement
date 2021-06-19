import 'package:flutter/material.dart';
import 'package:statemanagementshopapp/widgets/badge.dart';
import 'package:statemanagementshopapp/widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverview extends StatefulWidget {
  // const ProductOverview({Key? key}) : super(key: key);

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  var showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop"), centerTitle: true, actions: [
        PopupMenuButton(
          onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.Favorite) {
                showOnlyFavorites = true;
              } else {
                showOnlyFavorites = false;
              }
            });
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
                child: Text("Only favorites"), value: FilterOptions.Favorite),
            PopupMenuItem(child: Text("Show All"), value: FilterOptions.All),
          ],
        ),
      ]),
      body: ProductsGrid(showOnlyFavorites),
    );
  }
}
