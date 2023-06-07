import 'package:ecommerce_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_store.dart';
import '../utility/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var globalStore = Provider.of<GlobalStore>(context);

    return DefaultTabController(
      length: mainCategory.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            title: SearchBox(
              onTap: () {
                globalStore.setPageIndex(index: 1);
              },
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: mainCategory.map((item) => TabTitle(title: item)).toList(),
            )),
        body: TabBarView(
          children: mainCategory.map((item) => Text(item)).toList(),
        ),
      ),
    );
  }
}

class TabTitle extends StatelessWidget {
  final String title;
  const TabTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(title),
    );
  }
}
