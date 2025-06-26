import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop(); // Close the bottom sheet
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Contact Saved')));
    }
  }

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: const Color(0xff29384D),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Profile preview section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 146,
                    width: 143,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.white),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: _pickedImage != null
                          ? Image.file(_pickedImage!, fit: BoxFit.fill)
                          : Image.asset('assets/image.png', fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _nameController.text.isEmpty
                              ? 'User Name'
                              : _nameController.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFF1D4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(height: 1, color: Color(0xffFFF1D4)),
                        const SizedBox(height: 8),
                        Text(
                          _emailController.text.isEmpty
                              ? 'example@email.com'
                              : _emailController.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFF1D4),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(height: 1, color: Color(0xffFFF1D4)),
                        const SizedBox(height: 8),
                        Text(
                          _phoneController.text.isEmpty
                              ? '+20000000000'
                              : _phoneController.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFF1D4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Name Field
            TextFormField(
              cursorColor: Colors.white,
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: customInputDecoration('Enter User Name'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Enter a name' : null,
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 16),

            // Email Field
            TextFormField(
              cursorColor: Colors.white,
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: customInputDecoration('Enter User Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Enter an email';
                if (!value.endsWith('@gmail.com')) {
                  return 'Email must end with @gmail.com';
                }
                return null;
              },
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 16),

            // Phone Field
            TextFormField(
              cursorColor: Colors.white,
              controller: _phoneController,
              style: const TextStyle(color: Colors.white),
              decoration: customInputDecoration('Enter User Phone'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a phone number';
                }
                if (!value.startsWith('01')) {
                  return 'Phone must start with 01';
                }
                return null;
              },
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 24),

            // Submit Button
            GestureDetector(
              onTap: submit,
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffFFF1D4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Enter User',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
