import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

final obscureOldTextProvider = StateProvider<bool>((_) => true);
final obscureNewTextProvider = StateProvider<bool>((_) => true);
final obscureConfTextProvider = StateProvider<bool>((_) => true);

// ignore: must_be_immutable
class ChangePasswordPage extends ConsumerWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  TextEditingController oldpw = TextEditingController();
  TextEditingController newpw = TextEditingController();
  TextEditingController confpw = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOldObscured = ref.watch(obscureOldTextProvider);
    bool isNewObscured = ref.watch(obscureNewTextProvider);
    bool isConfObscured = ref.watch(obscureConfTextProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Change Password',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      body: OverflowBox(
        maxHeight: MediaQuery.of(context).size.height,
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
          child: Center(
            child: Column(children: [
              Image.asset(
                'img/change-password.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
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
                          hintText: 'Old Password',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(210, 90, 90, 90)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.red)),
                          prefixIcon: const Icon(Icons.vpn_key),
                          prefixIconColor: Colors.red,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref.read(obscureOldTextProvider.notifier).state =
                                  !isOldObscured;
                            },
                            icon: Icon(isOldObscured
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        obscureText: isOldObscured,
                        controller: oldpw,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'New Password',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(210, 90, 90, 90)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
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
                        controller: newpw,
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
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
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
                        controller: confpw,
                      ),
                      const SizedBox(
                        height: 40,
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
                            "Change Password",
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () async {
                            if (oldpw.text.trim().isNotEmpty &&
                                newpw.text.trim().isNotEmpty &&
                                confpw.text.trim().isNotEmpty) {
                              if (oldpw.text ==
                                  ref.watch(userDataProvider).value!.password) {
                                if (oldpw.text != newpw.text) {
                                  if (newpw.text == confpw.text) {
                                    await ref
                                        .watch(userDataProvider.notifier)
                                        .changePassword(
                                            newpw.text,
                                            ref
                                                .watch(userDataProvider)
                                                .value!
                                                .id);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Failed to Change Password'),
                                          content:
                                              const Text('Password Mismatch'),
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
                                        title: const Text(
                                            'Failed to Change Password'),
                                        content: const Text(
                                            'Password cannot same with the old one'),
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
                                      title: const Text(
                                          'Failed to Change Password'),
                                      content: const Text('Incorrect Password'),
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
                                    title:
                                        const Text('Failed to Change Password'),
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
