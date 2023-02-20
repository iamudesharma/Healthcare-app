import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes/app_route.dart';
import '../widgets/button_with_border.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int? _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Choose One of the following",
              style: Theme.of(context).textTheme.headlineSmall,
            )),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: ButtonWithBorder(
                  borderColor: index == _selected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.headlineSmall!.color!,
                  onTap: () {
                    setState(() {
                      _selected = index;
                    });
                  },
                  title: _titele[index],
                ),
              );
            }),
            const SizedBox(
              height: 50,
            ),
            _selected == null
                ? const SizedBox.shrink()
                : ElevatedButton(
                    child: const Text("Save"),
                    onPressed: () {
                      switch (_selected) {
                        case 0:
                          AutoRouter.of(context).push(AddMedicalStoreRoute());

                          break;

                        case 1:
                          AutoRouter.of(context).push(AddPatientRoute());

                          break;

                        case 2:
                          AutoRouter.of(context).push(const AddDoctorRoute());

                          break;

                        default:
                          AutoRouter.of(context).push(const HomeRoute());
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }

  final List _titele = [
    "Medical Shop",
    "Patient",
    "Doctor",
  ];
}