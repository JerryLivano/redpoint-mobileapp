import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

class LoginData {
  final email = TextEditingController();
  final password = TextEditingController();
}

final loginDataProvider = Provider((ref) => LoginData());

// ignore: must_be_immutable
class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginData = ref.read(loginDataProvider);
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next.valueOrNull != null) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
    );

    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: OverflowBox(
          maxHeight: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipPath(
                clipper: FirstWaveClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        Colors.red,
                        Color.fromARGB(255, 233, 110, 110),
                        Colors.red,
                      ])),
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          const Text(
                            "Hello!",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Sign in to your account",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(210, 90, 90, 90)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  prefixIcon:
                                      const Icon(Icons.account_circle_rounded),
                                  prefixIconColor: Colors.red,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 0)),
                              controller: loginData.email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'email is not valid';
                                }
                                return null;
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(210, 90, 90, 90)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                prefixIconColor: Colors.red,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 0)),
                            obscureText: true,
                            controller: loginData.password,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'password is not valid';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Don't have account? ",
                              style: TextStyle(fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 25, left: 30, right: 30, bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20)))),
                      onPressed: () async {
                        String emailControl = loginData.email.text;
                        String passwordControl = loginData.password.text;

                        if (emailControl.isNotEmpty &&
                            passwordControl.isNotEmpty) {
                          await ref
                                  .read(userDataProvider.notifier)
                                  .login(emailControl, passwordControl) ??
                              showDialog(
                                context: scaffoldKey.currentContext!,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Login Error'),
                                    content: const Text(
                                        'Email or Password Incorrect'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          loginData.email.text = '';
                                          loginData.password.text = '';
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Login Error'),
                                content: const Text(
                                    'Please enter both email and password.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )),
              ClipPath(
                clipper: SecondWaveClipper(),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        Colors.red,
                        Color.fromARGB(255, 233, 110, 110),
                        Colors.red,
                      ])),
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
            ],
          ),
        ));
  }
}

class FirstWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.9, size.width / 2, size.height * 0.75);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height * 0.6, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width / 4, size.height * 0.5, size.width / 2,
        size.height * 0.25); // Swapped control points
    path.quadraticBezierTo(3 * size.width / 4, 0, size.width,
        size.height * 0.25); // Swapped control points
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
