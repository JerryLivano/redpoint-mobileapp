import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MerchDonePage extends ConsumerWidget {
  MerchDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(color: Colors.red),
        ),
        Center(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Image.asset(
                'img/icon_coin.png',
                width: MediaQuery.of(context).size.height * 0.45,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Thank You for Purchasing!',
                    style: GoogleFonts.poppins(
                        fontSize: 34, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20)))),
                  child: const Text(
                    'Go Back',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/merch', (route) => false);
                  },
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
