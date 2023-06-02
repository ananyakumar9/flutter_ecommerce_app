import 'package:ecommerce_app/utitlity/extensions.dart';
import 'package:flutter/material.dart';

class SubcategoryScreen extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;
  const SubcategoryScreen({
    this.mainCategoryName = '',
    this.subCategoryName = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            subCategoryName.capitalize(),
            style: const TextStyle(
                fontFamily: 'Acme', fontSize: 20, letterSpacing: 1.2),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container());
  }
}
