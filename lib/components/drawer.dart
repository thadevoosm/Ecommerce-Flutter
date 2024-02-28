import 'package:flutter/material.dart';
import 'package:min/components/list_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyListTile(
                  icon: Icons.home,
                  text: 'Shop',
                  onTap: () => Navigator.pop(context)),
              MyListTile(
                  icon: Icons.shopping_cart_rounded,
                  text: 'Cart',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MyListTile(
                icon: Icons.logout,
                text: 'Quit',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (route) => false)),
          ),
        ],
      ),
    );
  }
}
