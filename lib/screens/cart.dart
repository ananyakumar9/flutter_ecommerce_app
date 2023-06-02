import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_store.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    var globalStore = Provider.of<GlobalStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Your shopping bag is empty',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
              ),
            ),
            onPressed: () {
              globalStore.setPageIndex(index: 0);
            },
            child: const Text('Start shopping'),
          ),
        ],
      ),
      bottomSheet:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Total',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '₹${globalStore.cartAmount.value.toString()}',
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              ElevatedButton(onPressed: () {}, child: const Text('Checkout')),
        )
      ]),
    );
  }
}
