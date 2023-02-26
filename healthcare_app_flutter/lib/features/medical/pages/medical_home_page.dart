import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/features/patient/patient.dart';
import 'package:healthcare_app_flutter/main.dart';

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
          ListTile(
            onTap: () {
              AutoRouter.of(context).pushWidget(const AddMedicine());
            },
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

final searchMedicineProvider = ChangeNotifierProvider<SearchMedicine>((
  ref,
) {
  return SearchMedicine(
    ref,
  );
});

class SearchMedicine extends ChangeNotifier {
  final Ref ref;

  SearchMedicine(
    this.ref,
  );

  List<String>? medicineList = [];
  Medicine? medicine;

  Future<List<String?>?> searchMedicine(String? query) async {
    medicineList = await ref
        .read(AppDependency.clientProvider)
        .medicine
        .searchSuggestionsForMedicine(query!);
    notifyListeners();

    return medicineList;
  }

  clear() {
    medicineList = [];
    notifyListeners();
  }

  Future<Medicine?> getMedicine(String? query) async {
    medicine = await ref
        .read(AppDependency.clientProvider)
        .medicine
        .searchMedicine(query!);
    notifyListeners();

    return medicine;
  }
}

class AddMedicine extends ConsumerStatefulWidget {
  const AddMedicine({super.key});

  @override
  ConsumerState<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends ConsumerState<AddMedicine> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  TextEditingController _discountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool addInv = false;

  @override
  Widget build(BuildContext context) {
    final searchMedicine = ref.watch(searchMedicineProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            CustomTextField(
              suffixIcon: InkWell(
                  onTap: () {
                    _searchController.clear();
                    ref.read(searchMedicineProvider.notifier).clear();
                  },
                  child: const Icon(Icons.clear_outlined)),
              label: "Search ",
              controller: _searchController,
              onChanged: (p0) async {
                await ref.read(searchMedicineProvider).searchMedicine(p0!);
              },
              enabled: true,
            ),
            SizedBox(
              height: 300,
              child: searchMedicine.medicineList!.isEmpty
                  ? Container()
                  : ListView.builder(
                      itemCount: searchMedicine.medicineList?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () async {
                            _searchController.clear();

                            await ref
                                .read(searchMedicineProvider.notifier)
                                .getMedicine(
                                    searchMedicine.medicineList?[index]);

                            ref.read(searchMedicineProvider.notifier).clear();

                            if (kDebugMode) {
                              print(searchMedicine.medicine?.name);
                            }
                          },
                          title:
                              Text(searchMedicine.medicineList?[index] ?? ""),
                        );
                      },
                    ),
            ),
            addInv
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        label: "Price",
                        controller: _priceController,
                      ),
                      CustomTextField(
                        label: "Quantity",
                        controller: _stockController,
                      ),
                      CustomTextField(
                        label: "discount",
                        controller: _discountController,
                      ),
                      TextButton(
                        child: const Text("Add Medicine"),
                        onPressed: () async{
                          Inventory inventory = Inventory(
                            medicineId: searchMedicine.medicine!.id!,
                            price: int.parse(_priceController.text),
                            storeId: sessionManager.signedInUser!.id!,
                            discount: _discountController.text.isEmpty
                                ? 0
                                : int.parse(_discountController.text),
                            medicine: searchMedicine.medicine!,
                            stock: _stockController.text.isEmpty
                                ? 0
                                : int.parse(_stockController.text),
                          );


// await client.
                        },
                      )
                    ],
                  )
                : Container()
          ]),
        ),
      ),
    );
  }
}
