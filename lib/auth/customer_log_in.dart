import 'package:flutter/material.dart';

import '../widgets/auth_widgets.dart';

class CustomerLogIn extends StatefulWidget {
  const CustomerLogIn({super.key});

  @override
  State<CustomerLogIn> createState() => _CustomerLogInState();
}

class _CustomerLogInState extends State<CustomerLogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AuthHeader(heading: 'LogIn'),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  hintText: 'Email Address',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            HaveAccount(
              haveAccount: 'Don\'t have an account?',
              actionLabel: 'Sign Up',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/customer_signup');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, '/supplier_screen');
              },
              child: const Text('Log In'),
            )
          ],
        ),
      ),
    ));
  }
}
