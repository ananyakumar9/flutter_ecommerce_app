import 'package:ecommerce_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../global_store.dart';
import '../utitlity/category_list.dart';
import '../widgets/category_item.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  PageController categoryController = PageController();
  final Observable<int> categoryIndex = Observable(0);

  void setCategoryIndex({required int index}) {
    runInAction(() => categoryIndex.value = index);
  }

  @override
  Widget build(BuildContext context) {
    var globalStore = Provider.of<GlobalStore>(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              globalStore.setPageIndex(index: 0);
            },
          ),
          title: SearchBox(
            onTap: () {},
          ),
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                top: 0,
                child: sideNavigator(context: context)),
            Positioned(
                bottom: 0,
                right: 0,
                top: 0,
                child: categoryView(context: context)),
          ],
        ));
  }

  Widget sideNavigator({required BuildContext context}) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.25,
        color: Colors.grey.shade300,
        child: ListView.builder(
            itemCount: mainCategory.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setCategoryIndex(index: index);
                  categoryController.jumpToPage(index);
                },
                child: Observer(
                    builder: (context) => Container(
                          color: categoryIndex.value == index
                              ? Colors.white
                              : null,
                          child: SizedBox(
                              height: 70,
                              child: Center(
                                child: Text(
                                  mainCategory.elementAt(index),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        )),
              );
            }));
  }

  Widget categoryView({required BuildContext context}) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Scrollbar(
          controller: categoryController,
          child: PageView(
            controller: categoryController,
            onPageChanged: (value) {
              setCategoryIndex(index: value);
            },
            scrollDirection: Axis.vertical,
            children: [
              CategoryItem(
                list: men,
                heading: mainCategory[0],
                imageURL: 'images/men/men',
              ),
              CategoryItem(
                list: women,
                heading: mainCategory[1],
                imageURL: 'images/women/women',
              ),
              CategoryItem(
                list: electronics,
                heading: mainCategory[2],
                imageURL: 'images/electronics/electronics',
              ),
              CategoryItem(
                list: accessories,
                heading: mainCategory[3],
                imageURL: 'images/accessories/accessories',
              ),
              CategoryItem(
                list: shoes,
                heading: mainCategory[4],
                imageURL: 'images/shoes/shoes',
              ),
              CategoryItem(
                list: homeandgarden,
                heading: mainCategory[5],
                imageURL: 'images/homegarden/home',
              ),
              CategoryItem(
                list: beauty,
                heading: mainCategory[6],
                imageURL: 'images/beauty/beauty',
              ),
              CategoryItem(
                list: kids,
                heading: mainCategory[7],
                imageURL: 'images/kids/kids',
              ),
              CategoryItem(
                list: bags,
                heading: mainCategory[8],
                imageURL: 'images/bags/bags',
              ),
            ],
          ),
        ));
  }
}
