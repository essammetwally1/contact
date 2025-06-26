import 'package:contact/componants/add_contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homescreen';

  const HomeScreen({super.key});

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 12, // space between columns
                    mainAxisSpacing: 12, // space between rows
                    childAspectRatio: 2 / 3.5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/model1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFF1D4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Essam',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Color(0xffFFF1D4),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/mail.png'),
                                      SizedBox(width: 10),
                                      Text('essam@gmail.com'),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Image.asset('assets/phone.png'),
                                      SizedBox(width: 10),

                                      Text('+1000000000'),
                                    ],
                                  ),
                                  SizedBox(height: 7),

                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/delete.png'),
                                          SizedBox(width: 10),

                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              //  Column(
              //   mainAxisAlignment: MainAxisAlignment.center,

              //   children: [
              //     Image.asset('assets/homeimage.png', width: double.infinity),
              //     SizedBox(
              //       height: MediaQuery.sizeOf(context).height * .1,
              //       child: Text(
              //         'There is No Contacts Added Here',
              //         style: TextStyle(
              //           color: Color(0xffFFF1D4),
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFFF1D4),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            builder: (context) => const AddContact(),
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
