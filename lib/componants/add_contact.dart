import 'package:contact/componants/contact_form.dart';
import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  final void Function(ContactModel) addContact;
  const AddContact({super.key, required this.addContact});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff29384D),

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [ContactForm(addContact: addContact)],
          ),
        ),
      ),
    );
  }
}
