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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 8),
                    child: Image.asset('assets/homeimage.png'),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
