import 'package:flutter/material.dart';
import 'package:flutter_lists_and_grids_example/page/grid_list_page.dart';
import 'package:flutter_lists_and_grids_example/page/horizontal_list_page.dart';
import 'package:flutter_lists_and_grids_example/page/list_with_different_types_of_items_page.dart';
import 'package:flutter_lists_and_grids_example/page/list_with_spaced_items_page.dart';
import 'package:flutter_lists_and_grids_example/page/long_list_page.dart';
import 'package:flutter_lists_and_grids_example/page/use_list_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

enum PageEnum {
  useListsPage,
  horizontalListPage,
  gridListPage,
  listWithDifferentTypesOfItemsPage,
  listWithSpacedItemsPage,
  longListsPage
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists and Grids example'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(_createRoute(PageEnum.useListsPage));
                },
                child: const Text('Go use lists page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(_createRoute(PageEnum.horizontalListPage));
                },
                child: const Text('Go horizontal list page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(_createRoute(PageEnum.gridListPage));
                },
                child: const Text('Go grid list page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      _createRoute(PageEnum.listWithDifferentTypesOfItemsPage));
                },
                child: const Text('Go list with different types of items page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(_createRoute(PageEnum.listWithSpacedItemsPage));
                },
                child: const Text('Go list with spaced items page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(_createRoute(PageEnum.longListsPage));
                },
                child: const Text('Go long lists page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Route _createRoute(PageEnum page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (page) {
        case PageEnum.useListsPage:
          return const UseListsPage();
        case PageEnum.horizontalListPage:
          return const HorizontalListPage();
        case PageEnum.gridListPage:
          return const GridListPage();
        case PageEnum.listWithDifferentTypesOfItemsPage:
          return ListWithDifferentTypesOfItemsPage(
            items: List<ListItem>.generate(
              1000,
              (i) => i % 6 == 0
                  ? HeadingItem('Heading $i')
                  : MessageItem('Sender $i', 'Message body $i'),
            ),
          );
        case PageEnum.listWithSpacedItemsPage:
          return const ListWithSpacedItemsPage();
        case PageEnum.longListsPage:
          return LongListPage(items: List<String>.generate(10000, (index) => 'items $index'));
        default:
          return const HorizontalListPage();
      }
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
