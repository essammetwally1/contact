import 'package:flutter/material.dart';

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

  void submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop();
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),

          // Name Field
          TextFormField(
            cursorColor: Colors.white,
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: customInputDecoration('Enter User Name'),
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter a name' : null,
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
              if (!value.endsWith('@gmail.com'))
                return 'Email must end with @gmail.com';
              return null;
            },
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
              if (value == null || value.isEmpty) return 'Enter a phone number';
              if (!value.startsWith('01')) return 'Phone must start with (01)';
              return null;
            },
          ),

          const SizedBox(height: 16),
          GestureDetector(
            onTap: submit,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xffFFF1D4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: const Text(
                  'Enter User',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
