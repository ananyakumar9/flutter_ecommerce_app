import 'package:flutter/cupertino.dart';

import '../utility/constants.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback onTap;
  const SearchBox({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
        onTap: onTap,
        backgroundColor: tertiary,
        itemColor: primary,
        borderRadius: BorderRadius.circular(12.0));
  }
}
