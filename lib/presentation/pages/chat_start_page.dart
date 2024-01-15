import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatStartPage extends ConsumerWidget {
  const ChatStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 250, 240, 240)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'How Can I Help You Today?',
                          style: GoogleFonts.sarabun(
                              fontSize: 44,
                              letterSpacing: 1,
                              height: 1.2,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Image.asset(
                          'img/admin_bot.png',
                          width: MediaQuery.of(context).size.height * 0.45,
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.05, 20, 0),
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
                                child: const Text(
                                  "Start Chat Admin",
                                  style: TextStyle(fontSize: 16),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/admin_chat');
                                })),
                      ],
                    ),
                  ),
                )),
              ]),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.red)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.home_rounded,
                        size: 32,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 32,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/merch');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.message_rounded,
                        size: 32,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.person,
                        size: 32,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/profile');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
