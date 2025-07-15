import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_card/Product/Item.dart';
import 'CartProvider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [CartListWidget()],
      ),
    );
  }
}

class CartListWidget extends StatefulWidget {
  const CartListWidget({super.key});

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return cart.itemList.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CartItem(index: index, item: cart.itemList[index]);
                },
                itemCount: cart.itemList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              )
            : const Center(child: Text('Cart is empty.'));
      },
    );
  }
}

class CartItem extends StatelessWidget {
  final int index;
  final Item item;

  const CartItem({super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/${item.itemImage}',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        Text('$item'),
        const Expanded(child: SizedBox()),
        TextButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).remove(item);
          },
          child: const Text('Remove'),
        ),
      ],
    );
  }
}
