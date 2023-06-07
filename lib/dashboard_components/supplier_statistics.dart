import 'package:flutter/material.dart';

class SupplierStatistics extends StatefulWidget {
  const SupplierStatistics({super.key});

  @override
  State<SupplierStatistics> createState() => _SupplierStatisticsState();
}

class _SupplierStatisticsState extends State<SupplierStatistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Statistics',
            style: TextStyle(
              fontFamily: 'Acme',
              fontSize: 20,
              letterSpacing: 1.2,
            ),
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
