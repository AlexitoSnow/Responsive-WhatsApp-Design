import 'package:flutter/material.dart';
import 'package:whatsapp_design/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = {
      'Chats': Icons.chat,
      'Novedades': Icons.blur_circular_sharp,
      'Calls': Icons.call,
    };

    final pages = [
      const ItemList(name: 'Chat'),
      const ItemList(name: 'Novedad'),
      const ItemList(name: 'Call'),
    ];
    return ResponsiveScaffold(
      items: items,
      pages: pages,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
