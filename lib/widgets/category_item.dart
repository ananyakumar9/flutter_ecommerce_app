import 'package:ecommerce_app/utitlity/extensions.dart';
import 'package:ecommerce_app/widgets/subcategory_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final List<String> list;
  final String heading;
  final String? imageURL;
  const CategoryItem({
    required this.list,
    required this.heading,
    this.imageURL = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              heading.capitalize(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Flexible(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubcategoryScreen(
                                      mainCategoryName: heading,
                                      subCategoryName: list.elementAt(index),
                                    )));
                      },
                      child: Column(children: [
                        Flexible(
                          flex: 2,
                          child: Image(
                            image: AssetImage('$imageURL$index.jpg'),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: Text(list.elementAt(index)),
                          ),
                        ),
                      ]),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
