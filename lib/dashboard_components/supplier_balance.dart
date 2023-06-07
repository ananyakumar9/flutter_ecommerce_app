import 'package:flutter/material.dart';

class SupplierBalance extends StatefulWidget {
  const SupplierBalance({super.key});

  @override
  State<SupplierBalance> createState() => _SupplierBalanceState();
}

class _SupplierBalanceState extends State<SupplierBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Balance',
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
