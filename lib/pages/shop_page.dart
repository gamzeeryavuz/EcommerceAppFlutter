import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/my_drawer.dart';
import 'package:flutter_application_1/components/my_product_tile.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Shop Page"),
          actions: [ 
            IconButton(   
              onPressed: ()=> Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined),
              
            )
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            // shop title
            Center(child: Text("Pick from  a selected list of premium products",
           
            )),
     



            SizedBox(
                height: 550,
                child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return MyProductTile(product: product);
                  },
                ))
          ],
        ));
  }
}
