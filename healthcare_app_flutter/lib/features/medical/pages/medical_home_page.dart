import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';

import '../../../dependency/app_dependency.dart';
import '../../../routes/app_route.dart';

final curretMedicalStoreProvider = FutureProvider<Chemists?>((ref) async {
  return await ref
      .read(AppDependency.clientProvider)
      .chemists
      .currentChemists();
});

class MedicalHomePage extends ConsumerWidget {
  const MedicalHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final medicalData = ref.watch(curretMedicalStoreProvider);
    var _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.amber,
              ),
              accountEmail: Text(ref
                      .read(AppDependency.sessionManagerProvider)
                      .signedInUser
                      ?.email ??
                  ""),
              accountName: Text(medicalData.value?.name ?? ""),
              otherAccountsPictures: [
                ElevatedButton(
                  onPressed: () {
                    // AutoRouter.of(context).push(AddPatientRoute(isEdit: true));
                  },
                  child: const Center(child: Icon(Icons.edit)),
                )
              ],
              otherAccountsPicturesSize: const Size(60, 30)),
          const ListTile(
            title: Text("Add Medicine"),
          ),
          const ListTile(
            title: Text("Order History"),
          ),
          const ListTile(
            title: Text("Settings"),
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () async {
              await ref.read(AppDependency.sessionManagerProvider).signOut();

              // ignore: use_build_context_synchronously
              await AutoRouter.of(context).replace(const SignInRoute());
            },
          ),
        ],
      )),
      key: _scaffoldKey,
      body: medicalData.when(
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
