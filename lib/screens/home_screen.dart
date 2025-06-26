import 'package:contact/componants/add_contact.dart';
import 'package:contact/componants/contact_item_widget.dart';
import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contactsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29384D),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 8),
              child: Image.asset('assets/route.png', height: 39, width: 117),
            ),
            contactsList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Image.asset(
                        'assets/homeimage.png',
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .1,
                        child: Text(
                          'There is No Contacts Added Here',
                          style: TextStyle(
                            color: Color(0xffFFF1D4),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        itemCount: contactsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2 items per row
                              crossAxisSpacing: 12, // space between columns
                              mainAxisSpacing: 12, // space between rows
                              childAspectRatio: 2 / 3.5,
                            ),
                        itemBuilder: (context, index) {
                          return ContactItemWidget(
                            onDelete: onDelete,
                            index: index,
                            contactModel: contactsList[index],
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Color(0xff29384D),
        backgroundColor: Color(0xffFFF1D4),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            builder: (context) => AddContact(addContact: addContact),
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }

  void addContact(ContactModel contactModel) {
    contactsList.add(contactModel);
    setState(() {});
  }

  void onDelete(int index) {
    contactsList.removeAt(index);
    setState(() {});
  }
}
