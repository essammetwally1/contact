import 'dart:io';

class ContactModel {
  final String phone;
  final String name;
  final String email;
  final File pickedImage;

  ContactModel({
    required this.pickedImage,
    required this.phone,
    required this.name,
    required this.email,
  });
}
