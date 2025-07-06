import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_card/Product/Product.dart';

import 'Product/CartPage.dart';
import 'Product/CartProvider.dart';

final List<Product> catalog = [
  Product(1, 'Shoes', 30.00, 'shoes.jpg'),
  Product(2, 'Hats', 20.00, 'hats.jpg' ),
  Product(3, 'Shirts', 50.00, 'shirts.jpg'),
  Product(4, 'Tie', 45.00, 'tie.jpg'),
  Product(5, 'Pants', 56.00, 'pants.jpg'),
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

        Image.asset(
          'assets/images/${item.image}',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),

        const Expanded(child: SizedBox()),

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
