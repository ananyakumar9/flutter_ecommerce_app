import 'package:ecommerce_app/auth/customer_sign_up.dart';
import 'package:ecommerce_app/global_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/customer_log_in.dart';
import 'screens/index.dart';
import 'utility/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalStore>(create: (_) => GlobalStore()),
      ],
      child: MaterialApp(
        routes: {
          '/welcome_screen': (context) => const WelcomScreen(),
          '/customer_screen': (context) => const CustomerHomeScreen(),
          '/supplier_screen': (context) => const SupplierHomeScreen(),
          '/customer_signup': (context) => const CustomerRegistration(),
          '/customer_login': (context) => const CustomerLogIn()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primary,
            secondary: secondary,
            onTertiary: tertiary,
          ),
        ),
        initialRoute: '/welcome_screen',
      ),
    );
  }
}
