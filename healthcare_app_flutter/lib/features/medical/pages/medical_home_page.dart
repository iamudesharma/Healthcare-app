import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/features/patient/patient.dart';
import 'package:healthcare_app_flutter/main.dart';

import '../../../dependency/app_dependency.dart';
import '../../../routes/app_route.dart';
import 'inventory_list_page.dart';

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
    return PlatformScaffold(
      cupertino: (context, platform) => CupertinoPageScaffoldData(),
      bottomNavBar: PlatformNavBar(
        itemChanged: (p0) {},
        items: [
          BottomNavigationBarItem(
              icon: Icon(PlatformIcons(context).home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      widgetKey: _scaffoldKey,
      material: (context, platform) => MaterialScaffoldData(
        widgetKey: _scaffoldKey,
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
                AutoRouter.of(context).pushWidget(const InventoryList());
              },
              title: const Text("Inventory List"),
            ),
            ListTile(
              onTap: () {
                AutoRouter.of(context).pushWidget(const AddMedicine());
              },
              title: const Text("Add Medicine"),
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
      ),
      key: _scaffoldKey,
      body: medicalData.when(
        data: (patient) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PlatformAppBar(
                leading: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: const Icon(Icons.menu)),
                title: Text(patient?.name ?? ""),
              ),
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
      child: PlatformScaffold(
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
              searchMedicine.medicineList!.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 300,
                      child: ListView.builder(
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

                              setState(() {
                                addInv = true;
                              });
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
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: [
                            const Placeholder(
                              fallbackHeight: 120,
                              fallbackWidth: 150,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  searchMedicine.medicine!.name ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                    searchMedicine.medicine!.ingredients ?? ""),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 180,
                                    child: Text(
                                      searchMedicine.medicine!.description ??
                                          "",
                                      maxLines: 7,
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            )
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          label: "Price",
                          controller: _priceController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          label: "Quantity",
                          controller: _stockController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          label: "discount",
                          controller: _discountController,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          child: const Text("Add Medicine"),
                          onPressed: () async {
                            final router = AutoRouter.of(context);
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

                            await client.inventory
                                .addToInventory(inventory)
                                .then((value) {
                              router.pop();
                            });

                            // await client.
                          },
                        )
                      ],
                    )
                  : Container()
            ]),
          ),
        ),
      ),
    );
  }
}
