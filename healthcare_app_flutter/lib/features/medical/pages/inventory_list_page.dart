import 'package:flutter/material.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/main.dart';

class InventoryList extends StatelessWidget {
  const InventoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data?[index];
                return ListTile(
                  title: Text(item!.medicine!.name!),
                  // subtitle: Text(item.description),
                  trailing: Text(item!.price.toString()),
                );
              },
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
