import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically send the form data to your backend
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('របាយការណ៍ត្រូវបានផ្ញើជោគជ័យ!'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'ទំនាក់ទំនង',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Troll',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'សូមផ្ញើមតិយោបល់ ឬរាយការណ៍បញ្ហាផ្សេងៗ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Troll',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'ឈ្មោះ',
                  labelStyle: TextStyle(color: Colors.white, fontFamily: 'Troll'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'សូមបញ្ចូលឈ្មោះរបស់អ្នក';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'អ៊ីមែល',
                  labelStyle: TextStyle(color: Colors.white, fontFamily: 'Troll'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'សូមបញ្ចូលអ៊ីមែលរបស់អ្នក';
                  }
                  if (!value.contains('@')) {
                    return 'សូមបញ្ចូលអ៊ីមែលឱ្យបានត្រឹមត្រូវ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _messageController,
                style: const TextStyle(color: Colors.white),
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'សារ',
                  labelStyle: TextStyle(color: Colors.white, fontFamily: 'Troll'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'សូមបញ្ចូលសាររបស់អ្នក';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'ផ្ញើសារ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Troll',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
