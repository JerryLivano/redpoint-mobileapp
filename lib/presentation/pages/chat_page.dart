import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_redpoint/domain/entities/message.dart';
import 'package:project_redpoint/presentation/providers/message_data_provider.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

// ignore: must_be_immutable
class ChatPage extends ConsumerWidget {
  ChatPage({Key? key}) : super(key: key);
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userDataProvider).value!.id;
    final messages =
        ref.watch(messageDataProvider.notifier).showMessage(userId);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/wallpaper_chat.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: OverflowBox(
          maxHeight: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 25),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      border: Border(
                          bottom: BorderSide(color: Colors.red, width: 1.5)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 5,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Admin RedPoint",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<Message>>(
                      future: messages,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<Message> messageList = snapshot.data!;

                          return ListView.builder(
                            itemCount: messageList.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: messageList[index].isUser == true
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: messageList[index].isUser == true
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            255, 100, 100, 100),
                                  ),
                                  child: Text(
                                    messageList[index].message,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 25, 15, 20),
                    height: 50,
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: 'Type a message...',
                          hintStyle: const TextStyle(fontSize: 14),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.red)),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final userId =
                                  ref.watch(userDataProvider).value!.id;
                              final userRole =
                                  ref.watch(userDataProvider).value!.role;
                              final messageText = messageController.text;

                              if (messageText.isNotEmpty) {
                                await ref
                                    .read(messageDataProvider.notifier)
                                    .sendMessage(messageText, userId, userRole);
                                messageController
                                    .clear(); // Clear the text field after sending the message
                              }
                            },
                            icon: const Icon(Icons.send_rounded),
                            color: Colors.red,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
