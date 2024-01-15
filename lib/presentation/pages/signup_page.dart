import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

final obscureNewTextProvider = StateProvider<bool>((_) => true);
final obscureConfTextProvider = StateProvider<bool>((_) => true);

// ignore: must_be_immutable
class SignUpPage extends ConsumerWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isNewObscured = ref.watch(obscureNewTextProvider);
    bool isConfObscured = ref.watch(obscureConfTextProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Sign Up',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      body: OverflowBox(
        maxHeight: MediaQuery.of(context).size.height,
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
          child: Center(
            child: Column(children: [
              Image.asset(
                'img/signup.png',
                width: MediaQuery.of(context).size.width * 0.55,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Name',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(210, 90, 90, 90)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: Colors.red,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0)),
                        controller: name,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(210, 90, 90, 90)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            prefixIcon:
                                const Icon(Icons.account_circle_rounded),
                            prefixIconColor: Colors.red,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0)),
                        controller: email,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(210, 90, 90, 90)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red)),
                          prefixIcon: const Icon(Icons.password),
                          prefixIconColor: Colors.red,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(obscureNewTextProvider.notifier).state =
                                  !isNewObscured;
                            },
                            icon: Icon(isNewObscured
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        obscureText: isNewObscured,
                        controller: password,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(210, 90, 90, 90)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red)),
                          prefixIcon: const Icon(Icons.lock),
                          prefixIconColor: Colors.red,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(obscureConfTextProvider.notifier).state =
                                  !isConfObscured;
                            },
                            icon: Icon(isConfObscured
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        obscureText: isConfObscured,
                        controller: confPassword,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.red,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                      right: Radius.circular(20)))),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () async {
                            String nameValue = name.text;
                            String emailValue = email.text;
                            String passwordValue = password.text;
                            String confPasswordsValue = confPassword.text;

                            if (nameValue.isNotEmpty &&
                                emailValue.isNotEmpty &&
                                passwordValue.isNotEmpty &&
                                confPasswordsValue.isNotEmpty) {
                              if (passwordValue == confPasswordsValue) {
                                await ref
                                    .watch(userDataProvider.notifier)
                                    .signUp(
                                        nameValue, emailValue, passwordValue);
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Sign Up Failed'),
                                      content: const Text('Password Mismatch.'),
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
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Sign Up Failed'),
                                    content:
                                        const Text('All Field Cannot Empty.'),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
