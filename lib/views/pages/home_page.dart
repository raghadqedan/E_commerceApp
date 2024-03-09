
import 'package:flutter/material.dart';

import '../widgets/category_tap_view.dart';
import '../widgets/home_tap_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Column(children:  [
           TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Category',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                HomeTapView(),
               CategoriesTapView(),
              ],
            ),
          ),



          
        ])
        );
  }
}
