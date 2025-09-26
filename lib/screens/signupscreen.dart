import 'package:flutter/material.dart';
import 'package:shopping_app/screens/homescreen.dart';
import 'package:shopping_app/screens/welcomescreen.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text(
          tr("StoreName"),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(const Locale("ar"));
              } else {
                context.setLocale(const Locale("en"));
              }
            },
            child: Row(
              children: [
                const Icon(Icons.language, color: Colors.white),
                const SizedBox(width: 5),
                Text(
                  tr("lang"),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ],
        
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.teal,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Bag Store",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tr("Join_us_to_begin_your_journey")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: fullNameController,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return '${tr("FullName")} ${tr("isRequired")}';
                              } else {
                                if (value != null &&
                                    !value.startsWith(RegExp(r'[A-Z]'))) {
                                  return tr("First_letter_must_be_uppercase");
                                }
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: tr("FullName"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return '${tr("Email")} ${tr("isRequired")}';
                              } else {
                                if (value != null && !value.contains("@")) {
                                  return '$value ${tr("is_not_valid_email")},\n${tr("valid_email_contains_@")}';
                                }
                                return null;
                              }
                            },
                            decoration: InputDecoration(labelText: tr("Email")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: hiddenPassword,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return '${tr("Password")} ${tr("isRequired")}';
                              } else {
                                if (value != null && value.length < 6) {
                                  return '${tr("Password")} ${tr("must_be_at_least_6_characters")}';
                                }
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: tr("Password"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  hiddenPassword = !hiddenPassword;
                                  setState(() {});
                                },
                                icon: Icon(
                                  hiddenPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: hiddenConfirmPassword,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return '${tr("ConfirmPassword")} ${tr("isRequired")}';
                              } else {
                                if (value != null &&
                                    value != passwordController.text) {
                                  return '${tr("ConfirmPassword")} ${tr("must_equal_password")}';
                                }
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: tr("ConfirmPassword"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  hiddenConfirmPassword =
                                      !hiddenConfirmPassword;
                                  setState(() {});
                                },
                                icon: Icon(
                                  hiddenConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  DialogSignUp();
                                }
                              },
                              child: Text(
                                tr("signUp"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> DialogSignUp() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              tr('Success!'),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text(tr('Account_created_successfully.'))),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text(tr('Close')),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const HomeScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
