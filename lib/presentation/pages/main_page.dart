import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_redpoint/presentation/providers/datauser_data_provider.dart';
import 'package:project_redpoint/presentation/providers/event_data_provider.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataUser = ref.watch(dataUserDataProvider);
    final eventsAsync = ref.read(eventDataProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'RedPoint',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.08),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 5, right: 10),
                    child: Text(
                      'Welcome, ${ref.watch(userDataProvider).value?.name}',
                      style: GoogleFonts.jaldi(
                          fontSize: 24,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.6),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1.5,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    height: 140,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Blood Donated:',
                              style: GoogleFonts.jaldi(fontSize: 20),
                            ),
                            Text(
                              '${ref.watch(userDataProvider).value?.donated} Ltr',
                              style: GoogleFonts.sofiaSansCondensed(
                                  fontSize: 62,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                        const Spacer(),
                        Image.asset('img/icon_blood.png'),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1.5,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    height: 48,
                    child: Row(
                      children: [
                        Image.asset('img/icon_coin.png'),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            'RedPoint:',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Text(
                                      '${ref.watch(userDataProvider).value?.point}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      ' Point',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Events & Promo',
                            style: GoogleFonts.jaldi(
                                fontSize: 30,
                                color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: eventsAsync.when(
                              data: (events) {
                                return Row(
                                  children: List.generate(
                                    events.length,
                                    (index) {
                                      String imagePath =
                                          events[index].image ?? 'null.jpg';
                                      return Container(
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors
                                              .grey, // Replace with your content
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'img/promo/$imagePath'),
                                          ),
                                        ),
                                        margin: const EdgeInsets.only(
                                            right: 5, left: 5),
                                      );
                                    },
                                  ),
                                );
                              },
                              loading: () {
                                return const CircularProgressIndicator(); // Loading indicator or placeholder
                              },
                              error: (error, stackTrace) {
                                return Text(
                                    'Error: $error'); // Error handling UI
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Blood Data',
                      style: GoogleFonts.jaldi(
                          fontSize: 26,
                          color: Colors.red,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: dataUser.when(
                      data: (dataUser) {
                        if (dataUser != null) {
                          List<String> bloodTypes = ['O', 'A', 'B', 'AB'];

                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: DataTable(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.red,
                              ),
                              dataRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.redAccent.withOpacity(0.1),
                              ),
                              columns: [
                                DataColumn(
                                  label: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Blood Type',
                                        style: GoogleFonts.jaldi(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Count',
                                        style: GoogleFonts.jaldi(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Donated (Ltr)',
                                        style: GoogleFonts.jaldi(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                bloodTypes.length,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(
                                        Center(child: Text(bloodTypes[index]))),
                                    DataCell(Center(
                                        child: Text(
                                            '${dataUser[index].userCount}'))),
                                    DataCell(Center(
                                        child: Text(
                                            '${dataUser[index].bloodDonated}'))),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Text('Data not available');
                        }
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) => Text('Error: $error'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.red)
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.home_rounded,
                      size: 32,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Handle the action for the home icon
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
