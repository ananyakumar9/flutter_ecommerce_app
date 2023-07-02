import 'dart:math';

import 'package:ecommerce_app/utility/constants.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/inapp/floral_bg.jpg'),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'URBANIC',
                  style: TextStyle(
                      color: primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                  height: 150,
                  child: Image(image: AssetImage('images/inapp/logo.jpg'))),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'SHOP',
                style: TextStyle(
                  color: secondary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0))),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '  Suppliers only',
                      style: TextStyle(
                          fontSize: 23,
                          color: primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.72,
                  decoration: const BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0))),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedBuilder(
                            animation: _controller.view,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _controller.value * 2 * pi,
                                child: child,
                              );
                            },
                            child: const SizedBox(
                              height: 50,
                              child: Image(
                                image: AssetImage('images/inapp/logo.jpg'),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/supplier_screen');
                            },
                            child: const Text('LogIn'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/supplier_screen');
                            },
                            child: const Text('Sign Up'),
                          )
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.72,
                  decoration: const BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0))),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/customer_login');
                            },
                            child: const Text('LogIn'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/customer_signup');
                            },
                            child: const Text('Sign Up'),
                          ),
                          AnimatedBuilder(
                            animation: _controller.view,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _controller.value * 2 * pi,
                                child: child,
                              );
                            },
                            child: const SizedBox(
                              height: 50,
                              child: Image(
                                image: AssetImage('images/inapp/logo.jpg'),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white54,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const SizedBox(
                            height: 60,
                            child: Image(
                              image: AssetImage('images/inapp/google.jpg'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const SizedBox(
                            height: 60,
                            child: Image(
                              image: AssetImage('images/inapp/facebook.jpg'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const SizedBox(
                              height: 60,
                              child: Icon(
                                Icons.person,
                                size: 60,
                              )),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
