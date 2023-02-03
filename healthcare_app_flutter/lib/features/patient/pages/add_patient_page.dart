// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:healthcare_app_flutter/dependency/app_dependency.dart';

class AddPatientPage extends ConsumerStatefulWidget {
  const AddPatientPage({super.key});

  @override
  ConsumerState<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends ConsumerState<AddPatientPage> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;

  late TextEditingController _addressController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _weightController = TextEditingController();
    _heightController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();

    super.initState();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final patient = ref.watch(AppDependency.clientProvider).patient;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                CustomTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  controller: _nameController,
                  label: "Name",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Age is required';
                    }
                    return null;
                  },
                  controller: _ageController,
                  label: "Age",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _phoneController,
                  label: "Phone No",
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Phone No is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFieldDropDown<String>(
                  validator: <String>(p0) {
                    if (p0!.isEmpty) {
                      return 'Gender is required';
                    }
                    return null;
                  },
                  label: "Gender",
                  items: const <String>["Male", "Female", "Other"],
                  onChanged: <Sting>(p0) {},
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Weight is required';
                    }
                    return null;
                  },
                  controller: _weightController,
                  label: "Weight (in kg))",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Height is required';
                    }
                    return null;
                  },
                  controller: _heightController,
                  label: "height (in cm))",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                  controller: _addressController,
                  label: "Address",
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // patient.addPatient(
                      //   name: _nameController.text,
                      //   age: int.parse(_ageController.text),
                      //   weight: double.parse(_weightController.text),
                      //   height: double.parse(_heightController.text),
                      //   address: _addressController.text,
                      //   phone: _phoneController.text,
                      // );
                      // Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool? obscureText;
  final bool? enabled;
  final bool? enableSuggestions;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.label,
    this.validator,
    this.onChanged,
    this.obscureText,
    this.enabled,
    this.enableSuggestions,
    this.textInputAction,
    this.keyboardType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.send,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      enabled: enabled,
      enableSuggestions: true,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
      ),
    );
  }
}

class TextFieldDropDown<T> extends StatelessWidget {
  const TextFieldDropDown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.validator,
    required this.label,
  }) : super(key: key);

  final List<T> items;
  final String label;
  final String? Function(T?)? validator;

  final void Function(T?) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
      ),
      onChanged: (value) => onChanged(value),
      items: items
          .map((e) => DropdownMenuItem<T>(value: e, child: Text(e.toString())))
          .toList(),
    );
  }
}
