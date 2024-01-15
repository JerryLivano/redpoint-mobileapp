import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_redpoint/domain/entities/merch.dart';
import 'package:project_redpoint/presentation/providers/merch_data_provider.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

class MerchPage extends ConsumerWidget {
  const MerchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Merch Change',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    5,
                    MediaQuery.of(context).size.height * 0.08,
                    5,
                    MediaQuery.of(context).size.height * 0.08,
                  ),
                  child: FutureBuilder<List<Merch>>(
                    future: ref.read(merchDataProvider.notifier).showMerch(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Error fetching merch data'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No merch data available'),
                        );
                      } else {
                        List<Merch> merchsData = snapshot.data!;
                        return ListView(
                          children: List.generate(
                            merchsData.length,
                            (index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      elevation: 3,
                                      color: Colors.white,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 1.2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                right: 12,
                                              ),
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    'img/merch/${merchsData[index].image ?? 'null.jpg'}',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  merchsData[index].name,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                    'Stock: ${merchsData[index].stock}')
                                              ],
                                            ),
                                            const Spacer(),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: SizedBox(
                                                height: 20,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '${merchsData[index].price} ',
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Image.asset(
                                                        'img/icon_coin.png')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.red),
                color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  padding: const EdgeInsets.fromLTRB(13, 7, 13, 7),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomLeft: Radius.circular(3),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Your Point',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        '${ref.watch(userDataProvider).value!.point} ',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Image.asset('img/icon_coin.png')
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
                      color: Colors.red,
                    ),
                    onPressed: () {},
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
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/profile');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
