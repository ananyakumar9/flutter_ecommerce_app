import 'package:ecommerce_app/global_store.dart';
import 'package:ecommerce_app/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'utitlity/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<GlobalStore>(create: (_) => GlobalStore())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primary,
            secondary: secondary,
            onTertiary: tertiary,
          ),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  List<Widget> pages = const [
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
        body: Center(
          child: pages.elementAt(globalStore.pageIndex),
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
