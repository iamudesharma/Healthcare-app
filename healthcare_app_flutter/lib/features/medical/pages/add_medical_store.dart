// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/dependency/app_dependency.dart';
import 'package:healthcare_app_flutter/main.dart';
import 'package:intl/intl.dart';
import 'package:healthcare_app_flutter/features/patient/patient.dart';

class AddMedicalStorePage extends ConsumerStatefulWidget {
  const AddMedicalStorePage({
    Key? key,
    this.isEdit = false,
  }) : super(key: key);
  final bool? isEdit;

  @override
  ConsumerState<AddMedicalStorePage> createState() =>
      _AddMedicalStorePageState();
}

class _AddMedicalStorePageState extends ConsumerState<AddMedicalStorePage> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _closeTimeController;
  late TextEditingController _openTimeController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _closeTimeController = TextEditingController();
    _openTimeController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medical Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _nameController,
                label: 'Name',
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _phoneController,
                label: 'phone no',
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              CustomTextField(
                maxLines: 2,
                controller: _addressController,
                label: 'Address',
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              CustomTextField(
                onTap: () {
                  showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(DateTime(2022, 1, 8, 8)))
                      .then((value) {
                    _openTimeController.text = value!.format(context);
                  });
                },
                readOnly: true,
                controller: _openTimeController,
                label: 'Open Time',
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              CustomTextField(
                onTap: () {
                  showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(DateTime(2022, 1, 8, 22)))
                      .then((value) {
                    _closeTimeController.text = value!.format(context);
                  });
                },
                readOnly: true,
                controller: _closeTimeController,
                label: 'Close Time',
                onChanged: (value) {},
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                child: Text(widget.isEdit! ? "Update" : "Save"),
                onPressed: () async {
                  if (widget.isEdit!) {
                  } else {
                    final _chemists = Chemists(
                      invertory: [],
                      email: sessionManager.signedInUser?.email,
                      latitude: 100.8800,
                      longitude: 10.00019,
                      userId: ref
                          .read(AppDependency.sessionManagerProvider)
                          .signedInUser!
                          .id!,
                      address: _addressController.text,
                      closeTime:
                          DateFormat.jm().parse(_closeTimeController.text),
                      geoPoint: GeoPoint(
                        lat: 10,
                        long: 20,
                        id: Random().nextInt(1000),
                      ),
                      openTime: DateFormat.jm().parse(_openTimeController.text),
                      phoneNo: int.parse(_phoneController.text),
                      name: _nameController.text,
                      images: [],
                    );

                    print(_chemists.toJson());
                    await ref
                        .read(AppDependency.clientProvider)
                        .chemists
                        .addChemists(_chemists);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
