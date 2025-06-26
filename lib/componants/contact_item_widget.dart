import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactItemWidget extends StatelessWidget {
  final void Function(int) onDelete;

  final ContactModel contactModel;
  final int index;

  const ContactItemWidget({
    super.key,
    required this.contactModel,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: contactModel.pickedImage != null
                          ? FileImage(contactModel.pickedImage!)
                          : AssetImage('assets/image.png'),
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
                      contactModel.name,
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
                      Text(contactModel.email, style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Image.asset('assets/phone.png'),
                      SizedBox(width: 10),

                      Text(contactModel.phone, style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  SizedBox(height: 7),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color(0xffFFF1D4),
                            content: Center(
                              child: Text(
                                'Contact Deleted',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff29384D),
                                ),
                              ),
                            ),
                          ),
                        );

                        onDelete(index);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/delete.png'),
                          SizedBox(width: 10),

                          Text('Delete', style: TextStyle(color: Colors.white)),
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
  }
}
