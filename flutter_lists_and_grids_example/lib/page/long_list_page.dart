import 'package:flutter/material.dart';

class LongListPage extends StatelessWidget {
  const LongListPage({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long list page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        prototypeItem: ListTile(
          title: Text(items.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index],
            ),
          );
        },
      ),
    );
  }
}
