import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../routes/app_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    final router = AutoRouter.of(context);
    super.didChangeDependencies();

    // await checkUser(sessionManager.signedInUser!.id!, ref);

    if (await client.patient.currentPatient() == null) {
      // if (await client.doctor.currentDoctor() == null) {
      if (await client.chemists.currentChemists() == null) {
        //     router.push(const SetupRoute());
        //   } else {}
      } else {
        router.push(const MedicalHomeRoute());
      }
    } else {
      router.push(const PatientHomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}