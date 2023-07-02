import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/index.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../global_store.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  List<Widget> customerPages = const [
    HomePage(),
    Category(),
    Stores(),
    Cart(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    var globalStore = Provider.of<GlobalStore>(context);

    return Observer(builder: (context) {
      return Scaffold(
        body: Center(child: customerPages.elementAt(globalStore.pageIndex)),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Stores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          currentIndex: globalStore.pageIndex,
          onTap: (value) => globalStore.setPageIndex(index: value),
        ),
      );
    });
  }
}

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({super.key});

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  List<Widget> supplierPages = const [
    HomePage(),
    Category(),
    Stores(),
    DashBoard(),
    Upload()
  ];

  @override
  Widget build(BuildContext context) {
    var globalStore = Provider.of<GlobalStore>(context);

    return Observer(builder: (context) {
      return Scaffold(
        body: Center(
          child: supplierPages.elementAt(globalStore.pageIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Stores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'Upload',
            ),
          ],
          currentIndex: globalStore.pageIndex,
          onTap: (value) => globalStore.setPageIndex(index: value),
        ),
      );
    });
  }
}
