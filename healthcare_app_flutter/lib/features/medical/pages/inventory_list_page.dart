import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/main.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Inventory List'),
      ),
      body: FutureBuilder<List<Inventory>?>(
        future: client.inventory.getInventory(),
        // initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<Inventory>?> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = snapshot.data?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 200,
                                child: Text(item!.medicine!.name ?? '')),
                            Text("qty: ${item.stock}"),
                            // Text(item!.m ?? ''),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                                "${discounts(item.price, item.discount ?? 0)} Rs"),
                            Text("${item.discount}% off",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 10,
                                )),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

discounts(int price, int dis) {
  return price - (price * dis / 100);
}
