import 'package:apprendre_list_grid/widgets/list_separated.dart';
import 'package:apprendre_list_grid/widgets/simple_listview.dart';
import 'package:flutter/material.dart';

import '../models/list_type.dart';
import '../widgets/builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ListType>_lists=[
    ListType("Liste simple", Icons.list, const SimpleListView()),
    ListType("Liste Builder", Icons.settings, const BuilderWidget()),
    ListType("Liste Séparé", Icons.filter_list, const SeparatedList()),
    ListType("Liste simple", Icons.list_alt_outlined, const Center())
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _lists.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Listes et Grilles"),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            bottom: TabBar(
              tabs: _lists.map((t)=>t.tab).toList(),
            ),
          ),
          body: TabBarView(
              children: _lists.map((item)=>item.list).toList(),
          ),
        )

      ,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}