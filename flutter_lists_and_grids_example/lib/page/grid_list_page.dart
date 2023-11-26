import 'package:flutter/material.dart';

class GridListPage extends StatelessWidget {
  const GridListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid list page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          100,
          (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          },
        ),
      ),
    );
  }
}
