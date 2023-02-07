// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/dependency/app_dependency.dart';
import 'package:healthcare_app_flutter/features/patient/pages/patient_home_page.dart';
import 'package:healthcare_app_flutter/helpers/image_picker_helper.dart';
import 'package:healthcare_app_flutter/main.dart';
import 'package:image_picker/image_picker.dart';

class AddPatientPage extends ConsumerStatefulWidget {
  const AddPatientPage({
    super.key,
    this.isEdit = false,
  });

  final bool? isEdit;

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
    if (widget.isEdit!) {
      isEditTrue();
    } else {
      _nameController = TextEditingController();
      _ageController = TextEditingController();
      _weightController = TextEditingController();
      _heightController = TextEditingController();
      _addressController = TextEditingController();
      _phoneController = TextEditingController();
    }

    super.initState();
  }

  isEditTrue() async {
    final patient = ref.read(patientProvider).value;

    _nameController = TextEditingController(text: patient?.name);
    _ageController = TextEditingController(text: patient?.age.toString());
    _weightController = TextEditingController(
      text: patient?.weight.toString(),
    );
    _heightController = TextEditingController(
      text: patient?.height.toString(),
    );
    _addressController = TextEditingController(
      text: patient?.address,
    );
    _phoneController = TextEditingController(text: patient?.phoneNo.toString());

    // setState(() {
    //   _gender = patient!.gender;
    // });
  }

  String? _gender;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final file = await ImagePickerHelper.getImage(
                          imageSource: ImageSource.camera);

                      if (file != null) {
                        final _image = await file.readAsBytes();

                        String path = file.path;

                        print("Path: $path");

                        var uploadDescription = await ref
                            .read(AppDependency.clientProvider)
                            .patient
                            .getUploadDescription(path)
                            .then((value) {
                          print("Value: $value");
                        });

                        if (uploadDescription != null) {
                          var uploader = FileUploader(uploadDescription);
                          await uploader
                              .uploadByteData(_image.buffer.asByteData())
                              .then(
                            (value) {
                              print("Uploaded $value");
                            },
                          );
                          var success = await client.patient.verifyUpload(path);
                          print("Success: $success");
                          // print("sn dkj");

                          // final url = await client.patient.getPublicUrl(
                          //     "/data/user/0/com.example.healthcare_app_flutter/cache/bf27a25e-cce0-44c2-92be-286595a493766591032310226248515.jpg");

                          // print("URL: $url");
                          // print("URL: ${url?.path}");

                          // print("sn dkj");
                        }
                      }
                    },
                    child: const Badge(
                      isLabelVisible: true,
                      label: Text("Upload Image"),
                      alignment: AlignmentDirectional(10, 90),
                      child: CircleAvatar(
                        radius: 50,
                      ),
                    ),
                  ),
                ),
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
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.number,
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
                  value: "Male",
                  validator: <String>(p0) {
                    if (p0!.isEmpty) {
                      return 'Gender is required';
                    }
                    return null;
                  },
                  label: "Gender",
                  items: const <String>["Male", "Female", "Other"],
                  onChanged: <Sting>(p0) {
                    setState(() {
                      _gender = p0;
                    });
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.number,
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
                  child: Text(widget.isEdit! ? "Update" : "Save"),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.isEdit!) {
                        await patient.updatePatient(
                          Patient(
                            name: _nameController.text,
                            age: int.parse(
                              _ageController.text,
                            ),
                            address: _addressController.text,
                            geoPoint: GeoPoint(
                              lat: 10,
                              long: 10,
                              id: Random().nextInt(100000),
                            ),
                            phoneNo: int.parse(_phoneController.text),
                            createdAt: DateTime.now(),
                            gender: _gender ??
                                ref.read(patientProvider).value!.gender,
                            height: _heightController.text,
                            weight: _weightController.text,
                            userId: sessionManager.signedInUser!.id!,
                          ),
                        );
                      } else {
                        await patient.cratePatient(
                          Patient(
                            name: _nameController.text,
                            age: int.parse(
                              _ageController.text,
                            ),
                            address: _addressController.text,
                            geoPoint: GeoPoint(
                                lat: 10,
                                long: 10,
                                id: Random().nextInt(100000)),
                            phoneNo: int.parse(_phoneController.text),
                            createdAt: DateTime.now(),
                            gender: _gender ?? "",
                            height: _heightController.text,
                            weight: _weightController.text,
                            userId: sessionManager.signedInUser!.id!,
                          ),
                        );
                      }
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
    required this.value,
  }) : super(key: key);

  final T? value;
  final List<T> items;
  final String label;
  final String? Function(T?)? validator;

  final void Function(T?) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
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
