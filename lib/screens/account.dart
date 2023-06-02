import 'package:ecommerce_app/utitlity/constants.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            flexibleSpace: LayoutBuilder(builder: (context, constraint) {
              return FlexibleSpaceBar(
                title: AnimatedOpacity(
                  opacity: constraint.biggest.height <= 120 ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Text('Account'),
                ),
                background: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [tertiary, primary]))),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: tertiary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            decoration: const BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: const Center(child: Text('Cart')),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade300),
                            child: const Center(
                                child: Text(
                              'Orders',
                              style: TextStyle(color: primary),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            decoration: const BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: const Center(
                                child: Text(
                              'Wishlist',
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
