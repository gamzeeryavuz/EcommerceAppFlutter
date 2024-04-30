import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove this item  from  your cart  ? "),
              actions: [
                // cancel button
                MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel")),

                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);

                    // add to cart
                    context.read<Shop>().addToCart(product);
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }
  void payButtonPressed(BuildContext context){
    showDialog(context: context,
     builder:  (context)=> AlertDialog(
      content: 
      Text("User wants to pay ! Connect this app to your payment backend"),
      
     )
     );

  }


  @override
  Widget build(BuildContext context) { 
    final cart = context.watch<Shop>().cart;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Cart Page"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            // cart list
            Expanded(
              child: cart.isEmpty 
              ? const Center(
                child: Text("Your cart is empty")) 
              :ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
              // get indivual item in cart
              

              final item = cart[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => removeItemFromCart(context, item),
                ),
              );
            })) ,

           Padding(
             padding: const EdgeInsets.all(50.0),
             child: MyButton(onTap: ()=>payButtonPressed, 
             
             child: Text("Pay Now "),
             
             ),
           )
          ],
        ));
  }
}
