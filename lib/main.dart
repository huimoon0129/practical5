import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_card/Product/Item.dart';

import 'Product/card_dart.dart';
import 'Product/CartProvider.dart';

final List<Item> catalog = [
  Item(1, 'Shoes'),
  Item(2, 'Hats' ),
  Item(3, 'Shirts'),
  Item(4, 'Tie', ),
  Item(5, 'Pants'),
];


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('State Management'),
        actions: [
            IconButton(
              onPressed: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const CartPage()));
              },
              icon: const Icon(Icons.shopping_cart),
            ),
        ],

        ),
      body: Center(
          child: ListView.separated(
              padding: const EdgeInsets.all(8),

              scrollDirection: Axis.vertical,

              shrinkWrap: true,

              itemBuilder: (BuildContext context, int index) {
                return CartItem(index: index);
              },

              separatorBuilder: (BuildContext context, int index) =>

              const Divider(),

              itemCount: catalog.length
          )

      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final int index;
  const CartItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var item = catalog[index];
    return Row(
      children: [

        // Image.asset(
        //   'assets/images/${item.image}',
        //   width: 60,
        //   height: 60,
        //   fit: BoxFit.cover,
        // ),
        Text('$item'),

        const Expanded(child: SizedBox()),

        Consumer<CartProvider>(builder: (context, cart, child) {
          return TextButton(
              onPressed: () {
                cart.add(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$item added to cart.'),
                  ),
                );
              },
              child: const Text('Add'));
        }),
      ],
    );
  }
}
