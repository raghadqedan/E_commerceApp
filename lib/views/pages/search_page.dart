
import 'package:ecommerce_app/views/widgets/last_search_widget.dart';
import 'package:ecommerce_app/views/widgets/search_page_title.dart';
import 'package:ecommerce_app/views/widgets/search_product_item.dart';
import 'package:ecommerce_app/views/widgets/search_wedget.dart';
import 'package:flutter/material.dart';

import '../../models/search_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
        
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const SizedBox(
                  width: 10,
                ),
                SearchWedget(
                  title: 'Search Something',
                  width: 290,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SearchPageTitle(
              title: 'Last Search',
              needClearAll: true,
            ),
            const SizedBox(
              height: 8,
            ),
        
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: lastSearch.map((lastSearch) => LastSearchWidget(title: lastSearch)).toList(),)
            ),
        
          const SizedBox(
              height: 8,
            ),
        
            const SearchPageTitle(
              title: 'Popular Search',
            ),
           const  SizedBox(height: 16,),
            ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dummyPopularSearch.length,
              itemBuilder: ((context, index) => PopularSearchproductItem(item:dummyPopularSearch[index])))
        
        
        
          ],
        ),
      ),
    )));
  }
}
