import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/dependency/app_dependency.dart';

import '../../../routes/app_route.dart';

final patientProvider = FutureProvider<Patient?>((ref) async {
  return await ref.watch(AppDependency.clientProvider).patient.currentPatient();
});

class PatientHomePage extends ConsumerStatefulWidget {
  const PatientHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PatientHomePageState();
}

class _PatientHomePageState extends ConsumerState<PatientHomePage> {
  @override
  void initState() {
    // client.ca
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final patientData = ref.watch(patientProvider);
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.amber,
              ),
              accountEmail: const Text("Udesh@gmail.com"),
              accountName: const Text("Udesh"),
              otherAccountsPictures: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Center(child: Icon(Icons.edit)),
                )
              ],
              otherAccountsPicturesSize: const Size(60, 30)),
          const ListTile(
            title: Text("Order History"),
          ),
          const ListTile(
            title: Text("Doctor Appointments"),
          ),
          const ListTile(
            title: Text("Settings"),
          ),
          ListTile(
            title: Text("Logout"),
            onTap: () async {
              await ref.read(AppDependency.sessionManagerProvider).signOut();

              await AutoRouter.of(context).replace(const SignInRoute());
            },
          ),
        ],
      )),
      key: _scaffoldKey,
      body: patientData.when(
        data: (patient) => CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu)),
              title: Text(patient?.name ?? ""),
            )
          ],
        ),
        error: (error, stackTrace) => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
