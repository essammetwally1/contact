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
  List<ContactModel> contactsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29384D),

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 8),
                  child: Image.asset(
                    'assets/route.png',
                    height: 39,
                    width: 117,
                  ),
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

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 60, // or any fixed width you prefer
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          contactsList.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color(0xffFFF1D4),
                              content: Center(
                                child: Text(
                                  'All Contacts Deleted',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff29384D),
                                  ),
                                ),
                              ),
                            ),
                          );

                          setState(() {});
                        },
                        child: Center(
                          child: Image.asset(
                            'assets/delete.png',
                            color: Colors.white,
                            scale: .5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 60,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFFF1D4),
                          foregroundColor: const Color(0xff29384D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(40),
                              ),
                            ),
                            builder: (context) =>
                                AddContact(addContact: addContact),
                          );
                        },
                        child: const Center(child: Icon(Icons.add)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
