import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String name;

  const ItemList({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$name ${index + 1}'),
          leading: const Icon(Icons.account_circle),
          onTap: () {},
        );
      },
    );
  }
}
