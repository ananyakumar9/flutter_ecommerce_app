import 'package:ecommerce_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customer_screens/index.dart';
import '../global_store.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    var globalStore = Provider.of<GlobalStore>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          SizedBox(
            height: 230,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [tertiary, primary])),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
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
                            gradient:
                                LinearGradient(colors: [tertiary, primary])),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Center(
                            child: ListTile(
                              leading: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('images/inapp/guest.jpg'),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Name'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
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
                              child: InkWell(
                                onTap: () {
                                  globalStore.setPageIndex(index: 3);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  decoration: const BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30))),
                                  child: const Center(child: Text('Cart')),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomerOrders()));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300),
                                  child: const Center(
                                      child: Text(
                                    'Orders',
                                    style: TextStyle(color: primary),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Wishlist()));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 140,
                      child: Image(image: AssetImage('images/inapp/logo.jpg')),
                    ),
                    subsectionTitle(title: 'Account Information'),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: tertiary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            const ListTile(
                                leading: Icon(Icons.email),
                                title: Text('Email Address'),
                                subtitle: Text('example@email.com')),
                            primaryDivider(context),
                            const ListTile(
                                leading: Icon(Icons.phone),
                                title: Text('Phone No.'),
                                subtitle: Text('+91 7758992963')),
                            primaryDivider(context),
                            const ListTile(
                                leading: Icon(Icons.location_pin),
                                title: Text('Address'),
                                subtitle: Text('Mohammadwadi, Pune')),
                          ],
                        ),
                      ),
                    ),
                    subsectionTitle(title: 'Account Setting'),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: tertiary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit Profile'),
                              ),
                            ),
                            primaryDivider(context),
                            GestureDetector(
                              onTap: () {},
                              child: const ListTile(
                                leading: Icon(Icons.lock),
                                title: Text('Change Password'),
                              ),
                            ),
                            primaryDivider(context),
                            GestureDetector(
                              onTap: () {
                                globalStore.setPageIndex(index: 0);
                                Navigator.pushReplacementNamed(
                                    context, '/welcome_screen');
                              },
                              child: const ListTile(
                                leading: Icon(Icons.logout),
                                title: Text('Log Out'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox primaryDivider(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: const Divider(
        color: primary,
        thickness: 2,
      ),
    );
  }

  Widget subsectionTitle({required String title}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            ' $title ',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      );
}
