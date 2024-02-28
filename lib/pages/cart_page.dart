import 'package:flutter/material.dart';
import 'package:min/components/button.dart';
import 'package:min/model/product.dart';
import 'package:min/model/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: const Text(
                "Remove this from your cart?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              actions: [
                MaterialButton(
                  color: Colors.red[300],
                  elevation: 0,
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  void payButtonPress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Text("Connect with payment backend"),
      ),
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
        title: Text('Cart page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Cart is empty"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.remove),
                        ),
                      );
                    }),
          ),
          MyButton(
            onTap: () => payButtonPress(context),
            child: Text("Pay Now"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  }
}
