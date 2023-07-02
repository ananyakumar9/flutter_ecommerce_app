import 'package:ecommerce_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../widgets/auth_widgets.dart';

class CustomerRegistration extends StatefulWidget {
  const CustomerRegistration({super.key});

  @override
  State<CustomerRegistration> createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  Observable<String> name = Observable('');
  Observable<String> email = Observable('');
  Observable<String> password = Observable('');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Observable<bool> passwordVisible = Observable(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const AuthHeader(
                  heading: 'Sign Up',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundColor: primary,
                        radius: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                            ),
                            child: const Icon(Icons.camera_alt),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: const Icon(Icons.image),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      runInAction(() => name.value = value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name';
                      } else {
                        return null;
                      }
                    },
                    decoration: textFormDecoration.copyWith(
                      labelText: 'Full Name',
                      hintText: 'Enter your Full Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      runInAction(() => email.value = value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      } else if (!value.isValidEmail()) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: textFormDecoration.copyWith(
                        labelText: 'Email Address',
                        hintText: 'Enter your Email Address'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Observer(builder: (context) {
                    return TextFormField(
                      onChanged: (value) {
                        runInAction(() => password.value = value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obscureText: passwordVisible.value,
                      decoration: textFormDecoration.copyWith(
                        suffixIcon: IconButton(
                            onPressed: () {
                              runInAction(() => passwordVisible.value =
                                  !passwordVisible.value);
                            },
                            icon: Icon(
                              passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primary,
                            )),
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                HaveAccount(
                  haveAccount: 'already have an account?',
                  actionLabel: 'Log In',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/customer_login');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, '/customer_screen');
                    }
                  },
                  child: const Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
