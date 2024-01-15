import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_redpoint/presentation/providers/user_data_provider.dart';

var selectedProvider = StateProvider<String?>((ref) {
  return ref.read(userDataProvider).value!.blood_type;
});

var nameProvider = StateProvider<String?>((ref) {
  return ref.read(userDataProvider).value!.name;
});

var phoneProvider = StateProvider<String?>((ref) {
  return ref.read(userDataProvider).value!.phone;
});

var addressProvider = StateProvider<String?>((ref) {
  return ref.read(userDataProvider).value!.address;
});

// ignore: must_be_immutable
class EditProfile extends ConsumerWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? selected = ref.watch(selectedProvider);
    String? name = ref.watch(nameProvider);
    String? phone = ref.watch(phoneProvider);
    String? address = ref.watch(addressProvider);

    TextEditingController nameController =
        TextEditingController(text: name ?? '-');
    TextEditingController phoneController =
        TextEditingController(text: phone ?? '-');
    TextEditingController addressController =
        TextEditingController(text: address ?? '-');

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Edit Profile',
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
                'img/edit-profile.png',
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
                          controller: nameController,
                          onChanged: (value) {
                            ref.read(nameProvider.notifier).state = value;
                            print(ref.read(nameProvider.notifier).state);
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Phone Number',
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
                            prefixIcon: const Icon(Icons.phone),
                            prefixIconColor: Colors.red,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0)),
                        controller: phoneController,
                        onChanged: (value) {
                          ref.read(phoneProvider.notifier).state = value;
                          print(ref.read(phoneProvider.notifier).state);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Address',
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
                            prefixIcon: const Icon(Icons.location_on),
                            prefixIconColor: Colors.red,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0)),
                        controller: addressController,
                        onChanged: (value) {
                          ref.read(addressProvider.notifier).state = value;
                          print(ref.read(addressProvider.notifier).state);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref.read(selectedProvider.notifier).state = 'O';
                              print(ref.read(selectedProvider.notifier).state);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: selected == 'O'
                                    ? Colors.yellow
                                    : Colors
                                        .white, // You can change the color as needed
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'O',
                                  style: TextStyle(
                                    color: Colors
                                        .red, // You can change the text color as needed
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(selectedProvider.notifier).state = 'A';
                              print(selected);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: selected == 'A'
                                    ? Colors.yellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(selectedProvider.notifier).state = 'B';
                              print(ref.read(selectedProvider.notifier).state);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: selected == 'B'
                                    ? Colors.yellow
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'B',
                                  style: TextStyle(
                                    color: Colors
                                        .red, // You can change the text color as needed
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(selectedProvider.notifier).state = 'AB';
                              print(ref.read(selectedProvider.notifier).state);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: selected == 'AB'
                                    ? Colors.yellow
                                    : Colors
                                        .white, // You can change the color as needed
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'AB',
                                  style: TextStyle(
                                    color: Colors
                                        .red, // You can change the text color as needed
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
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
                            "Save Changes",
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () async {
                            if (nameController.text.isNotEmpty &&
                                phoneController.text.isNotEmpty &&
                                addressController.text.isNotEmpty) {
                              await ref
                                  .watch(userDataProvider.notifier)
                                  .updateUser(
                                      nameController.text,
                                      phoneController.text,
                                      addressController.text,
                                      ref
                                              .read(selectedProvider.notifier)
                                              .state ??
                                          '',
                                      ref.watch(userDataProvider).value!.id);
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Cannot Update User'),
                                    content: const Text('Field cannot empty'),
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
