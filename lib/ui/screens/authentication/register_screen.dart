import 'package:flutter/material.dart';
import 'package:test_application/ui/screens/authentication/verification_screen.dart';
import 'package:test_application/ui/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  String? _selectedRole;

  final List<String> _roles = ['User', 'Admin', 'Student', 'Teacher', 'Parent'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/main_background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextfield(
                              label: 'Name',
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextfield(
                              label: 'Phone Number',
                              controller: phoneNumberController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                } else if (value.length != 10) {
                                  return 'Please enter a valid phone number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextfield(
                              label: 'Email',
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                        r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Role',
                                border: OutlineInputBorder(),
                              ),
                              value: _selectedRole,
                              items: _roles.map((role) {
                                return DropdownMenuItem<String>(
                                  value: role,
                                  child: Text(role),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a role';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextfield(
                              label: 'Password',
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            CustomTextfield(
                              label: 'Confirm Password',
                              controller: passwordConfirmationController,
                              validator: (value) {
                                if (value == null ||
                                    value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerificationScreen()));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 55,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade300,
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
