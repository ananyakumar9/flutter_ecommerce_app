import 'package:flutter/material.dart';

var textFormDecoration = const InputDecoration(
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
);

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'[a-zA-Z0-9]+[@]([a-zA-Z0-9]{2,})+[.][a-z]{2,3}')
        .hasMatch(this);
  }
}

class AuthHeader extends StatelessWidget {
  final String heading;
  const AuthHeader({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
            child: const Icon(Icons.house),
          ),
        ],
      ),
    );
  }
}

class HaveAccount extends StatelessWidget {
  final String haveAccount;
  final String actionLabel;
  final Function() onPressed;
  const HaveAccount(
      {super.key,
      required this.haveAccount,
      required this.actionLabel,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          haveAccount,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            actionLabel,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
