import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

// ignore: must_be_immutable
class ProfilePage extends ConsumerWidget {
  ProfilePage({Key? key}) : super(key: key);

  List<String> bloodTypes = ['A', 'B', 'AB', 'O'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController phone = TextEditingController(
        text: ref.watch(userDataProvider).value?.phone ?? '-');

    TextEditingController address = TextEditingController(
        text: ref.watch(userDataProvider).value?.address ?? '-');

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.red,
                          width: 1.5,
                        ),
                        color: Colors.white,
                      ),
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('img/profile.png'),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ref.watch(userDataProvider).value?.name ??
                                  "No Name",
                              style: GoogleFonts.poppins(
                                  fontSize: 26,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ref.watch(userDataProvider).value?.email ??
                                  "No Email",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        )
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      margin: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Your Biodata',
                              style: GoogleFonts.poppins(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  prefixIcon:
                                      const Icon(Icons.phone),
                                  prefixIconColor: Colors.red,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 0)),
                              controller: phone,
                              readOnly: true,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  prefixIcon: const Icon(Icons.location_on),
                                  prefixIconColor: Colors.red,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 0)),
                              controller: address,
                              readOnly: true,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 10),
                            width: MediaQuery.of(context).size.width * 0.23,
                            height: MediaQuery.of(context).size.width * 0.23,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(MediaQuery.of(
                                          context)
                                      .size
                                      .width *
                                  0.2),
                            ),
                            child: Center(
                              child: Text(
                                ref.watch(userDataProvider).value?.blood_type ?? '-',
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 12),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.93,
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
                            'Edit Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit_profile');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.red)),
                              child: const Text(
                                'Change Password',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/change_password');
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.4,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              child: const Text('Logout'),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirmation'),
                                      content: const Text(
                                          'Are You Sure Want to Logout?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                            await ref
                                                .read(userDataProvider.notifier)
                                                .logout();
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/login',
                                                (route) => false);
                                          },
                                          child: const Text('Confirm'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/chat');
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
